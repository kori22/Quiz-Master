class AnswersController < ApplicationController
	before_action :set_subject
	before_action :set_answer, only: [:show]
	before_action :cek_answer, only: [:create]


	def index
		@answers = @subject.answers
	end

	def new
		@questions = @subject.questions.order("RANDOM()").limit(@subject.tot_question)
	end


	def create
		@answer = @subject.answers.build(answer_param)
		if @answer.save
			redirect_to subject_answer_path(params[:subject_id], @answer.id)
		else
			redirect_to new_subject_answer_path(params[:subject_id])
		end
	end

	def show

	end


	private
		def answer_param
			params.require(:answer).permit(:answer, :user_id, :score, answer_detail: [:question, :is_correct, :answer])
		end

		def set_subject
			@subject = Subject.find_by_id(params[:subject_id])
		end

		def set_answer
			@answer = Answer.find_by_id(params[:id])
		end

		def cek_answer
			params[:answer] = {}
			params[:answer][:answer_detail] = []
			params[:answer][:user_id] = current_user.id
			correct_tot = 0
			params[:answer_detail].each do |answer|
				question = Question.find_by_id(answer["question_id"])
				if is_number?(answer[:answer])
					if is_number?(question.answer)
						is_correct = (question.answer.to_i == answer["answer"].to_i)
					else
						is_correct = (question.answer.downcase == answer["answer"].to_i.humanize.gsub('-', ' ').downcase)
					end
				else
					if is_number?(question.answer)
						is_correct = (question.answer.to_i.humanize.gsub('-', ' ').downcase == answer["answer"].downcase)
					else
						is_correct = (question.answer.downcase == answer["answer"].downcase)
					end
				end
				correct_tot += 1 if is_correct
				params[:answer][:answer_detail] << {
					question: question.question,
					is_correct: is_correct,
					answer: answer["answer"]
				}
			end
			params[:answer][:score] = correct_tot.to_f / params[:answer_detail].count * 100
		end

		def is_number?(string)
		  true if Float(string) rescue false
	  	end
end
