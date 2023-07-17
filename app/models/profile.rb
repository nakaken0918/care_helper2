class Profile < ApplicationRecord

  belongs_to :user
  has_many :contacts

  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :gender

end
