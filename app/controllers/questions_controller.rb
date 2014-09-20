class QuestionsController < ApplicationController
  def index
    @questions = Question.order(created_at: :desc)
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_param)
    if @question.save
      redirect_to @question
    else
      render :new
    end
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
      if @question.update(question_param)
        redirect_to @question
    else
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to questions_path
  end


  private
  def question_param
    params.require(:question).permit(:title, :description)
  end
end
