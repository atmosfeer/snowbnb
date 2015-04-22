class UsersController < ApplicationController



  def show
    @user = User.find(params[:id])
    @user.picture = default_picture

  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :encrypted_password, :picture)
  end

  def default_picture
  if @user.picture.empty?
    image_tag "default_picture.jpg"
  else
    @user.picture
  end
end
end
