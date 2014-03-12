class KeyboardsController < ApplicationController

  def index
  end

  def show
    @keyboard = Keyboard.find(params[:id])
  end
end
