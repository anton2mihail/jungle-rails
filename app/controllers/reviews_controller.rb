class ReviewsController < ApplicationController
  before_filter :deny_access, :unless => :logged_in?
  def create
  rev = Review.new(review_params)
    if rev.valid?
      rev.save!
      redirect_to product_path(id: params[:product_id])
    else
      redirect_to product_path(id:params[:product_id])
    end
  end

  def destroy
    review = Review.find_by(id: params[:id])
    if review
      review.destroy!
      redirect_to root_path
    else
      redirect_to root_path
    end
  end
  protected

  def logged_in?
    current_user ? true : false
  end
  private
  def review_params
    params.require(:reviews).permit(:user_id,:product_id, :user_name,:description, :rating)
  end

end
