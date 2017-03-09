def make_hash
  # vowels = ["a", "e", "i", "o", "u"]
  vowels = %w( a e i o u )
  h = {}
  ("a".."z").each_with_index do |key, i|
    h[key] = i + 1 if vowels.include?(key)
  end
  h
end

puts make_hash
