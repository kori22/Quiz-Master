class QuestionsController < ApplicationController
	before_action :set_subject
	before_action :set_question, only: [:edit, :update, :destroy]


	def index
		@questions = @subject.questions
	end

	def new
		@question = Question.new
	end

	def create
		@question = @subject.questions.build(question_param)
		if @question.save
			redirect_to subject_questions_path(params[:subject_id])
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @question.update(question_param)
			redirect_to subject_questions_path(params[:subject_id])
		else
			render 'edit'
		end
	end

	def destroy
		@question.destroy if @question.present?
		redirect_to subject_questions_path(params[:subject_id])
	end

	private
		def question_param
			params.require(:question).permit(:question, :answer)
		end

		def set_subject
			@subject = Subject.find_by_id(params[:subject_id])
		end

		def set_question
			@question = Question.find_by_id(params[:id])
		end
end
