class Api::V1::QuestionsController < ApplicationController

	before_action :authenticate, except: [:index, :show]
	before_action :set_question, only: [:show, :update, :delete]
	before_action :set_poll

	#GET /polls/1/questions
	def index		
		@questions = @poll.questions
	end

	#GET /polls/1/questions/2
	def show
	end

	#POST /polls/1/questions
	def create
		@question = @poll.questions.new(question_params)
		if @question.save
			render template: 'api/v1/questions/show'
		else
			render json: {error: @question.errors}, status: :unprocessable_entity
		end
	end

	#PUT /polls/1/questions/1
	def update
	end

	#POST /polls/1/questions/1
	def delete
	end

	private

	def question_params
		#params: { question => {descrition, poll_id} }
		params.require(:question).permit(:descrition)
	end

	def set_poll
		@poll = MyPoll.find(params[:poll_id])
	end

	def set_question
		@question = Question.find(params[:id])
	end
end