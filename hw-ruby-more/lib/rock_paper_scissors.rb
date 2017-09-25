class RockPaperScissors
	class NoSuchStrategyError < StandardError ; end

	def self.winner(player1, player2)
		p1 = player1[1].downcase;
		p2 = player2[1].downcase;

		if (!self.valid_strat?(p1) || !self.valid_strat?(p2))		#If either one is not valid, we drop out
			raise NoSuchStrategyError.new("Strategy must be one of R,P,S")
		end
		if p1 != p2 then 
			case p1
				when 'r' then p2 == 's' ? player1: player2	#Rock beats scissors
				when 'p' then p2 == 'r' ? player1: player2	#Paper beats rock
				when 's' then p2 == 'p' ? player1: player2	#Scissors beats paper
			end
		else
			return player1		#Both are the same; player1 wins by default
		end
	end
	def self.tournament_winner(tournament)
		if (tournament[0][0].is_a? String)
			return self.winner(tournament[0], tournament[1])
		else
			return self.tournament_winner([tournament_winner(tournament[0][0]), tournament_winner(tournament[0][1])])	#Embedded array indicates tournament structure; recursively go through matches
		end
	end
	private
	def self.valid_strat?(strategy) 
		strategy =~ /[rps]/	#Searches for r p or s; any other "strategy" is invalid
	end
end
