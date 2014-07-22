require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'erb'

get '/' do
  erb :index
end

get '/play/:move' do
  @user_move = params[:move]
  rules = {'rock' => 'scissors', 'scissors' => 'paper', 'paper' => 'rock'}
  moves = rules.keys

  @comp_move = moves.sample

  if @user_move == @comp_move
    @result = "It's a tie. Try again!"
  elsif rules[@user_move] == @comp_move
    @result = "You are winner!"
  else
    @result = "Sorry, you lose!"
  end
  erb :play
end