require 'rails_helper'

RSpec.describe Dog, type: :model do
it 'should validate name exists in database entry' do
  dog = Dog.create(age:2, enjoys:'coffee', image: 'https://dogtime.com/wp-content/uploads/sites/12/2011/01/GettyImages-1455758529-e1688370717758.jpg?w=1024')
  expect(dog.errors[:name]).to_not be_empty
end
it 'should validate age exists in database entry' do
  dog = Dog.create(name:'Nova', enjoys:'talking', image:'https://dogtime.com/wp-content/uploads/sites/12/2011/01/GettyImages-1455758529-e1688370717758.jpg?w=1024')
  expect(dog.errors[:age]).to_not be_empty
end
it 'should validate enjoys exists in database entry' do
  dog = Dog.create(name:'Nova', age:1, image:'https://dogtime.com/wp-content/uploads/sites/12/2011/01/GettyImages-1455758529-e1688370717758.jpg?w=1024')
  expect(dog.errors[:enjoys]).to_not be_empty
end
it 'should validate image exists in database entry' do
  dog = Dog.create(name:'jack', age:2, enjoys:'coffee')
  expect(dog.errors[:image]).to_not be_empty
end
it 'is not valid if enjoys is less than 10 characters' do
  dog = Dog.create(name:'nova', age:2, enjoys:'walking', image:'https://dogtime.com/wp-content/uploads/sites/12/2011/01/GettyImages-1455758529-e1688370717758.jpg?w=1024')
  expect(dog.errors[:enjoys]).to_not be_empty
end
end
