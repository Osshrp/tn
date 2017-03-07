class RightTriangle
  def initialize
    @sides = []
    get_data
    calculate
  end

  private

  def get_data
    puts "Введите длины сторон треугольника"
    3.times do |i|
      puts "Сторона #{i+1}:"
      @sides << gets.chomp.to_f
    end
  end

  def calculate
    if @sides.max(1)[0]**2 == @sides.min(2)[0]**2 + @sides.min(2)[1]**2
      puts "Треугольник является прямоугольным"
      if @sides.min(2)[0] == @sides.min(2)[1]
        puts "и равнобедренным"
      end
    else
      puts "Треугальник не является прямоугольным"
    end
  end
end

RightTriangle.new
