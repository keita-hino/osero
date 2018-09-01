require './player'
require './enemy'
require './bord'
class Controller
  def initialize
    @bord = Bord.new
    @p1 = Player.new("keita")
    @e1 = Enemy.new("naoki")
  end

  def game_start
    possible_list = []
    #盤を表示する
    @bord.get_ban
    puts ""
    puts @p1.get_name + "さんのターン"
    puts "下記の中から置く場所を選んで入力してください"
    @p1.put_locate_check
    # @p1.put_stone((gets.chomp!).to_i)

  end

end
