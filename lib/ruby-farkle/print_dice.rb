# PrintDice
# one   => top_and_bottom,          empty,         middle,           empty, top_and_bottom
# two   => top_and_bottom,           left,          empty,           right, top_and_bottom
# three => top_and_bottom,           left,         middle,           right, top_and_bottom
# four  => top_and_bottom, left_and_right,          empty,  left_and_right, top_and_bottom
# five  => top_and_bottom, left_and_right,         middle,  left_and_right, top_and_bottom
# six   => top_and_bottom, left_and_right, left_and_right,  left_and_right, top_and_bottom

class PrintDice

  def initialize
    @empty            = '|         | '
    @left             = "| *       | "
    @left_and_right   = "| *     * | "
    @middle           = "|    *    | "
    @right            = "|       * | "
    @top_and_bottom   = " ---------  "
  end

  def print_dice (cup)
    # Top
    cup.each { |die| print @top_and_bottom }
    print "\n"

    # 1/3
    cup.each do |die|
      case die
      when 1
        print @empty
      when (2..3)
        print @left
      when (4..6)
        print @left_and_right
      end
    end
    print "\n"

    # 2/3
    cup.each do |die|
      case die
      when 1, 3, 5
        print @middle
      when 2, 4
        print @empty
      when 6
        print @left_and_right
      end
    end
    print "\n"

    # 3/3
    cup.each do |die|
      case die
      when 1
        print @empty
      when (2..3)
        print @right
      when (4..6)
        print @left_and_right
      end
    end
    print "\n"

    # Bottom
    cup.each { |die| print @top_and_bottom }
  end
end
