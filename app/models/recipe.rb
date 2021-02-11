class Api::V1::Recipe < ApplicationRecord
  belongs_to :plant
  belongs_to :user
end
