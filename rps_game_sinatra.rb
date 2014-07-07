require 'sinatra'

get '/play/:move' do
  user_move = params[:move]
  rules = {'rock' => 'scissors', 'scissors' => 'paper', 'paper' => 'rock'}
  moves = rules.keys

  if not moves.include? user_move
    next "Wrong move: #{user_move}"
  end

  comp_move = moves.sample

  if user_move == comp_move
    next "Computer choose: #{comp_move}. It's a tie."
  elsif rules[user_move] == comp_move
    next "Computer choose: #{comp_move}. You win!"
  else
    next "Computer choose: #{comp_move}. Sorry, you lose!"
  end
end

