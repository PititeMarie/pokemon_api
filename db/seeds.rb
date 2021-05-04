# encoding: utf-8

require 'csv'

puts "Seeding required initial data ..."

csv_text = File.read(Rails.root.join('lib', 'seeds', 'pokemons.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  p = Pokemon.new
  p.number = row['#']
  p.name = row['Name']
  p.type1 = row['Type 1']
  p.type2 = row['Type 2']
  p.total = row['Total']
  p.hp = row['HP']
  p.attack = row['Attack']
  p.defense = row['Defense']
  p.special_attack = row['Sp. Atk']
  p.special_defense = row['Sp. Def']
  p.speed = row['Speed']
  p.generation = row['Generation']
  p.legendary = row['Legendary']
  p.save
end

puts "Seeding completed!"