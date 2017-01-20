class MoviesController < ApplicationController
  def search
    return unless @title = params[:q]
    make_request    
    parse_response
    render('movies/show')
  end

  def show
  end

  def make_request
    uri = URI.parse("http://www.omdbapi.com/?s=#{ @title }")
    http =  Net::HTTP.new(uri.host, uri.port)
    @results = http.get(uri.request_uri)
  end

  def parse_response
    @movies = JSON.parse(@results.body)['Search']
  end
end
