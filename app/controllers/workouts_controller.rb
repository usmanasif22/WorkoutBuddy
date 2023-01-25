class WorkoutsController < ApplicationController
    before_action :authenticate_user!
    def index
        @workouts = Workout.where("workouts.user_id = ?", current_user.id).order(created_at: :desc)

        if @workouts.present?
            return @workouts
        else
            return @message="No workouts available"
        end
    end

    def show
        @workout = Workout.find(params[:id])
        if @workout.present?
            return @workout
        else
            return @message="No workout with that Id"
        end
    end

    def new
        @workout = Workout.new
    end

    def create
        if workout_params[:title].present?
            # byebug
            @workout = Workout.create(workout_params)
            @workout.user = current_user
            @workout.save
            redirect_to workouts_path
        end
    end 

    def edit
        @workout = Workout.find(params[:id])
    end

    def update
        @workout = Workout.find(params[:id])
        @workout.update(workout_params)
        redirect_to workout_path(workout)
    end
    
    def destroy
        @workout = Workout.find(params[:id])
        @workout.destroy
        redirect_to workouts_path
    end
    
    private
    def workout_params
        params.require(:workout).permit(:title,:load,:reps)
    end
end
