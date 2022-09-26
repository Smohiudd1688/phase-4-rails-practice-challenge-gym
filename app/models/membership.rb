class Membership < ApplicationRecord
    belongs_to :gym
    belongs_to :client

    validate :only_one_per_gym

    def only_one_per_gym
        client = Client.find(client_id)
        client.gyms.each do |gym|
            if gym.id == gym_id
                errors.add(:gym_id, "can't add multiple memberships to same gym")
            end
        end
    end

end
