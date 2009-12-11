class ExamsController < ApplicationController
  def index
      @ex = Exam.all
    end

    def show
      @ex = Exam.find(params[:id])
    end

    def create
      # täällä luodaan exameja
    end

    def register
      @ex = Exam.find(params[:id])
      @ex.users << session[:user_id]

      redirect_to exams_url(:action => :show)
    end
end
