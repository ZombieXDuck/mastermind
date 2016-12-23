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
    puts "The master code is #{@masterCode}"
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
    deletedItems = 0
    @returnCode = []
    tempMasterCode = Marshal.load(Marshal.dump(@masterCode))
    tempGuessCode = Marshal.load(Marshal.dump(@guessCode))
    4.times do |i|  #Checking Red Pegs
      if @guessCode[i] == @masterCode[i]
        @returnCode.push("Red")
        tempMasterCode.delete_at(i-deletedItems)
        tempGuessCode.delete_at(i-deletedItems)
        deletedItems += 1
      end
    end
    if @returnCode.length == 4 #4 Red Pegs
      puts "You have guessed the code correctly"
      return TRUE
    end
    puts "guess:#{tempGuessCode} master:#{tempMasterCode}"
    tempGuessCode.length.times do |i| #Checking White Pegs
      if tempGuessCode.include?tempMasterCode[i]
        puts "Deleting master #{tempMasterCode[i]}"
        tempMasterCode.delete_at(i)
        puts "Deleting guess #{tempGuessCode[i]}"
        @returnCode.push("White")
      end
    end
  end

end

newGame = Mastermind.new
newGame.play()
