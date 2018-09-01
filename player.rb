require './bord'
class Player
  attr_accessor :name
  STONE_NO = 1

  def initialize(name)
    @name = name
    @bord = Bord.new
  end

  def get_name
    @name
  end

  def get_stone_no
    puts STONE_NO
  end

  def put_locate_check
    @bord.put_locate_check(STONE_NO)
  end

  def put_stone(input)
    @bord.put_stone(STONE_NO,input)
  end

end
