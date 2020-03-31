words = []
loop do
  word = gets.chomp
  break if word.empty?
  words.push(word) if word.length <= 4
end
words
