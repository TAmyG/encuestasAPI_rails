class Api::V1::AnswersController < Api::V1::MasterApiController

	before_action :authenticate, except: [:index, :show]
	before_action :set_answer, only: [:update, :destroy]
	before_action :set_poll
	before_action(only: [:update, :destroy, :create]) { |controlador| controlador.authenticate_owner(@poll.user) }

	

	#POST /polls/1/answers
	def create
		@answer = Answer.new(answer_params)
		if @answer.save
			render template: 'api/v1/answers/show'
		else
			render json: {error: @answer.errors}, status: :unprocessable_entity
		end
	end

	#PUT /polls/1/questions/1
	def update
		if @answer.update(answer_params)
			render template: 'api/v1/answers/show'
		else
			render json: {error: @question.errors}, status: :unprocessable_entity
		end
	end

	#POST /polls/1/questions/1
	def destroy
		@answer.destroy
		head :ok
	end

	private

	def answer_params
		#params: { question => {descrition, poll_id} }
		params.require(:answer).permit(:description, :question_id)
	end

	def set_poll
		@poll = MyPoll.find(params[:poll_id])
	end

	def set_answer
		@answer = Answer.find(params[:id])
	end
end