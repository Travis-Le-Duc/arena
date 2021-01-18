# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Fighter.create(name: 'Bruce', health: 100, attack: 20)
Fighter.create(name: 'Rambo', health: 80, attack: 30)

Equipment.create(name: 'knife', force: 10, protection: 0)
Equipment.create(name: 'shield', force: 0, protection: 20)
Equipment.create(name: 'gun', force: 80, protection: 0)
