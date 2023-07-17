class ProfilesController < ApplicationController

  def new
    @profile_contact = ProfileContact.new
  end

  def create
    @profile_contact = ProfileContact.new(profile_params)
    if @profile_contact.valid?
      @profile_contact.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def profile_params
    params.require(:profile_contact).permit(
      :patient, :birth, :gender_id, :blood_type, :family, :history, :disease, :medications, :image,
      :person, :relationship, :address, :email, :phone
    ).merge(user_id: current_user.id)
  end
end
