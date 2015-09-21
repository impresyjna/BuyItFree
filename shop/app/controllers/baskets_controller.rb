class BasketsController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  
  def new
  end

  def show
  end

  def destroy
  end

  def update
  end
end
