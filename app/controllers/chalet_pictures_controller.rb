class ChaletPicturesController < ApplicationController

  def destroy
    @chalet_picture = ChaletPicture.find(params[:id])
    @chalet_picture.destroy
    redirect_to account_chalet_path(params[:chalet_id])
  end
end
