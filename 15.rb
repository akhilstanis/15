require 'sinatra'

def valid? board
  count = 0
  board.each { |tile| count += board.slice(board.index(tile),board.count).collect { |x| x if x < tile }.compact.count }
  ( count + 4 ) % 2
end

def get_board
  begin
    board = []
    while board.count < 15 do
      random_number = rand(15) + 1
      board << random_number unless board.include? random_number
    end
  end until valid? board
  board.join ','
end


get "/" do
  @board = get_board
  erb :game
end