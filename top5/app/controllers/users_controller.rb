class UsersController < ApplicationController
  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/home'
    else
      flash[:errors] = {'class' => 'errors', :errors => user.errors.full_messages}
      redirect_to '/signup'
    end
  end

    # a catch all for security and convenience
  def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
