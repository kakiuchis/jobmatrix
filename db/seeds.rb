# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(email: 'ssales@itpm-gk.com', password: 'mmiyatateruo', role: 0)
User.create!(email: 'sales@itpm-gk.com', password: 'miyatateruo', role: 1)
User.create!(email: 'all@itpm-gk.com', password: 'iittppmm', role: 2)
Field.create!(name: 'アプリ開発')
Field.create!(name: 'データベース')
Field.create!(name: 'インフラ')
Field.create!(name: 'サービスマネジメント')
Field.create!(name: 'WEBディレクター')
Field.create!(name: 'WEBデザイナー')
Field.create!(name: 'マークアップエンジニア')


