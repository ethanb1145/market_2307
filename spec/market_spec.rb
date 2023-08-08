require './lib/item'
require './lib/vendor'
require './lib/market'

RSpec.describe Market do
  before :each do 
    @market = Market.new("South Pearl Street Farmers Market")

    @vendor1 = Vendor.new("Rocky Mountain Fresh")
    @vendor2 = Vendor.new("Ba-Nom-a-Nom")
    @vendor3 = Vendor.new("Palisade Peach Shack")

    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    @item2 = Item.new({name: 'Tomato', price: "$0.50"})
    @item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    @item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
  end

  describe "#initialize" do 
    it "gives the name of the market" do 
      expect(@market.name).to eq("South Pearl Street Farmers Market")
    end

    it "gives a list of the vendors in the market when empty" do 
      expect(@market.vendors).to eq([])
    end
  end

  describe "#add_vendor" do 
    it "can add vendor(s) to the market" do 
      @market.add_vendor(@vendor1)
      @market.add_vendor(@vendor2)
      @market.add_vendor(@vendor3)

      expect(@market.vendors).to eq([@vendor1, @vendor2, @vendor3])
    end
  end
end

