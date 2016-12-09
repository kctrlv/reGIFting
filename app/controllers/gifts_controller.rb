class GiftsController < ApplicationController
  def update
    Gift.find(params[:id]).update_attribute(:gif, params['gift']['gif'])
    redirect_to user_path(current_user.id)
  end

  def regift
    mygif = current_user.gift.gif
    current_user.gift.destroy
    Gift.all.sample.update_attribute(:gif, mygif)
    redirect_to user_path(current_user.id)
  end
end
