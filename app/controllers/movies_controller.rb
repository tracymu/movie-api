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
    response = http_client.get(omdb_url)
    JSON.parse(response.body)['Search']
  end

  def http_client
    Net::HTTP.new(omdb_url.host, omdb_url.port)
  end

  def omdb_url
    @omdb_url ||= URI.parse("http://www.omdbapi.com/?s=#{params[:q]}")
  end
end
