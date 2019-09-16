# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if Rails.env.development?
  unless Score.exists?
    taro = User.create(
      first_name: 'Taro',
      last_name: 'Yamada',
      gender: :male,
      birthday: Date.new(1983, 2, 14)
    )
    jiro = User.create(
      first_name: 'Jiro',
      last_name: 'Tanaka',
      gender: :male,
      birthday: Date.new(1982, 11, 17)
    )
    hanako = User.create(
      first_name: 'Hanako',
      last_name: 'Yoshida',
      gender: :female,
      birthday: Date.new(1983, 10, 17)
    )
    yoko = User.create(
      first_name: 'Yoko',
      last_name: 'Ono',
      gender: :female,
      birthday: Date.new(1933, 2, 18)
    )
    Score.create(user: taro, point: 86)
    Score.create(user: hanako, point: 78)
    Score.create(user: jiro, point: 93)
    Score.create(user: taro, point: 81)
    Score.create(user: jiro, point: 88)
    Score.create(user: hanako, point: 90)
  end
end
