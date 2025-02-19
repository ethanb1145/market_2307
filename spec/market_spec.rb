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

  describe "#vendor_names" do 
    it "shows vendor names in the market" do 
      @market.add_vendor(@vendor1)
      @market.add_vendor(@vendor2)
      @market.add_vendor(@vendor3)

      expect(@market.vendors).to eq([@vendor1, @vendor2, @vendor3])
      expect(@market.vendor_names).to eq(["Rocky Mountain Fresh", "Ba-Nom-a-Nom", "Palisade Peach Shack"])
    end
  end

  describe "#vendors_that_sell(item)" do 
    it "shows vendors in the market that sell a specific item" do
      @market.add_vendor(@vendor1)
      @market.add_vendor(@vendor2)
      @market.add_vendor(@vendor3)

      @vendor1.stock(@item1, 35)
      @vendor1.stock(@item2, 7)
      @vendor2.stock(@item3, 25)
      @vendor2.stock(@item4, 50)
      @vendor3.stock(@item1, 65)

      expect(@market.vendors_that_sell(@item1)).to eq([@vendor1, @vendor3])
      expect(@market.vendors_that_sell(@item4)).to eq([@vendor2])
    end
  end

  describe "#potential_revenue" do 
    it "shows potential revenue for the stock that the vendors have" do
      @market.add_vendor(@vendor1)
      @market.add_vendor(@vendor2)
      @market.add_vendor(@vendor3)

      @vendor1.stock(@item1, 35)
      @vendor1.stock(@item2, 7)
      @vendor2.stock(@item3, 25)
      @vendor2.stock(@item4, 50)
      @vendor3.stock(@item1, 65)

      expect(@vendor1.potential_revenue).to eq(29.75)
      expect(@vendor2.potential_revenue).to eq(345.00)
      expect(@vendor3.potential_revenue).to eq(48.75)
    end
  end

  describe "#sorted_item_list" do 
    it "returns an array of the names of all items the Vendors have in stock, sorted alphabetically" do
      @market.add_vendor(@vendor1)
      @market.add_vendor(@vendor2)
      @market.add_vendor(@vendor3)

      @vendor1.stock(@item1, 35)
      @vendor1.stock(@item2, 7)
      @vendor2.stock(@item3, 25)
      @vendor2.stock(@item4, 50)
      @vendor3.stock(@item1, 65)

      expect(@market.sorted_item_list).to eq(["Banana Nice Cream", "Peach", "Peach-Raspberry Nice Cream", "Tomato"])
    end
  end

  describe "#total_inventory" do 
    it "reports the quantities of all items sold at the market" do
      @market.add_vendor(@vendor1)
      @market.add_vendor(@vendor2)
      @market.add_vendor(@vendor3)

      @vendor1.stock(@item1, 35)
      @vendor3.stock(@item1, 65)
      @vendor2.stock(@item2, 10)
      @vendor3.stock(@item2, 20)

      expect(@market.total_inventory).to eq({
        @item1 => { quantity: 100, vendors: [@vendor1, @vendor3] },
        @item2 => { quantity: 30, vendors: [@vendor2, @vendor3] }
      })
    end
  end

  describe "#over_stocked" do 
    it "returns an array of item objects that are overstocked" do
      @market.add_vendor(@vendor1)
      @market.add_vendor(@vendor2)
      @market.add_vendor(@vendor3)

      @vendor1.stock(@item1, 35)
      @vendor2.stock(@item2, 10)
      @vendor3.stock(@item1, 25)
      @vendor3.stock(@item2, 20)

      expect(@market.overstocked_items).to eq([@item1])
    end
  end
end

