class UsersController < ApplicationController



  def show
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :encrypted_password, :picture)
  end
end
