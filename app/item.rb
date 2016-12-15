class Item
  attr_accessor :name, :price

  @@items = []

  def initialize(name,price)
    @name = name
    @price = price

    self.class.items << self
  end

  def self.items
    @@items
  end
end
