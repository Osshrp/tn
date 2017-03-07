module IdealWeight
  def self.main
    get_data
    ideal_weight = calculate_weight(@name, @height)
    if ideal_weight < 0
      puts "Ваш вес уже идеальный"
    else
      puts "#{name}, ваш идеальный вес: #{ideal_weight}"
    end
  end

  private

  def self.get_data
    puts "Введите ваше имя"
    @name = gets.chomp
    puts "Введите ваш рост"
    @height = gets.chomp
  end

  def self.calculate_weight(name, height)
    height.to_i - 110
  end
end

IdealWeight.main
