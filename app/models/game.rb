class Game < ApplicationRecord

  validates :name, :presence => true,
            :length => { :maximum => 100},
            :uniqueness => true

  validates :max_players, :presence => true

end
