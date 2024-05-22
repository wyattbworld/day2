RED_MAX   = 12
GREEN_MAX  = 13
BLUE_MAX = 14

file = File.open("cubes.txt")
file_data = file.readlines.map(&:chomp)
file.close

# Takes a string with a number in it and will extract it.
def get_number(s)
    return Integer(s.tr('^0-9', ''))
end

# Checks what color a string has in it.
def check_color(s)
    if s.include?("red")
        return "Red"
    elsif s.include?("blue")
        return "Blue"
    elsif s.include?("green")
        return "Green"
    else
        return "None"
    end
end

total = 0
for line in file_data do
    delimeters = [", ", ": ", "; "]
    items = line.split(Regexp.union(delimeters))
    game = 0
    r_max = 0
    g_max = 0
    b_max = 0
    for item in items do
        if item[0].chr == 'G'
            game = get_number(item)
        else
            cube_num = get_number(item)
            if check_color(item).eql? "Red" and r_max < cube_num
                r_max = cube_num
            elsif check_color(item).eql? "Blue" and b_max < cube_num
                b_max = cube_num
            elsif check_color(item).eql? "Green" and g_max < cube_num
                g_max = cube_num
            end
        end
    end
    # if r_max <= RED_MAX and b_max <= BLUE_MAX and g_max <= GREEN_MAX
    #     #puts "Game " + String(game)
    #     total+=game
    # end
    power = r_max*g_max*b_max
    total += power
end
puts total
