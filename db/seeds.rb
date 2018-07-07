# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
4.times {|n| Episode.create!(episode_no: 1000 + n, title: "Sample#{n}",  link: 'http://example.com', description: 'details', subtitle: 'SUBTITLE') }

CastMember.create!(name: 'miyagawa', url: 'http://example.com')
CastMember.create!(name: 'matz', url: 'http://example.com')
CastMember.create!(name: 'hak', url: 'http://example.com')
CastMember.create!(name: 'N', url: 'http://example.com')

Contribution.create!(episode_id: 1, cast_member_id:1)
Contribution.create!(episode_id: 1, cast_member_id:2)
Contribution.create!(episode_id: 2, cast_member_id:1)
Contribution.create!(episode_id: 3, cast_member_id:1)
Contribution.create!(episode_id: 3, cast_member_id:3)
Contribution.create!(episode_id: 4, cast_member_id:1)
Contribution.create!(episode_id: 4, cast_member_id:3)
