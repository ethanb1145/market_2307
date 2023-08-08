class Vendor
  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = {}
  end

  def check_stock(item)
    if @inventory.include?(item)
      @inventory[item][:quantity]
    else
      0
    end
  end

  # def stock(item, quantity)
  #   @inventory[item][:quantity] += quantity
  # end
end