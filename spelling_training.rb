system('clear')

print "Type the kind of game you want to play (1 - words, 2 - numbers): "
kind = gets.chomp.to_i

unless [1, 2].include?(kind)
  puts 'Invalid kind. Words will be used...'
  kind = 1
end

print "Type the level you want to play (1~3): "
level = gets.chomp.to_i

unless [1, 2, 3].include?(level)
  puts 'Invalid level. Level 1 will be used...'
  level = 1
end

words = case kind
  when 1 then File.read('/usr/share/dict/words').split("\n")
  when 2 then 1000.times.map { 8.times.map { (0..9).to_a.sample }.join }
end

print "\nPress ENTER to start..."
gets

loop do
  system('clear')

  2.times do |n|
    print "\rStarting game in LEVEL #{level} in #{2 - n} seconds..."
    sleep 1
  end

  word = words.sample.downcase.split(//)

  print "\n\nType the word: "

  Thread.new { word.each { |l| system("say #{l}") && sleep(3 - level) } }

  user_word = gets.chomp

  if user_word == word.join
    puts 'Correct'
  else
    puts "Incorrect. The word was '#{word.join}'"
  end

  print 'Press ENTER to try a new word or Ctrl+c to exit...'
  gets
end
