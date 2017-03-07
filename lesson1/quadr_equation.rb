class QuadraticEquation
  def initialize
    get_data
    @discriminant = calc_discriminant
    if @discriminant < 0
      string = "Уравнение не имеет корней"
      output(string)
    elsif @discriminant == 0
      calc_roots
      root = "X1 = #{@x1}"
      output(root)
    else
      calc_roots
      roots = "X1 = #{@x1}, X2 = #{@x2}"
      output(roots)
    end

  end

  private

  def get_data
    @arr = ["a", "b", "c"]
    puts "Введите коэффициенты уравнения (a,b,c)"
    3.times do |i|
      puts "#{@arr[i]}:"
      @arr[i] = gets.chomp.to_f
    end
  end

  def calc_discriminant
    @arr[1]**2 - 4 * @arr[0] * @arr[2]
  end

  def calc_roots
    @x1 = (-@arr[1] + Math.sqrt(@discriminant))/2 * @arr[0]
    @x2 = (-@arr[1] - Math.sqrt(@discriminant))/2 * @arr[0]
  end

  def output(string)
    puts "Дискриминант: #{@discriminant}"
    puts string
  end
end

QuadraticEquation.new
