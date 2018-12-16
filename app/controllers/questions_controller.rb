# frozen_string_literal: true

class QuestionsController < ApplicationController

  before_action :private_access, except: [:index, :show]

  
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
    #obtener el usuario actual de la pregunta
    @question.user = current_user

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

  def destroy
    question = Question.find(params[:id])
    question.destroy
    
    redirect_to questions_path
  end

  private

  def question_params
    params.require(:question).permit(:topic, :description)
  end
end
