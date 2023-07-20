class ProfilesController < ApplicationController

  def new
    @profile_contact = ProfileContact.new
  end

  def create
    @profile_contact = ProfileContact.new(profile_params)
    if @profile_contact.valid?
      birth_date_str = params[:profile_contact]["birth_date(1i)"] + "-" + params[:profile_contact]["birth_date(2i)"] + "-" + params[:profile_contact]["birth_date(3i)"]
      @profile_contact.birth_date = Time.parse(birth_date_str)
      @profile_contact.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def profile_params
    params.require(:profile_contact).permit(
      :patient, :birth_date, :gender_id, :blood_type, :family, :history, :disease, :medications, :image,
      :person, :relationship, :address, :email, :phone
    ).merge(user_id: current_user.id)
  end
  
end