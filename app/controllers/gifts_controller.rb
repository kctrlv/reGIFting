class GiftsController < ApplicationController
  def update
    Gift.find(params[:id]).update_attribute(:gif, params['gift']['gif'])
    redirect_to user_path(current_user.id)
  end

  def regift
    mygif = current_user.gift.gif
    Gift.all.sample.update_attribute(:gif, mygif)
    current_user.gift.destroy
    redirect_to user_path(current_user.id)
  end
end
