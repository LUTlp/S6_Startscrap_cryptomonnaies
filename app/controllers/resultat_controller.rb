class ResultatController < ApplicationController
  def index

    @name = params[:crypto][:name]
    @price = @result[params[:crypto][:name]]
  end
end
