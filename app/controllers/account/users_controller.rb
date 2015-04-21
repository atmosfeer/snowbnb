module Account
  class UsersController < BaseController

      def show
        @user = current_user
      end

      def edit
      @user = current_user
    end

    def update
      @user = current_user
      @user.update(user_params)
      if @user.save
        redirect_to account_user_path
      else
        render 'edit'
      end
    end
  end

  private

  def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :encrypted_password, :picture)
    end

end