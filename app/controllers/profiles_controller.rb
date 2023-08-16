class ProfilesController < ApplicationController

  def new
    @profile_contact = ProfileContact.new
  end

  def create
    @profile_contact = ProfileContact.new(profile_params)
    if @profile_contact.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def profile_params
    year = params[:profile_contact][:birth_date]['(1i)'].to_i
    month = params[:profile_contact][:birth_date]['(2i)'].to_i
    day = params[:profile_contact][:birth_date]['(3i)'].to_i
    birth_date = Date.new(year, month, day)
  
    params.require(:profile_contact).permit(
      :patient, :gender_id, :blood_type, :family, :history, :disease, :medications, :image,
      :person, :relationship, :address, :email, :phone
    ).merge(user_id: current_user.id, birth_date: birth_date)
  end

end