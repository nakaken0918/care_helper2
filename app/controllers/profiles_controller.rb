class ProfilesController < ApplicationController

  def new
    @profile = Profile.new
  end



  private

  def profile_params
    params.require(:profile).permit(
      :patient, :birth, :gender_id, :blood_type, :family, :history, :disease, :medications, :image
    ).merge(user_id: current_user.id)
  end
end
