class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #before_action :login_required
  #This method checks if we have a user signed in
   #def login_required
    # if !logged_in?
     #  redirect_to signup_path, :notice=>"Log in to edit or delete your post"
     #end
   #end
    def logged_in?
      !!current_user
    end
   helper_method :logged_in?
  #This method gives us details about our user
   def current_user
      if session[:user_id]
        @current_user = User.find(session[:user_id])
        @current_user
      else
        false
      end
  end
  helper_method :current_user

  #def current_user
   # if session[:user_id]
    #  @current_user ||= User.find(session[:user_id])
    #else
     # @current_user = nil
    #end
 # end
  private

  def cart
    @cart ||= cookies[:cart].present? ? JSON.parse(cookies[:cart]) : {}
  end
  helper_method :cart

  def enhanced_cart
    @enhanced_cart ||= Product.where(id: cart.keys).map {|product| { product:product, quantity: cart[product.id.to_s] } }
  end
  helper_method :enhanced_cart

  def cart_subtotal_cents
    enhanced_cart.map {|entry| entry[:product].price_cents * entry[:quantity]}.sum
  end
  helper_method :cart_subtotal_cents


  def update_cart(new_cart)
    cookies[:cart] = {
      value: JSON.generate(new_cart),
      expires: 10.days.from_now
    }
    cookies[:cart]
  end

end
