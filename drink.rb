require_relative "./product.rb"

class Drink < Product

  attr_reader :name, :price, :alcohol_level

  def initialize(name,price,alcohol_level)
    super(name,price)
    @alcohol_level = alcohol_level
  end

end
