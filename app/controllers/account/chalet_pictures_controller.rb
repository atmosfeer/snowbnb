module Account
  class ChaletPicturesController < BaseController

    def destroy
      @chalet_picture = ChaletPicture.find(params[:id])
      @chalet_picture.destroy
      redirect_to chalet_path(params[:chalet_id])
    end
  end
end
