class ProfileContact
  include ActiveModel::Model
  attr_accessor :patient, :birth, :gender_id, :blood_type, :family, :history, :disease, :medications, :user_id,
                :person, :relationship, :address, :email, :phone

  with_options presence: true do
    validates :patient
    validates :barth
    validates :gender_id, numericality: { other_than: 0, message: "can't be blank"}
    validates :blood_type
    validates :family

    validates :person
    validates :relationship
    validates :address
    validates :email
    validates :phone

    validates :history
    validates :disease
    validates :medications
    validates :user_id
  end

  def save
    profile = Profile.create(
      patient: patient, birth: birth, gender_id: gender_id, blood_type: blood_type, family: family, history: history, disease: desease, medications:medications, user_id: user.id
    )
    Contact.create(
      person: person, relationship: relationship, address: address, email: email, phone: phone, profile_id: profile.id
    )
  end
end