module Account
  class ChaletsController < BaseController
    before_action :set_chalet, only: [:edit, :update, :destroy]
    def new
      @chalet = current_user.chalets.new
      3.times {@chalet.chalet_pictures.build}
    end

    def create
      chalet_params[:city] = chalet_params[:city].capitalize
      @chalet = current_user.chalets.new(chalet_params)
      if @chalet.save!
        flash[:notice] = "Your chalet has been added."
        redirect_to account_user_path
      else
        flash[:alert] = "Something went wrong."
        render 'new'
      end
    end

    def edit
      3.times { @chalet.chalet_pictures.build }
    end

    def update
      @chalet = Chalet.update(chalet_params)
      if @chalet.save
        flash[:notice] = "Your chalet has been updated."
        redirect_to redirect_to chalet_path(@chalet)
      else
        flash[:alert] = "Something went wrong."
        render 'edit'
      end
    end

    def destroy
      @chalet.destroy
      redirect_to account_chalets_path
    end

    def index
      @chalets = current_user.chalets.all

    end


    private
    def chalet_params
      params.require(:chalet).permit(:title, :description, :city, :daily_price, :max_nb_of_guests, :availability)
    end

    def set_chalet
      @chalet = Chalet.find(params[:id])
    end

  end
end