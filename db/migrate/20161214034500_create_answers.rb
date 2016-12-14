class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
    	t.integer	:subject_id
    	t.integer	:user_id
    	t.integer	:score
    	t.text		:answer_detail
      t.timestamps
    end
  end
end
