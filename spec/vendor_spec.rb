require './lib/item'
require './lib/vendor'

RSpec.describe Vendor do
  before :each do 
    @vendor = Vendor.new("Rocky Mountain Fresh")
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
end