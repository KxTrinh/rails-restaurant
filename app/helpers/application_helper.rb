module ApplicationHelper
  # def current_order
  #   # Use Find by id to avoid potention errors
  #   if Order.find_by_id(session[:order_id]).nil?
  #     Order.new
  #   else
  #     Order.find_by_id(session[:order_id])
  #   end
  # end

  def current_order
    # Use Find by id to avoid potention errors
    if Order.find_by(session[:order_id]).nil?
      # Example: Product.find_by(id: params[:id])
      Order.new
    else
      Order.find_by(session[:order_id])
    end
  end
end
