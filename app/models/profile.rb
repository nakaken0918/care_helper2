class Profile < ApplicationRecord

  belongs_to :user

  has_one_attached :image

  with_options presence: true do
    validates :patient
    validates :parth
    validates :gender_id
    validates :blood_type
    validates :family
    validates :history
    validates :disease
    validates :medications

    validates :user_id
  end
end
