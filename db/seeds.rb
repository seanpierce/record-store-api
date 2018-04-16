class Seed

  def self.begin
    seed = Seed.new
    seed.generate_items
  end

  def generate_items
    Item.destroy_all
    puts "Destroyed all items..."
    20.times do |i|
      item = Item.create!(
        artist: Faker::Book.author,
        title: Faker::Book.title,
        cost: Random.rand(10...40),
        image: "src/assets/items/#{Random.rand(1...8)}.jpg",
        description: Faker::Lorem.sentence(rand(20..50)).chomp('.')
      )
      puts "Item created!"
    end
  end
end

Seed.begin
