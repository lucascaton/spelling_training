system('clear')

print "Type the level you want to play (1~3): "
level = gets.chomp.to_i

unless [1, 2, 3].include?(level)
  puts 'Invalid level. Using level 1 instead...'
  level = 1
  sleep 2
end

words = File.read('/usr/share/dict/words').split("\n")

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
