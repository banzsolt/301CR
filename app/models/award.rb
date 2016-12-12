class Award < ApplicationRecord

  has_many :player_awards, :dependent => :delete_all

  belongs_to :game

end
