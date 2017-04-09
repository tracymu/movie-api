class MoviesController < ApplicationController
  def search
    if params[:q]
      @movies = request_movies_from_omdb
    end
  end

  def show
  end

  private

  def request_movies_from_omdb
    url = omdb_url
    response = request_movies(url)
    JSON.parse(response.body)['Search']
  end

  def request_movies(url)
    Net::HTTP.new(url.host, url.port).get(url)
  end

  def omdb_url
    URI.parse("http://www.omdbapi.com/?s=#{params[:q]}")
  end
end
