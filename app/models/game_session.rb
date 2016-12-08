class GameSession < ApplicationRecord

  validates :name, :presence => true,
            :length => { :maximum => 100},
            :uniqueness => true

end
