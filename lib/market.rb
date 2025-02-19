class Market 
  attr_reader :name, :vendors

  def initialize(name)
    @name = name
    @vendors = []
  end
  
  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    @vendors.map do |vendor|
      vendor.name
    end
  end

  def vendors_that_sell(item)
    @vendors.select do |vendor|
      vendor.inventory.include?(item)
    end
  end

  def sorted_item_list
    item_names = @vendors.flat_map do |vendor|
      vendor.inventory.keys.map(&:name)
    end
    sorted_item_names = item_names.uniq.sort
    sorted_item_names
  end

  def total_inventory
    total = {}
    @vendors.each do |vendor|
      vendor.inventory.each do |item, quantity|
        total[item] ||= { quantity: 0, vendors: [] }
        total[item][:quantity] += quantity
        total[item][:vendors] << vendor
      end
    end
    total
  end

  def overstocked_items
    overstocked_items = []
    total_inventory.each do |item, info|
      if info[:vendors].count > 1 && info[:quantity] > 50
        overstocked_items << item
      end
    end
    overstocked_items
  end
end