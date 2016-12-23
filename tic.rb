class Grid
	attr_accessor :arr, :player1, :player2, :answer
	
	def initialize
		
		@arr = []
		9.times do |num|
			@arr[num] = num + 1 
		end
		@player1 = "X"
		@player2 = "O"
		@answer = 0

	end
	

	def show
		
		9.times do |num|
			if num == 3 || num == 6
				puts
				print "#{@arr[num]} "
			else
				print "#{@arr[num]} "
			end
		end
		puts 
	end

	
	def ask(player)
		
		print "Please, enter a number to replace with #{player}: "
		@answer = gets.chomp
		@answer = @answer.to_i
		@arr[@answer-1] = player

	end

	def won
		@compare1 = [@player1,@player1,@player1]
		@compare2 = [@player2,@player2,@player2]
			
		(@arr[0..2] == (@compare1 || @compare2)) || 
		(@arr[3..5] == (@compare1 || @compare2)) ||
		(@arr[6..8] == (@compare1 || @compare2)) ||
		(@arr.select.with_index { |x, i| i%3==0 } == @compare1) ||
		(@arr.select.with_index { |x, i| i%3==0 } == @compare2) ||
		(@arr.select.with_index { |x, i| i==1 || i==4 || i==7 } == @compare1) ||
		(@arr.select.with_index { |x, i| i==1 || i==4 || i==7 } == @compare2) ||
		(@arr.select.with_index { |x, i| i==2 || i==5 || i==8 } == @compare1) ||
		(@arr.select.with_index { |x, i| i==2 || i==5 || i==8 } == @compare2) ||
		(@arr.select.with_index { |x, i| i==0 || i==4 || i==8 } == @compare1) ||
		(@arr.select.with_index { |x, i| i==0 || i==4 || i==8 } == @compare2) ||
		(@arr.select.with_index { |x, i| i==2 || i==4 || i==6 } == @compare1) ||
		(@arr.select.with_index { |x, i| i==2 || i==4 || i==6 } == @compare2) 


		 
		

	end


	def start
		
		@num = 0
		

		while !won && (@num <= 8)
			


			if @num%2 == 0
				show
				ask(@player1)
			else
				show
				ask(@player2)
			end	

			@num = @num +1
								
		end

		show

	end
end

grid1 = Grid.new()
grid1.start
