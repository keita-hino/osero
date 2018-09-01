class Bord
  def initialize
    @ban = [
      [9,9,9,9,9,9,9,9,9],
      [9,0,0,0,0,0,0,0,9],
      [9,0,0,0,0,0,0,0,9],
      [9,0,1,2,0,0,0,0,9],
      [9,0,0,2,1,0,0,0,9],
      [9,0,0,0,0,0,0,0,9],
      [9,0,0,0,0,0,0,0,9],
      [9,0,0,0,0,0,0,0,9],
      [9,9,9,9,9,9,9,9,9],
    ]
    @put_list = []
    @locate_list = []
  end

  #@ban[縦][横]
  def get_ban
    puts "  012345678"
    puts "  ---------"
    for i in 0..@ban[0].count - 1
      puts (i.to_s + "|" + @ban[i,1].join).ljust(2)
    end
  end

  def put_stone(stone_no,input)
    reverse_stone(@locate_list[input][0],@locate_list[input][1])
    # right_reverse
    # left_reverse

  end

  # def right_reverse
  #     for i in @yoko..@ban[0].count - 1
  #       if @ban[@tate][i] == @my_stone && !(@ban[@tate][i + 1] == @my_stone) && !(@ban[@tate][i + 1] == 0)
  #         puts "a#{i}"
  #         until @ban[@tate][i] == 9
  #           if @ban[@tate][i] == 0
  #               puts @ban[@tate][i]
  #               puts "OK"
  #             break
  #           end
  #           i = i + 1
  #         end
  #       end
  #     end
  # end
  #
  # def left_reverse
  #     for i in @yoko..@ban[0].count - 1
  #       if @ban[@tate][i] == @my_stone && !(@ban[@tate][i - 1] == @my_stone) && !(@ban[@tate][i - 1] == 0)
  #         puts "a#{i}"
  #         until @ban[@tate][i] == 9
  #           if @ban[@tate][i] == 0
  #               puts @ban[@tate][i]
  #               puts "OK"
  #             break
  #           end
  #           i = i - 1
  #         end
  #       end
  #     end
  # end

  def put_locate_check(stone_no)
    @my_stone = stone_no
    array = []
    right_check
    left_check
    down_check
    up_check
    diagonal_check_right_down

    diagonal_check_right_up
    diagonal_check_left_down
    diagonal_check_left_up

    # for i in 0..@put_list.count - 1
      # puts @put_list[i].split("")
    # end
    for i in 0..@put_list.count - 1
      puts i.to_s + "|" + @put_list[i]
      @locate_list.push(@put_list[i])
    end

  end

  def reverse_stone(x,y)
    @tate = x.to_i
    @yoko = y.to_i
  end

  def diagonal_check_right_down
    for i in 1..@ban[0].count - 1
      for j in 1..@ban[0].count - 1
        if @ban[i][j] == @my_stone && !(@ban[i + 1][j + 1] == @my_stone) && !(@ban[i + 1][j + 1] == 0)
          until @ban[i + 1][j + 1] == 9
            if @ban[i + 1][j + 1] == 0
              @put_list.push((i + 1).to_s + (j + 1).to_s)
              break
            end
            i = i + 1
            j = j + 1
          end
        end
      end
    end
    return @put_list
  end

  def diagonal_check_right_up
    for i in 1..@ban[0].count - 1
      for j in 1..@ban[0].count - 1
        if @ban[i][j] == @my_stone && !(@ban[i - 1][j + 1] == @my_stone) && !(@ban[i - 1][j + 1] == 0)
          until @ban[i - 1][j + 1] == 9
            if @ban[i - 1][j + 1] == 0
              @put_list.push((i - 1).to_s + (j + 1).to_s)
              break
            end
            i = i - 1
            j = j + 1
          end
        end
      end
    end
    return @put_list
  end

  def diagonal_check_left_down
    for i in 1..@ban[0].count - 1
      for j in 1..@ban[0].count - 1
        if @ban[i][j] == @my_stone && !(@ban[i + 1][j - 1] == @my_stone) && !(@ban[i + 1][j - 1] == 0)
          until @ban[i + 1][j - 1] == 9
            if @ban[i + 1][j - 1] == 0
              @put_list.push((i + 1).to_s + (j - 1).to_s)
              break
            end
            i = i + 1
            j = j - 1
          end
        end
      end
    end
    return @put_list
  end

  def diagonal_check_left_up
    for i in 1..@ban[0].count - 1
      for j in 1..@ban[0].count - 1
        if @ban[i][j] == @my_stone && !(@ban[i - 1][j - 1] == @my_stone) && !(@ban[i - 1][j - 1] == 0)
          until @ban[i - 1][j - 1] == 9
            if @ban[i - 1][j - 1] == 0
              @put_list.push((i - 1).to_s + (j - 1).to_s)
              break
            end
            i = i - 1
            j = j - 1
          end
        end
      end
    end
    return @put_list
  end

  def down_check
    for i in 1..@ban[0].count - 1
      for j in 1..@ban[0].count - 1
        if @ban[i][j] == @my_stone && !(@ban[i + 1][j] == @my_stone) && !(@ban[i + 1][j] == 0)
          until @ban[i + 1][j] == 9
            if @ban[i + 1][j] == 0
              @put_list.push((i + 1).to_s + (j).to_s)
              break
            end
            i = i + 1
          end
        end
      end
    end
    return @put_list
  end

  def up_check
    for i in 1..@ban[0].count - 1
      for j in 1..@ban[0].count - 1
        if @ban[i][j] == @my_stone && !(@ban[i - 1][j] == @my_stone) && !(@ban[i - 1][j] == 0)
          until @ban[i - 1][j] == 9
            if @ban[i - 1][j] == 0
              @put_list.push((i - 1).to_s + (j).to_s)
              break
            end
            i = i - 1
          end
        end
      end
    end
    return @put_list
  end

  #横の比較は正規表現で行けるかも
  def right_check
    for i in 1..@ban[0].count - 1
      for j in 1..@ban[0].count - 1
        if @ban[i][j] == @my_stone && !(@ban[i][j + 1] == @my_stone) && !(@ban[i][j + 1] == 0)
          until @ban[i][j + 1] == 9
            if @ban[i][j + 1] == 0
              @put_list.push(i.to_s + (j + 1).to_s)
              break
            end
            j = j + 1
          end
        end
      end
    end
    return @put_list
  end

  def left_check
    for i in 1..@ban[0].count - 1
      for j in 1..@ban[0].count - 1
        if @ban[i][j] == @my_stone && !(@ban[i][j - 1] == @my_stone) && !(@ban[i][j - 1] == 0)
          until @ban[i][j - 1] == 9
            if @ban[i][j - 1] == 0
              @put_list.push(i.to_s + (j - 1).to_s)
              break
            end
            j = j - 1
          end
        end
      end
    end
    return @put_list
  end

end
