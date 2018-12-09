# frozen_string_literal: true

class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)

    if @question.save
      redirect_to questions_path, notice: 'Tu pregunta ha sido publicada con exito!'
    else
      render :new
    end
  end

  def edit
    @question = Question.find(params[:id])      
  end

  def update
    @question = Question.find(params[:id])
    
    if @question.update(question_params)
        redirect_to questions_path, notice: "Tu pregunta ha sido actualizada!"
    else
        render :edit
    end

      
  end


  private

  def question_params
    params.require(:question).permit(:topic, :description)
  end
end
