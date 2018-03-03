
if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

require "digest"

puts "Введите слово или фразу для шифрования:"

user_input = STDIN.gets.chomp

puts "Каким способом зашифровать:
1. MD5
2. SHA1"

user_choice = STDIN.gets.chomp.to_i

puts "Вот что получилось:"

case user_choice
  when 1
    puts Digest::MD5.hexdigest(user_input)
  when 2
    puts Digest::SHA1.hexdigest(user_input)
end