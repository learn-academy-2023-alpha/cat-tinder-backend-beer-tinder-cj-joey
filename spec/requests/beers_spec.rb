require 'rails_helper'

RSpec.describe "Beers", type: :request do
  describe "GET /index" do
    it "gets a list of beers" do 
    Beer.create(  {
      name: 'West Sixth Cerveza',
      brewer: 'West Sixth Brewing',
      beer_type: 'Mexican Lager',
      description: "Oh, have you met me?",
      image: "https://media.istockphoto.com/id/1332320975/vector/opened-beer-bottle-isolated-on-white[…]12&w=0&k=20&c=smq3qrWlQ5qmkZk1I3c1fAdM89BCi5vor9QYYAMW8jQ="
  })
      get "/beers"
      beer = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(beer.length).to eq 1 
    end
  end
  describe "POST /create" do
    it "creates a beer" do
      beer_params = {
        beer: {
          name: 'West Sixth Cerveza',
          brewer: 'West Sixth Brewing',
          beer_type: 'Mexican Lager',
          description: "Oh, have you met me?",
          image: "https://media.istockphoto.com/id/1332320975/vector/opened-beer-bottle-isolated-on-white[…]12&w=0&k=20&c=smq3qrWlQ5qmkZk1I3c1fAdM89BCi5vor9QYYAMW8jQ="
      }
    }
    post "/beers", params: beer_params
    expect(response).to have_http_status(200)
    beer = Beer.last
    expect(beer.name).to eq 'West Sixth Cerveza'
    expect(beer.brewer).to eq 'West Sixth Brewing'
    expect(beer.beer_type).to eq 'Mexican Lager'
    expect(beer.description).to eq "Oh, have you met me?"
    expect(beer.image).to eq "https://media.istockphoto.com/id/1332320975/vector/opened-beer-bottle-isolated-on-white[…]12&w=0&k=20&c=smq3qrWlQ5qmkZk1I3c1fAdM89BCi5vor9QYYAMW8jQ="
    end
    it "doesn't create a beer without a name" do
      beer_params = {
        beer: {
          brewer: 'West Sixth Brewing',
          beer_type: 'Mexican Lager',
          description: "Oh, have you met me?",
          image: "https://media.istockphoto.com/id/1332320975/vector/opened-beer-bottle-isolated-on-white[…]12&w=0&k=20&c=smq3qrWlQ5qmkZk1I3c1fAdM89BCi5vor9QYYAMW8jQ="
        }
      }
      post '/beers', params: beer_params
      expect(response.status).to eq 422
      json = JSON.parse(response.body)
      expect(json['name']).to include "can't be blank"
    end
    it "doesn't create a beer without a brewer" do
      beer_params = {
        beer: {
          name: 'West Sixth Cerveza',
          beer_type: 'Mexican Lager',
          description: "Oh, have you met me?",
          image: "https://media.istockphoto.com/id/1332320975/vector/opened-beer-bottle-isolated-on-white[…]12&w=0&k=20&c=smq3qrWlQ5qmkZk1I3c1fAdM89BCi5vor9QYYAMW8jQ="
        }
      }
      post '/beers', params: beer_params
      expect(response.status).to eq 422
      json = JSON.parse(response.body)
      expect(json['brewer']).to include "can't be blank"
    end
    it "doesn't create a beer without a beer_type" do
      beer_params = {
        beer: {
          name: 'West Sixth Cerveza',
          brewer: 'West Sixth Brewing',
          description: "Oh, have you met me?",
          image: "https://media.istockphoto.com/id/1332320975/vector/opened-beer-bottle-isolated-on-white[…]12&w=0&k=20&c=smq3qrWlQ5qmkZk1I3c1fAdM89BCi5vor9QYYAMW8jQ="
        }
      }
      post '/beers', params: beer_params
      expect(response.status).to eq 422
      json = JSON.parse(response.body)
      expect(json['beer_type']).to include "can't be blank"
    end
    it "doesn't create a beer without a description" do
      beer_params = {
        beer: {
          name: 'West Sixth Cerveza',
          brewer: 'West Sixth Brewing',
          beer_type: 'Mexican Lager',
          image: "https://media.istockphoto.com/id/1332320975/vector/opened-beer-bottle-isolated-on-white[…]12&w=0&k=20&c=smq3qrWlQ5qmkZk1I3c1fAdM89BCi5vor9QYYAMW8jQ="
        }
      }
      post '/beers', params: beer_params
      expect(response.status).to eq 422
      json = JSON.parse(response.body)
      expect(json['description']).to include "can't be blank"
    end
    it "doesn't create a beer without a image" do
      beer_params = {
        beer: {
          name: 'West Sixth Cerveza',
          brewer: 'West Sixth Brewing',
          beer_type: 'Mexican Lager',
          description: "Oh, have you met me?",
        }
      }
      post '/beers', params: beer_params
      expect(response.status).to eq 422
      json = JSON.parse(response.body)
      expect(json['image']).to include "can't be blank"
    end
  end
  describe "PATCH /update" do
    it "updates a beer" do 
      beer_params = {
        beer: {
          name: 'West Sixth Cerveza',
          brewer: 'West Sixth Brewing',
          beer_type: 'Mexican Lager',
          description: "Oh, have you met me?",
          image: "https://media.istockphoto.com/id/1332320975/vector/opened-beer-bottle-isolated-on-white[…]12&w=0&k=20&c=smq3qrWlQ5qmkZk1I3c1fAdM89BCi5vor9QYYAMW8jQ="
      }
    }
    post "/beers", params: beer_params
    beer = Beer.first
    updated_beer_params = {
      beer: {
        name: 'Double Bastard',
        brewer: 'Stone',
        beer_type: 'Double IPA',
        description: "TESTOh, have you met me?",
        image: "TESThttps://media.istockphoto.com/id/1332320975/vector/opened-beer-bottle-isolated-on-white[…]12&w=0&k=20&c=smq3qrWlQ5qmkZk1I3c1fAdM89BCi5vor9QYYAMW8jQ="
      }
    }
    patch "/beers/#{beer.id}", params: updated_beer_params
    updated_beer = Beer.find(beer.id)
    expect(response).to have_http_status(200)
    expect(updated_beer.name).to eq 'Double Bastard'
    expect(updated_beer.brewer).to eq 'Stone'
    expect(updated_beer.beer_type).to eq 'Double IPA'
    expect(updated_beer.description).to eq "TESTOh, have you met me?"
    expect(updated_beer.image).to eq "TESThttps://media.istockphoto.com/id/1332320975/vector/opened-beer-bottle-isolated-on-white[…]12&w=0&k=20&c=smq3qrWlQ5qmkZk1I3c1fAdM89BCi5vor9QYYAMW8jQ="
    end
    it "doesn't update a beer without a name" do
      beer_params = {
        beer: {
          name: 'West Sixth Cerveza',
          brewer: 'West Sixth Brewing',
          beer_type: 'Mexican Lager',
          description: "Oh, have you met me?",
          image: "https://media.istockphoto.com/id/1332320975/vector/opened-beer-bottle-isolated-on-white[…]12&w=0&k=20&c=smq3qrWlQ5qmkZk1I3c1fAdM89BCi5vor9QYYAMW8jQ="
      }
    }
    post "/beers", params: beer_params
    beer = Beer.first
    updated_beer_params = {
      beer: {
        name: "",
        brewer: 'Stone',
        beer_type: 'Double IPA',
        description: "TESTOh, have you met me?",
        image: "TESThttps://media.istockphoto.com/id/1332320975/vector/opened-beer-bottle-isolated-on-white[…]12&w=0&k=20&c=smq3qrWlQ5qmkZk1I3c1fAdM89BCi5vor9QYYAMW8jQ="
      }
    }
    patch "/beers/#{beer.id}", params: updated_beer_params
    updated_beer = Beer.find(beer.id)
    expect(response.status).to eq 422
    json = JSON.parse(response.body)
    expect(json['name']).to include "can't be blank"
    end
    it "doesn't update a beer without a brewer" do
      beer_params = {
        beer: {
          name: 'West Sixth Cerveza',
          brewer: 'West Sixth Brewing',
          beer_type: 'Mexican Lager',
          description: "Oh, have you met me?",
          image: "https://media.istockphoto.com/id/1332320975/vector/opened-beer-bottle-isolated-on-white[…]12&w=0&k=20&c=smq3qrWlQ5qmkZk1I3c1fAdM89BCi5vor9QYYAMW8jQ="
      }
    }
    post "/beers", params: beer_params
    beer = Beer.first
    updated_beer_params = {
      beer: {
        name: 'West Sixth Cerveza',
        brewer: '',
        beer_type: 'Double IPA',
        description: "TESTOh, have you met me?",
        image: "TESThttps://media.istockphoto.com/id/1332320975/vector/opened-beer-bottle-isolated-on-white[…]12&w=0&k=20&c=smq3qrWlQ5qmkZk1I3c1fAdM89BCi5vor9QYYAMW8jQ="
      }
    }
    patch "/beers/#{beer.id}", params: updated_beer_params
    updated_beer = Beer.find(beer.id)
    expect(response.status).to eq 422
    json = JSON.parse(response.body)
    expect(json['brewer']).to include "can't be blank"
    end
    it "doesn't update a beer without a name" do
      beer_params = {
        beer: {
          name: 'West Sixth Cerveza',
          brewer: 'West Sixth Brewing',
          beer_type: 'Mexican Lager',
          description: "Oh, have you met me?",
          image: "https://media.istockphoto.com/id/1332320975/vector/opened-beer-bottle-isolated-on-white[…]12&w=0&k=20&c=smq3qrWlQ5qmkZk1I3c1fAdM89BCi5vor9QYYAMW8jQ="
      }
    }
    post "/beers", params: beer_params
    beer = Beer.first
    updated_beer_params = {
      beer: {
        name: 'West Sixth Cerveza',
        brewer: 'Stone',
        beer_type: '',
        description: "TESTOh, have you met me?",
        image: "TESThttps://media.istockphoto.com/id/1332320975/vector/opened-beer-bottle-isolated-on-white[…]12&w=0&k=20&c=smq3qrWlQ5qmkZk1I3c1fAdM89BCi5vor9QYYAMW8jQ="
      }
    }
    patch "/beers/#{beer.id}", params: updated_beer_params
    updated_beer = Beer.find(beer.id)
    expect(response.status).to eq 422
    json = JSON.parse(response.body)
    expect(json['beer_type']).to include "can't be blank"
    end
    it "doesn't update a beer without a description" do
      beer_params = {
        beer: {
          name: 'West Sixth Cerveza',
          brewer: 'West Sixth Brewing',
          beer_type: 'Mexican Lager',
          description: "Oh, have you met me?",
          image: "https://media.istockphoto.com/id/1332320975/vector/opened-beer-bottle-isolated-on-white[…]12&w=0&k=20&c=smq3qrWlQ5qmkZk1I3c1fAdM89BCi5vor9QYYAMW8jQ="
      }
    }
    post "/beers", params: beer_params
    beer = Beer.first
    updated_beer_params = {
      beer: {
        name: 'West Sixth Cerveza',
        brewer: 'Stone',
        beer_type: 'Double IPA',
        description: "",
        image: "TESThttps://media.istockphoto.com/id/1332320975/vector/opened-beer-bottle-isolated-on-white[…]12&w=0&k=20&c=smq3qrWlQ5qmkZk1I3c1fAdM89BCi5vor9QYYAMW8jQ="
      }
    }
    patch "/beers/#{beer.id}", params: updated_beer_params
    updated_beer = Beer.find(beer.id)
    expect(response.status).to eq 422
    json = JSON.parse(response.body)
    expect(json['description']).to include "can't be blank"
    end
    it "doesn't update a beer without an image" do
      beer_params = {
        beer: {
          name: 'West Sixth Cerveza',
          brewer: 'West Sixth Brewing',
          beer_type: 'Mexican Lager',
          description: "Oh, have you met me?",
          image: "https://media.istockphoto.com/id/1332320975/vector/opened-beer-bottle-isolated-on-white[…]12&w=0&k=20&c=smq3qrWlQ5qmkZk1I3c1fAdM89BCi5vor9QYYAMW8jQ="
      }
    }
    post "/beers", params: beer_params
    beer = Beer.first
    updated_beer_params = {
      beer: {
        name: 'West Sixth Cerveza',
        brewer: 'Stone',
        beer_type: 'Double IPA',
        description: "TESTOh, have you met me?",
        image: ""
      }
    }
    patch "/beers/#{beer.id}", params: updated_beer_params
    updated_beer = Beer.find(beer.id)
    expect(response.status).to eq 422
    json = JSON.parse(response.body)
    expect(json['image']).to include "can't be blank"
    end
  end

  describe "DELETE /destroy" do
    it "deletes a beer" do
      beer_params = {
        beer: {
          name: 'West Sixth Cerveza',
          brewer: 'West Sixth Brewing',
          beer_type: 'Mexican Lager',
          description: "Oh, have you met me?",
          image: "https://media.istockphoto.com/id/1332320975/vector/opened-beer-bottle-isolated-on-white[…]12&w=0&k=20&c=smq3qrWlQ5qmkZk1I3c1fAdM89BCi5vor9QYYAMW8jQ="
      }
    }

    post "/beers", params: beer_params
    beer = Beer.first
    beers = Beer.all
    delete "/beers/#{beer.id}"
    expect(response).to have_http_status(200)
    expect(beers).to be_empty
    end
  end
end
