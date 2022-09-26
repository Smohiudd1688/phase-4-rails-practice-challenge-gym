class GymsController < ApplicationController
    def show
        gym = Gym.find_by(id: params[:id])
        if gym
            render json: gym, status: :ok
        else
            render json: {error: "gym not found"}, status: :not_found
        end
    end

    def destroy
        gym = Gym.find_by(id: params[:id])
        if gym
            gym.destroy
            head :no_content
        else
            render json: {error: "gym not found"}, status: :not_found
        end
    end
end
