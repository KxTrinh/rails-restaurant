class MenusController < ApplicationController
  before_action :set_cats

  def index
    @products = Product.all
    @page = 'menu'

    if params[:query].present?
      @products = @products.where('name ILIKE ?', "%#{params[:query]}%")
    end

    if params[:filter].present?
      if params[:filter] == 'Select Filter'
        @products = @products.where('name ILIKE ?', "%#{params[:query]}%")
      else
        # 'Dairy free' -> 'Dairy_free' -> 'dairy_free' -> :dairy_free
        symbol = params[:filter].gsub(/ /, '_').downcase!.to_sym
        # @products = results.where(:dairy_free => true)
        @products = @products.where(symbol => true)
      end
    end

    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: "menus/products", locals: { products: @products }, formats: [:html] }
    end
  end

  # def search
  #   query = params[:search]

  #   results = Product.where('name LIKE?', "%#{query}%")
  #   if params[:filter] == 'Select Filter'
  #     @products = results
  #   else
  #     # 'Dairy free' -> 'Dairy_free' -> 'dairy_free' -> :dairy_free
  #     symbol = params[:filter].gsub(/ /, '_').downcase!.to_sym
  #     # @products = results.where(:dairy_free => true)
  #     @products = results.where(symbol => true)
  #   end
  # end

  private

  def set_cats
    @cats = Category.all.where(display: true)
  end
end
