class TriangleArea
  def initialize
    get_data
    put_area calculate_area
  end

  private

  def get_data
    puts "Введите основание треуголника"
    @base = gets.chomp.to_f
    puts "Введите высоту треуголника"
    @height = gets.chomp.to_f
  end

  def calculate_area
    1.0 / 2 * @base * @height
  end

  def put_area(area)
    puts "Площадь треугольника = #{area}"
  end
end

TriangleArea.new
