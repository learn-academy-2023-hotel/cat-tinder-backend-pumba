class Dog < ApplicationRecord
    validates :name, :location, :age, :enjoys, :image, presence: true
    validates :enjoys, length: { minimum: 10}
end
