module Account
  class ChaletsController < BaseController
    before_action :set_chalet, only: [:edit, :update, :destroy]
    def new
      @chalet = current_user.chalets.new
    end

    def create
      chalet_params[:city] = chalet_params[:city].capitalize
      @chalet = current_user.chalets.new(chalet_params)
      if @chalet.save!
        redirect_to account_user_path
      else
        render 'new'
      end
    end

    def edit

    end

    def update
      @chalet = Chalet.update(chalet_params)
      if @chalet.save
        redirect_to redirect_to chalet_path(@chalet)
      else
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