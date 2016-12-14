class Answer < ApplicationRecord
	belongs_to :subject
	belongs_to :user
	has_many :answer_details, :dependent => :destroy
	accepts_nested_attributes_for :answer_details, :reject_if => :all_blank, :allow_destroy => true

	validates_presence_of [:score, :user_id]
	serialize :answer_detail
	default_scope { order(created_at: :desc) }
end
