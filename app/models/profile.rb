class Profile < ApplicationRecord

  belongs_to :user

  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :gender

  with_options presence: true do
    validates :patient
    validates :barth
    validates :gender_id, numericality: { other_than: 0, message: "can't be blank"}
    validates :blood_type
    validates :family
    validates :history
    validates :disease
    validates :medications

    validates :user_id
  end
end
