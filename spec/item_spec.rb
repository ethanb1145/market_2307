require './lib/item'

RSpec.describe Item do
  before :each do 
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    @item2 = Item.new({name: 'Tomato', price: "$0.50"})
  end

  describe "#initialize" do 
    it "gives the name of the item" do 
      expect(@item2.name).to eq("Tomato")
    end
  end

  describe "#initialize" do 
    it "gives the price of the item" do 
      expect(@item2.price).to eq(0.5)
    end
  end
end