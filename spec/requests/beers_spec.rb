require 'rails_helper'

RSpec.describe "Beers", type: :request do
  describe "GET /index" do
    it "gets a list of beers" do 
    Beer.create(  {
      name: 'West Sixth Cerveza',
      brewer: 'West Sixth Brewing',
      beer_type: 'Mexican Lager',
      description: "Oh, have you met me? I'm West Sixth Cerveza! I'm the kind of crisp and refreshing Mexican style Lager that'll have you hooked from the very first sip. My cracker-like malt character and notes of corn make me the perfect companion for a sunny afternoon spent lounging on the beach. And let's not forget about my low amount of hops - it's just enough to give me that extra zing without overwhelming my delicate palate. Trust me, once you've tasted me, you'll be coming back for more.",
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
          description: "Oh, have you met me? I'm West Sixth Cerveza! I'm the kind of crisp and refreshing Mexican style Lager that'll have you hooked from the very first sip. My cracker-like malt character and notes of corn make me the perfect companion for a sunny afternoon spent lounging on the beach. And let's not forget about my low amount of hops - it's just enough to give me that extra zing without overwhelming my delicate palate. Trust me, once you've tasted me, you'll be coming back for more.",
          image: "https://media.istockphoto.com/id/1332320975/vector/opened-beer-bottle-isolated-on-white[…]12&w=0&k=20&c=smq3qrWlQ5qmkZk1I3c1fAdM89BCi5vor9QYYAMW8jQ="
      }
    }
    post "/beers", params: beer_params
    expect(response).to have_http_status(200)
    beer = Beer.last
    expect(beer.name).to eq 'West Sixth Cerveza'
    expect(beer.brewer).to eq 'West Sixth Brewing'
    expect(beer.beer_type).to eq 'Mexican Lager'
    expect(beer.description).to eq "Oh, have you met me? I'm West Sixth Cerveza! I'm the kind of crisp and refreshing Mexican style Lager that'll have you hooked from the very first sip. My cracker-like malt character and notes of corn make me the perfect companion for a sunny afternoon spent lounging on the beach. And let's not forget about my low amount of hops - it's just enough to give me that extra zing without overwhelming my delicate palate. Trust me, once you've tasted me, you'll be coming back for more."
    expect(beer.image).to eq "https://media.istockphoto.com/id/1332320975/vector/opened-beer-bottle-isolated-on-white[…]12&w=0&k=20&c=smq3qrWlQ5qmkZk1I3c1fAdM89BCi5vor9QYYAMW8jQ="
    
    end
  end
  describe "PATCH /update" do
    it "updates a beer" do 
      beer_params = {
        beer: {
          name: 'West Sixth Cerveza',
          brewer: 'West Sixth Brewing',
          beer_type: 'Mexican Lager',
          description: "Oh, have you met me? I'm West Sixth Cerveza! I'm the kind of crisp and refreshing Mexican style Lager that'll have you hooked from the very first sip. My cracker-like malt character and notes of corn make me the perfect companion for a sunny afternoon spent lounging on the beach. And let's not forget about my low amount of hops - it's just enough to give me that extra zing without overwhelming my delicate palate. Trust me, once you've tasted me, you'll be coming back for more.",
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
        description: "TESTOh, have you met me? I'm West Sixth Cerveza! I'm the kind of crisp and refreshing Mexican style Lager that'll have you hooked from the very first sip. My cracker-like malt character and notes of corn make me the perfect companion for a sunny afternoon spent lounging on the beach. And let's not forget about my low amount of hops - it's just enough to give me that extra zing without overwhelming my delicate palate. Trust me, once you've tasted me, you'll be coming back for more.",
        image: "TESThttps://media.istockphoto.com/id/1332320975/vector/opened-beer-bottle-isolated-on-white[…]12&w=0&k=20&c=smq3qrWlQ5qmkZk1I3c1fAdM89BCi5vor9QYYAMW8jQ="
      }
    }
    patch "/beers/#{beer.id}", params: updated_beer_params
    updated_beer = Beer.find(beer.id)
    expect(response).to have_http_status(200)
    expect(updated_beer.name).to eq 'Double Bastard'
    expect(updated_beer.brewer).to eq 'Stone'
    expect(updated_beer.beer_type).to eq 'Double IPA'
    expect(updated_beer.description).to eq "TESTOh, have you met me? I'm West Sixth Cerveza! I'm the kind of crisp and refreshing Mexican style Lager that'll have you hooked from the very first sip. My cracker-like malt character and notes of corn make me the perfect companion for a sunny afternoon spent lounging on the beach. And let's not forget about my low amount of hops - it's just enough to give me that extra zing without overwhelming my delicate palate. Trust me, once you've tasted me, you'll be coming back for more."
    expect(updated_beer.image).to eq "TESThttps://media.istockphoto.com/id/1332320975/vector/opened-beer-bottle-isolated-on-white[…]12&w=0&k=20&c=smq3qrWlQ5qmkZk1I3c1fAdM89BCi5vor9QYYAMW8jQ="

    end
  end

  describe "DELETE /destroy" do
    it "deletes a beer" do
      beer_params = {
        beer: {
          name: 'West Sixth Cerveza',
          brewer: 'West Sixth Brewing',
          beer_type: 'Mexican Lager',
          description: "Oh, have you met me? I'm West Sixth Cerveza! I'm the kind of crisp and refreshing Mexican style Lager that'll have you hooked from the very first sip. My cracker-like malt character and notes of corn make me the perfect companion for a sunny afternoon spent lounging on the beach. And let's not forget about my low amount of hops - it's just enough to give me that extra zing without overwhelming my delicate palate. Trust me, once you've tasted me, you'll be coming back for more.",
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
