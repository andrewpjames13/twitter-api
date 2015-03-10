class WelcomeController < ApplicationController

  def index
    @client = TwitterFetcher.new
  end

end
