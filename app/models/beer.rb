class Beer < ApplicationRecord
    validates :name, :brewer, :beer_type, :description, :image, presence:true
    validates :description, length: { minimum: 10 }
end
