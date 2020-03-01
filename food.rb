require_relative("./product.rb")

class Food < Product

  def initialize(name,price,rejuvenation_level)
    super(name,price)
    @rejuvenation_level = rejuvenation_level 
  end

end
