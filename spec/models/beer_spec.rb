require 'rails_helper'

RSpec.describe Beer, type: :model do
  it 'is valid with valid attributes' do
    beer = Beer.create(name: 'West Sixth Cerveza',
    brewer: 'West Sixth Brewing',
    beer_type: 'Mexican Lager',
    description: "Oh, have you met me?",
    image: "https://media.istockphoto.com/id/1332320975/vector/opened-beer-bottle-isolated-on-white[…]12&w=0&k=20&c=smq3qrWlQ5qmkZk1I3c1fAdM89BCi5vor9QYYAMW8jQ=")
    expect(beer).to be_valid
  end
  it 'is invalid without a name' do
    beer = Beer.create(brewer: 'West Sixth Brewing',
    beer_type: 'Mexican Lager',
    description: "Oh, have you met me?",
    image: "https://media.istockphoto.com/id/1332320975/vector/opened-beer-bottle-isolated-on-white[…]12&w=0&k=20&c=smq3qrWlQ5qmkZk1I3c1fAdM89BCi5vor9QYYAMW8jQ=")
    expect(beer.errors[:name]).to_not be_empty
  end
  it 'is invalid without a brewer' do
    beer = Beer.create(name: 'West Sixth Cerveza',
    beer_type: 'Mexican Lager',
    description: "Oh, have you met me?",
    image: "https://media.istockphoto.com/id/1332320975/vector/opened-beer-bottle-isolated-on-white[…]12&w=0&k=20&c=smq3qrWlQ5qmkZk1I3c1fAdM89BCi5vor9QYYAMW8jQ=")
    expect(beer.errors[:brewer]).to_not be_empty
  end
  it 'is invalid without a beer_type' do
    beer = Beer.create(name: 'West Sixth Cerveza',
    brewer: 'West Sixth Brewing',
    description: "Oh, have you met me?",
    image: "https://media.istockphoto.com/id/1332320975/vector/opened-beer-bottle-isolated-on-white[…]12&w=0&k=20&c=smq3qrWlQ5qmkZk1I3c1fAdM89BCi5vor9QYYAMW8jQ=")
    expect(beer.errors[:beer_type]).to_not be_empty
  end
  it 'is invalid without a description' do
    beer = Beer.create(name: 'West Sixth Cerveza',
    brewer: 'West Sixth Brewing',
    beer_type: 'Mexican Lager',
    image: "https://media.istockphoto.com/id/1332320975/vector/opened-beer-bottle-isolated-on-white[…]12&w=0&k=20&c=smq3qrWlQ5qmkZk1I3c1fAdM89BCi5vor9QYYAMW8jQ=")
    expect(beer.errors[:description]).to_not be_empty
  end
  it 'is invalid without an image' do
    beer = Beer.create(name: 'West Sixth Cerveza',
    brewer: 'West Sixth Brewing',
    beer_type: 'Mexican Lager',
    description: "Oh, have you met me?")
    expect(beer.errors[:image]).to_not be_empty
  end
  it 'is invalid if the description is less than 10 characters' do
    beer = Beer.create
    beer = Beer.create(name: 'West Sixth Cerveza',
    brewer: 'West Sixth Brewing',
    beer_type: 'Mexican Lager',
    description: "Oh",
    image: "https://media.istockphoto.com/id/1332320975/vector/opened-beer-bottle-isolated-on-white[…]12&w=0&k=20&c=smq3qrWlQ5qmkZk1I3c1fAdM89BCi5vor9QYYAMW8jQ=")
    expect(beer.errors[:description]).to_not be_empty
  end
end
