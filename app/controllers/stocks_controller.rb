class StocksController < ApplicationController
  def search
    if params[:stock].blank?
      flash.now[:danger] = "Debe ingresar un símbolo"
    else
      @stock = Stock.new_from_lookup(params[:stock])
      flash.now[:danger] = "Símbolo incorrecto" unless @stock
    end
    respond_to do |format|
      format.js { render partial: 'users/result' }
    end
  end
end