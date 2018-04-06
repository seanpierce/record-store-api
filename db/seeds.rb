class Seed

  def self.begin
    seed = Seed.new
    seed.generate_items
  end

  def generate_items
    20.times do |i|
      item = Item.create!(
        artist: Faker::Book.author,
        title: Faker::Book.title,
        cost: Random.rand(10...40)
      )
      puts "Item created!"
    end
  end
end

Seed.begin
