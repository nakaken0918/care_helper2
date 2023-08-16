class ProfileContact
  include ActiveModel::Model
  attr_accessor :patient, :birth_date, :gender_id, :blood_type, :family, :history, :disease, :medications, :user_id,
                :person, :relationship, :address, :email, :phone, :image

  validate :validate_image

  with_options presence: true do
    validates :patient
    validates :birth_date
    validates :gender_id, numericality: { other_than: 0, message: "を選択してください"}
    validates :blood_type
    validates :family

    validates :person
    validates :relationship
    validates :address
    validates :email
    validates :phone, length: {minimum: 10, message: "は10桁以上を入力してください"}, format: {with: /\A[0-9]{10,11}\z/, message: "は半角数値を入力してください"}

    validates :history
    validates :disease
    validates :medications
  end

  def save
    profile = Profile.create(
      patient: patient, birth_date: birth_date, gender_id: gender_id, blood_type: blood_type, family: family, history: history, disease: disease, medications:medications
    )
    Contact.create(
      person: person, relationship: relationship, address: address, email: email, phone: phone
    )
  end

  private

  def validate_image
    if image.blank?
      errors.add(:image, "のファイルを選択してください")
    end
  end
end