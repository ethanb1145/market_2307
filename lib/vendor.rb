class Vendor
  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = {}
  end

  def check_stock(item)
    if @inventory.include?(item)
      { quantity: @inventory[item][:quantity], value: @inventory[item][:value] }
    else
      0
    end
  end

  def stock(item, quantity)
    @inventory[item] += quantity
  end
end