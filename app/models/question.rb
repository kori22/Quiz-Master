class Question < ApplicationRecord
	belongs_to	:subject
	has_many	:answer_details, :dependent => :destroy
	validates_presence_of [:question, :answer]
	
end
