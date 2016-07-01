

class Player
	attr_accessor :name, :blood, :mana
		def initialize nama
			@name = nama
			@blood = 100
			@mana = 40
		end
	def attack
		@mana = @mana - 10
	end
	def defend
		@blood = @blood - 25
	end
end
class Main
	players = Hash.new
	status_game = "start"
	status_fight = "not_over"
	puts "# ============================== #
# Welcome to the Battle Arena #
# ------------------------------------------------- ---- #
# Description: #
# 1 type 'new' to create a character #
# 2. type 'start' to begin the fight #
# ------------------------------------------------- ---- #
# Current Player: #{players.count}
# - #
# * Max player 2 or 3 #
# ------------------------------------------------- ---- #"

	while status_game != "end" do
	players_count = players.count
	command = gets.chomp
		if command.eql? "new"
			if players_count >= 3
				puts 'Player has Max'
			else
				puts '# ============================== #
# Welcome to the Battle Arena #
# ------------------------------------------------- ---- #
# Description: #
# 1 type "new" to create a character #
# 2. type "start" to begin the fight #
# ------------------------------------------------- ---- #
# Put Player Name: <nama_player> #
# - #
# * Max player 2 or 3 #'
					gets_input_player = gets.chomp
					players[gets_input_player] = Player.new gets_input_player
					puts '# =============================== #
# Welcome to the Battle Arena #
# ------------------------------------------------- ---- #
# Description: #
# 1 type "new" to create a character #
# 2. type "start" to begin the fight #
# ------------------------------------------------- ---- #
# Current Player: 1 #
# 1 - '+gets_input_player+' #
# * Max player 2 or 3 #
# ------------------------------------------------- ---- #'
				puts "# ============================== #
# Welcome to the Battle Arena #
# ------------------------------------------------- ---- #
# Description: #
# 1 type 'new' to create a character #
# 2. type 'start' to begin the fight #
# ------------------------------------------------- ---- #
# Current Player: #{players.count}
# - #"
	players.each{ |players,words| puts "# " + players}
		puts "# * Max player 2 or 3 #
# ------------------------------------------------- ---- #"
			end
		elsif command.eql? "start"
			while status_fight != "over" do
			puts '# ============================== #
# Welcome to the Battle Arena #
# ------------------------------------------------- ---- #
Battle Start:
who will attack: '
				attacker = gets.chomp
puts 'who attacked: '
				attacked = gets.chomp
puts 'Description:'
				if attacker.eql? attacked
puts "Name dont same"
				else
					players[attacked].defend
					players[attacker].attack	
puts "#{players[attacker].name}: manna = #{players[attacker].mana} blood = #{players[attacker].blood}"
puts "#{players[attacked].name}: manna = #{players[attacked].mana} blood = #{players[attacked].blood}"
					if players[attacked].blood.eql? 0
						puts 'Game Over'
						status_fight = "over"	
						status_game = "game_over"	
					end
				end
			end
		elsif command.eql? "end"
			status_fight = "over"	
			status_game = "game_over"
		end
	end
end

Main.new
