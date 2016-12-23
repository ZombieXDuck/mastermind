class Mastermind
  public
  def initialize
    @masterCode = []
    @guessCode = []
    @returnCode = []
    @colours = ["blue", "green", "red", "pink"]
    @turn = 0
  end

  def play
    gameOver = FALSE
    generateCode
    puts "Possible colours #{@colours}"
    until gameOver == TRUE || @turn == 12
      puts "Turn #{@turn+=1}"
      guess
      gameOver = compare
      puts "return code is #{@returnCode}"
    end
    puts "The master code was #{@masterCode}"
  end

  private
  def generateCode
    4.times do |i|
      @masterCode[i] = @colours.sample
    end
  end

  def guess
    4.times do |i|
      print "guess position #{i+1}: "
      @guessCode[i] = gets.chomp.downcase()
    end
  end

  def compare
    @returnCode = []
    4.times do |i|  #Checking Red Pegs
      if @guessCode[i] == @masterCode[i]
        @returnCode.push("Red")
      end
    end
    if @returnCode.length == 4 #4 Red Pegs
      puts "You have guessed the code correctly"
      return TRUE
    end
  end

end

newGame = Mastermind.new
newGame.play()
