class Enemy
  attr_accessor :name
  STONE_NO = 1
  
  def initialize(name)
    @name = name
  end

  def get_name
    puts @name
  end

  def get_stone_no
    puts STONE_NO
  end

end
