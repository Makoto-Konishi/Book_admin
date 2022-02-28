class Book < ApplicationRecord
  scope :costly, -> { where("price > ?", 3000) }
  scope :written_about, ->(theme) { where("name like ?", "%#{theme}") }

  belongs_to :publisher
  has_many :book_authors
  has_many :authors, through: :book_authors

  before_validation :add_lovely_to_cat
  after_destroy :if => :high_price? do
    Rails.logger.info "Book with high price is deleted: #{self.attributes}"
  end

  validates :name, presence: true
  validates :name, length: { maximum: 25 }
  validates :price, numericality: { greater_than_or_equal_to: 0 }

  validate { |book| book.errors[:name] << "I don't like exercise" if book.name.include?('exercise') }

  def add_lovely_to_cat
    self.name = self.name.gsub(/[cC]at/) { |matched| "lovely #{matched}" }
  end

  def high_price?
    self.price >= 5000
  end
end
