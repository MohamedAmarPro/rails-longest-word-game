class GamesController < ApplicationController
  def new
    @letters = []
    10.times do
      @letters << ('a'..'z').to_a.sample
    end
  end


  def score
    @letters = params[:letters].chars
    @word = params[:word]

    if included?(@word, @letters)
      @score = @word.size * 10
    else
      @score = 0
    end
  end

  def included?(word, letters)
    word.chars.all? { |letter| word.count(letter) <= letters.count(letter) }
  end


end
