class Workout < ApplicationRecord
    validates :title , presence: true
    belongs_to :user
end
