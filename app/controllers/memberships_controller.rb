class MembershipsController < ApplicationController
    def create
        membership = Membership.create!(membership_params)
        render json: membership, status: :accepted
    rescue ActiveRecord::RecordInvalid => invalid
        render json: {errors: invalid.record.errors.full_messages}, status: 422
    end

    private

    def membership_params
        params.permit(:gym_id, :client_id, :charge)
    end

end
