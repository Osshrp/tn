def make_hash
  vowels = ["a", "e", "i", "o", "u"]
  i = 0
  ("a".."z").each_with_object({}) do |key, h|
    i += 1
    h[key] = i if vowels.include?(key)
  end
end

puts make_hash
