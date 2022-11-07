class MenusController < ApplicationController
  def index
    @products = Product.all
    @page = 'menu'
  end
end
