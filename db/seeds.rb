# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Publisher.create(
  name: 'テストユーザー',
  address: '東京都北区赤羽1-1-1'
)

(1..20).each do |i|
  Book.create(
    name: "Book #{i}",
    published_on: Date.today.days_ago(i),
    price: "#{i}000".to_i,
    sales_status: :now_on_sale,
    publisher_id: 1
  )
end