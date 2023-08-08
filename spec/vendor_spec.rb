require './lib/item'
require './lib/vendor'

RSpec.describe Vendor do
  before :each do 
    @vendor = Vendor.new("Rocky Mountain Fresh")
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    @item2 = Item.new({name: 'Tomato', price: "$0.50"})
  end

  describe "#initialize" do 
    it "gives the name of the vendor" do 
      expect(@vendor.name).to eq("Rocky Mountain Fresh")
    end

    it "gives the inventory of the vendor when empty" do 
      expect(@vendor.inventory).to eq({})
    end
  end

  describe "#check_stock, #stock" do 
    it "stocks a given item" do
      expect(@vendor.check_stock(@item1)).to eq(0)
      expect(@vendor.check_stock(@item2)).to eq(0)
      expect(@vendor.check_stock(@item3)).to eq(0)

      @vendor.stock(@item1, 30)
      @vendor.stock(@item1, 25)
      @vendor.stock(@item2, 12)

      expect(@vendor.check_stock(@item1)).to eq(55)
      expect(@vendor.check_stock(@item2)).to eq(12)
      expect(@vendor.inventory).to eq({@item1 => 55, @item2 => 12})
    end
  end
end