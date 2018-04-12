class Seed

  def self.begin
    seed = Seed.new
    seed.generate_items
  end

  def generate_items
    Item.destroy_all
    20.times do |i|
      item = Item.create!(
        artist: Faker::Book.author,
        title: Faker::Book.title,
        cost: Random.rand(10...40),
        image: "src/assets/items/#{Random.rand(1...8)}.jpg"
      )
      puts "Item created!"
    end
  end
end

Seed.begin
