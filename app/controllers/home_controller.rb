class HomeController < ApplicationController
  def index
    @result=StartScrap.new.perform
  end
end
