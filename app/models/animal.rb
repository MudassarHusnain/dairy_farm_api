class Animal < ApplicationRecord
  has_one_attached :picture
  validates :date_of_birth ,presence: true
  validates :status, presence: true

    end
