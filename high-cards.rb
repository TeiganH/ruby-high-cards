#build deck and shuffle
class Deck
    attr_reader :deck
    def initialize
        @values = [2, 3, 4, 5, 6, 7, 8, 9, 10, "Jack", "Queen", "King", "Ace"]
        @suits = ["Clubs", "Diamonds", "Hearts", "Spades"]
        @deck = []
       build_deck
    end
    
    def build_deck
        @values.each do |value|
            @suits.each do |suit|
                card = [value, suit]
                @deck.push(card)
            end
        end
        return @deck.shuffle!
    end
end

#play the game
class Playgame
    def initialize
        @players = []
        players
    end

    #create players
    def players
        puts "Enter player name"
        name = gets.chomp.downcase
        if name == 'play'
            start_game
        end
        @players.push(name)
    
        puts "#{@players.length} players so far. Enter player 2 name or type play."
        name = gets.chomp.downcase
        if name == 'play'
            start_game
        end
        @players.push(name)

        puts "#{@players.length} players. Type play to begin."
        name = gets.chomp.downcase
        if name == 'play'
            start_game
        end
    end

    # game init
    def start_game
        @deck = Deck.new
        deck = @deck.deck
        @player1card = deck[rand deck.length]
        @player2card = deck[rand deck.length]
        puts "#{@players[0]} has #{@player1card} and #{@players[1]} has #{@player2card}"
        high_card
    end

    # who has higher card?
    def high_card
        player1 = get_value(@player1card)
        player2 = get_value(@player2card)
        if player1 > player2
            puts "#{@players[0]} wins!"
        elsif player1 < player2
            puts "#{@players[1]} wins!"
        else puts "It's a tie!"
        end
        round_two
    end

    # want to play again?
    def round_two
        puts "Play again? yes or no: "
        input = gets.chomp.downcase
        if input == 'yes' || 'y'
            new_game = Playgame.new
        end
    end

    #card values
    private
    def get_value(card)
        if card[0] == "Jack"
            11
        elsif card[0] == "Queen"
            12
        elsif card[0] == "King"
            13
        elsif card[0] == "Ace"
            14
        else card [0]
        end
    end
end

new_game = Playgame.new
