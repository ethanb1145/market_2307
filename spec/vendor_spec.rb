require './lib/item'
require './lib/vendor'

RSpec.describe Vendor do
  before :each do 
    @vendor = Vendor.new("Rocky Mountain Fresh")
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
  end

  describe "#initialize" do 
    it "gives the name of the vendor" do 
      expect(@vendor.name).to eq("Rocky Mountain Fresh")
    end
  end

  describe "#initialize" do 
    it "gives the inventory of the vendor" do 
      expect(@vendor.inventory).to eq({})
    end
  end

  describe "#check_stock" do 
    it "gives the stock of the item that has no stock" do 
      expect(@vendor.check_stock(@item1)).to eq(0)
    end
  end

  describe "#stock" do 
    it "stocks a given item" do 
      @vendor.stock(@item1, 30)
      expect(@vendor.check_stock(@item1)).to eq(30)
      expect(@vendor.inventory).to eq({@item1 => 30})
    end
  end
end