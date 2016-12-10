class Award < ApplicationRecord

  has_many :player_awards

  belongs_to :game

end
