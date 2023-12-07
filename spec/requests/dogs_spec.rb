require 'rails_helper'

RSpec.describe "Dogs", type: :request do
  describe "GET /index" do
    it 'gets a list of dogs' do
      Dog.create(
        name: 'Harold',
        age: 4,
        enjoys: 'barking',
        image: 'https://www.akc.org/wp-content/uploads/2017/11/Lhasa-Apso-On-White-01.jpg'
      )
      get '/dogs'
      dog = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(dog.length).to eq 1
    end
  end
  describe "POST /create" do
    it "creates a dog" do
      dog_params = {
        dog: {
          name: 'Harold',
          age: 4,
          enjoys: 'barking',
          image: 'https://www.akc.org/wp-content/uploads/2017/11/Lhasa-Apso-On-White-01.jpg'
        }
      }
      post '/dogs', params: dog_params
      expect(response).to have_http_status(200)
      dog = Dog.first
      expect(dog.name).to eq 'Harold'
      expect(dog.age).to eq 4
      expect(dog.enjoys).to eq 'barking'
      expect(dog.image).to eq 'https://www.akc.org/wp-content/uploads/2017/11/Lhasa-Apso-On-White-01.jpg'      
    end
  
  end
  describe "PATCH /update" do
    it "updates a dog" do
      dog_params = {
        dog: {
          name: 'Harold',
          age: 4,
          enjoys: 'barking',
          image: 'https://www.akc.org/wp-content/uploads/2017/11/Lhasa-Apso-On-White-01.jpg'
        }
      }  
      post '/dogs', params: dog_params
      dog = Dog.first

      updated_params = {
        dog: {
          name: 'Harold',
          age: 5,
          enjoys: 'barking',
          image: 'https://www.akc.org/wp-content/uploads/2017/11/Lhasa-Apso-On-White-01.jpg'
        }
      }  
      patch "/dogs/#{dog.id}", params: updated_params
      updated_dog = Dog.find(dog.id)
      expect(response).to have_http_status(200)
      expect(updated_dog.age).to eq 5
    end
  end
  describe "DELETE /destroy" do
    it "destroys a dog" do
      dog_params = {
        dog: {
          name: 'Harold',
          age: 4,
          enjoys: 'barking',
          image: 'https://www.akc.org/wp-content/uploads/2017/11/Lhasa-Apso-On-White-01.jpg'
        }
      }  
      post '/dogs', params: dog_params
      dog = Dog.first

      delete "/dogs/#{dog.id}" 
      expect(response).to have_http_status(200)
    end
  end
end
