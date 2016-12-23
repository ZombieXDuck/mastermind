class Mastermind
  def initialize
    @masterCode = []
    @guessCode = []
    @returnCode = []
    @colours = ["Blue", "Green", "Red", "Pink"]
    @turn = 0
  end

  def play
    gameOver = FALSE
    until gameOver == TRUE
      generateCode
      guess
      gameOver = compare
      puts "return code is #{@returnCode}"
    end
    puts "The master code was #{@masterCode}"
  end

  def generateCode
    4.times do |i|
      @masterCode[i] = @colours.sample
    end
    puts @masterCode
  end

  def guess
    4.times do |i|
      print "guess position #{i+1}: "
      @guessCode[i] = gets.chomp()
    end
  end

  def compare
    @returnCode = []
    4.times do |i|  #Checking Red Pegs
      if @guessCode[i] == @masterCode[i]
        @returnCode.push("Red")
      end
    end
    if @guessCode.length == 4 #4 Red Pegs
      puts "You have guessed the code correctly"
      return TRUE
    end
  end

end

newGame = Mastermind.new
newGame.play()
