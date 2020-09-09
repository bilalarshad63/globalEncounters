class Camp < ApplicationRecord
	after_initialize :init
	
	validates :camp_type, inclusion: { in: %w(virtual real) }
	validates :camp_title, presence: true
	validates :applicant_registration_start_date, presence: true
	validates :applicant_registration_end_date, presence: true
	validates :applicant_registration_start_time, presence: true
	validates :applicant_registration_end_time, presence: true
	validates :parent_application_start_date, presence: true
	validates :parent_application_end_date, presence: true
	validates :parent_application_start_time, presence: true
	validates :parent_application_end_time, presence: true
	validate :validate_time_date

private
	def init
    self.camp_status ||= 0.0           #will set the default camp status to Inactive
  end

  def validate_time_date

    if applicant_registration_start_date > applicant_registration_end_date || parent_application_start_date > parent_application_end_date
      errors.add(:end_date, "must be after the start date")
    end
 end

end