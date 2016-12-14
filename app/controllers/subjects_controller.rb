class SubjectsController < ApplicationController
	before_action :set_subject, only: [:edit, :update, :destroy]

	def index
		@subjects = Subject.all
	end

	def new
		@subject = Subject.new
	end

	def create
		@subject = Subject.new(subject_param)
		if @subject.save
			redirect_to subjects_path
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @subject.update(subject_param)
			redirect_to subjects_path
		else
			render 'edit'
		end
	end

	def destroy
		@subject.destroy if @subject.present?
		@subjects = Subject.all
		render 'index'
		
	end

	private
		def subject_param
			params.require(:subject).permit(:code, :name, :description, :duration, :tot_question)
		end

		def set_subject
			@subject = Subject.find_by_id(params[:id])
		end
end
