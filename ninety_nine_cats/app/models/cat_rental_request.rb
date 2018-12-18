# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :bigint(8)        not null, primary key
#  cat_id     :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string           default("PENDING"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CatRentalRequest < ApplicationRecord
  STATUSES = ['PENDING', 'APPROVED', 'DENIED'].freeze 
  validates :cat_id, :start_date, :end_date, :status, presence: true 
  validates :status, inclusion: { in: STATUSES }

  include ActionView::Helpers::DateHelper

  belongs_to :cat,
  foreign_key: :cat_id,
  class_name: :Cat

  def overlapping_requests
    CatRentalRequest.where(
        "cat_id = #{self.cat_id} AND NOT
        ('#{self.end_date}' < start_date AND 
        '#{self.start_date}' > end_date)
        AND id <> #{self.id}")
  end


  def overlapping_approved_requests
    overlapping_requests.where(
      "status = 'APPROVED'"
    )
  end

  def does_not_overlap_approved_request
    # CatRentalRequest.exists?(self.overlapping_approved_requests)
    overlapping_approved_requests.empty?
  end



end
