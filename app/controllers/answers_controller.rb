class AnswersController < ApplicationController

  def new
    @answer = Answer.new
    @question = Question.find(params[:question_id])
  end

  def create
    @answer = Answer.new(answer_param)
    @question = Question.find(params[:question_id])
    @answer.question_id = @question.id
    if @answer.save
      redirect_to question_path(params[:question_id])
    else
      @question = Question.find(params[:question_id])
      render :new
    end
  end


  private
  def answer_param
  params.require(:answer).permit(:description)
  end

end



