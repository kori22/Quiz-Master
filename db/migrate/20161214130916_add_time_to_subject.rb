class AddTimeToSubject < ActiveRecord::Migration[5.0]
  def change
  	add_column :subjects, :duration, :integer, default: 60
  	# add_column :subjects, :tot_question, :integer, default: 5
  end
end
