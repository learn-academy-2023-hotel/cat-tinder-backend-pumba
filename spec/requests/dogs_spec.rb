require 'rails_helper'

RSpec.describe "Dogs", type: :request do
  describe "GET /index" do
    it 'gets a list of dogs' do
      Dog.create(
        name: 'Harold',
        age: 4,
        enjoys: 'benjoys running in the yard',
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
          enjoys: 'enjoys running in the yard',
          image: 'https://www.akc.org/wp-content/uploads/2017/11/Lhasa-Apso-On-White-01.jpg'
        }
      }
      post '/dogs', params: dog_params
      expect(response).to have_http_status(200)
      dog = Dog.first
      expect(dog.name).to eq 'Harold'
      expect(dog.age).to eq 4
      expect(dog.enjoys).to eq 'enjoys running in the yard'
      expect(dog.image).to eq 'https://www.akc.org/wp-content/uploads/2017/11/Lhasa-Apso-On-White-01.jpg'      
    end
  end
  describe "PATCH /update" do
    it "updates a dog" do
      dog_params = {
        dog: {
          name: 'Harold',
          age: 4,
          enjoys: 'enjoys running in the yard',
          image: 'https://www.akc.org/wp-content/uploads/2017/11/Lhasa-Apso-On-White-01.jpg'
        }
      }  
      post '/dogs', params: dog_params
      dog = Dog.first

      updated_params = {
        dog: {
          name: 'Harold',
          age: 5,
          enjoys: 'enjoys running in the yard',
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
          enjoys: 'enjoys running in the yard',
          image: 'https://www.akc.org/wp-content/uploads/2017/11/Lhasa-Apso-On-White-01.jpg'
        }
      }  
      post '/dogs', params: dog_params
      dog = Dog.first

      delete "/dogs/#{dog.id}" 
      expect(response).to have_http_status(200)
    end
  end
   describe "cannot create a dog without valid attributes" do
    it "can't create a dog without a name" do
      dog_params = {
        dog: {
          age: 1,
          enjoys:'enjoys running in the yard',
          image:'https://dogtime.com/wp-content/uploads/sites/12/2011/01/GettyImages-1455758529-e1688370717758.jpg?w=1024'
        }
      }
      post '/dogs', params: dog_params
      dog = JSON.parse(response.body)
      expect(response).to have_http_status 422
      expect(dog['name']).to include "can't be blank"
    end
    it "can't create a dog without an age" do
      dog_params = {
        dog: {
          name:'Nova',
          enjoys:'enjoys running in the yard',
          image:'https://dogtime.com/wp-content/uploads/sites/12/2011/01/GettyImages-1455758529-e1688370717758.jpg?w=1024'
          }
        }
        post '/dogs', params: dog_params
        dog = JSON.parse(response.body)
        expect(response).to have_http_status 422
        expect(dog['age']).to include "can't be blank"
      end 
      it "can't create a dog without an enjoys" do
        dog_params = {
          dog: {
            name:'Nova',
            age: 1,
            image:'https://dogtime.com/wp-content/uploads/sites/12/2011/01/GettyImages-1455758529-e1688370717758.jpg?w=1024'
          }
        }
        post '/dogs', params: dog_params
        dog = JSON.parse(response.body)
        expect(response).to have_http_status 422
        expect(dog['enjoys']).to include "can't be blank"
      end
      it "can't create a dog without an image" do
        dog_params = {
          dog: {
            name:'Nova',
            age: 1,
            enjoys:'enjoys running in the yard'
          }
        }
        post '/dogs', params: dog_params
        dog = JSON.parse(response.body)
        expect(response).to have_http_status 422
        expect(dog['image']).to include "can't be blank"
      end
   end
end
