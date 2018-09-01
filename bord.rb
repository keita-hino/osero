class Bord
  def initialize
    @ban = [
      [9,9,9,9,9,9,9,9,9],
      [9,0,0,0,0,0,0,0,9],
      [9,0,0,0,0,0,0,0,9],
      [9,0,0,1,2,0,0,0,9],
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
    right_check("i","j + 1")
    left_check("i","j - 1")
    up_check("i - 1","j")
    down_check("i + 1","j")
    right_down_check("i + 1","j + 1")
    right_up_check("i - 1","j + 1")
    left_down_check("i + 1","j - 1")
    left_up_check("i - 1","j - 1")

    for i in 0..@put_list.count - 1
      puts i.to_s + "|" + @put_list[i]
      @locate_list.push(@put_list[i])
    end

  end

  def reverse_stone(x,y)
    @tate = x.to_i
    @yoko = y.to_i
  end

  def method_missing(method,*args)
    unless method !~ /.*check/
      check(args[0],args[1])
    end
  end

  def check(x,y)
    a = <<-LOOP
    for i in 1..@ban[0].count - 1
      for j in 1..@ban[0].count - 1
        if @ban[i][j] == @my_stone && !(@ban[#{x}][#{y}] == @my_stone) && !(@ban[#{x}][#{y}] == 0)
          until @ban[#{x}][#{y}] == 9
            if @ban[#{x}][#{y}] == 0
              @put_list.push((#{x}).to_s + (#{y}).to_s)
              break
            end
            i = #{x}
            j = #{y}
          end
        end
      end
    end
    LOOP
    eval(a)
  end

end
