class SeedDataInTheTable < ActiveRecord::Migration[7.0]
    def up
      5.times do |i|
        Country.create(name: "Product ##{i}", citiy: "A product." )
      end
    end
  
    def down
      Country.delete_all
    end
end
