class ExerciseGroupsController < ApplicationController
  
  def index
      @eg = ExerciseGroup.all
    end

    def show
      @eg = ExerciseGroup.find(params[:id])
    end

    def create
      # täällä luodaan exercise_grouppeja
    end

    def register
      @eg = ExerciseGroup.find(params[:id])
      
      if @eg.users.nitems < @eg.max_registrations
        @eg.users << session[:user_id]
      end

      redirect_to exercise_groups_url(:action => :show)
    end
  
  
end
