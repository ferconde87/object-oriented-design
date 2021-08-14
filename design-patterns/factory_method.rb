class CardGame
  class << self
    def createCardGame(game_class)
      case game_class.name
      when "PokerGame"
        return PokerGame.new
      when "BlackJackGame"
        return BlackJackGame.new
      when "TrucoGame"
        return TrucoGame.new
      end
    end
  end
end

class PokerGame < CardGame
end

class BlackJackGame < CardGame
end

class TrucoGame < CardGame
end

# (!) note case compare using === 
# so PokerGame === PokerGame is false
# that is why we need to use a literal

