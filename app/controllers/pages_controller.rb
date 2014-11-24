class PagesController < ApplicationController
require 'open-uri'
require 'json'

  def game
    @grid_array = []
    9.times do
      @grid_array << ('A'..'Z').to_a[rand(26)]
    end

  end

  def score
    @attempt = params[:attempt]
    @start_time = params[:start_time]
    @end_time = Time.now
    @result_time = (@end_time.to_i - @start_time.to_i)/60000

    url_api = "http://api.wordreference.com/0.8/80143/json/enfr/"
    @hash_result = JSON.parse(open(url_api + @attempt ).read)
    @translation = @hash_result["term0"]["PrincipalTranslations"]["0"]["FirstTranslation"]["term"]

  end
end
