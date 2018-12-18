# == Schema Information
#
# Table name: cats
#
#  id          :bigint(8)        not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Cat < ApplicationRecord
  COLORS = ["brown", "black", "white", "snickers"].freeze
  validates :sex, inclusion: { in: ["M", "F"] }
  validates :color, inclusion: { in: COLORS }
  validates :birth_date, :color, :name, :sex, presence: true 
  include ActionView::Helpers::DateHelper

  has_many :cat_rental_requests,
  foreign_key: :cat_id,
  class_name: :CatRentalRequest,
  dependent: :destroy

  def age
    distance_of_time_in_words(birth_date, Time.now)
  end

  def colors
    COLORS
  end

end
