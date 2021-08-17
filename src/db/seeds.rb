# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# メインのサンプルユーザーを1人作成する
User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "aaaaaaaa",
             password_confirmation: "aaaaaaaa",
             activated: true,
             activated_at: Time.zone.now)

# 追加のユーザー
User.create!(name:  "太郎",
             email: "example1@railstutorial.org",
             password:              "aaaaaaaa",
             password_confirmation: "aaaaaaaa",
             activated: true,
             activated_at: Time.zone.now)
