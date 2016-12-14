class Subject < ApplicationRecord
	has_many	:questions, :dependent => :destroy
	has_many	:answers, :dependent => :destroy

	validates_presence_of [:code, :name]
	default_scope { order(created_at: :desc) }
end
