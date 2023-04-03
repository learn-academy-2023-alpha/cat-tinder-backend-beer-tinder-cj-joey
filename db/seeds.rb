beers = [
    {
        name: 'West Sixth Cerveza',
        brewer: 'West Sixth Brewing',
        beer_type: 'Mexican Lager',
        description: "Oh, have you met me? I'm West Sixth Cerveza! I'm the kind of crisp and refreshing Mexican style Lager that'll have you hooked from the very first sip. My cracker-like malt character and notes of corn make me the perfect companion for a sunny afternoon spent lounging on the beach. And let's not forget about my low amount of hops - it's just enough to give me that extra zing without overwhelming my delicate palate. Trust me, once you've tasted me, you'll be coming back for more.",
        image: "https://media.istockphoto.com/id/1332320975/vector/opened-beer-bottle-isolated-on-white[…]12&w=0&k=20&c=smq3qrWlQ5qmkZk1I3c1fAdM89BCi5vor9QYYAMW8jQ="
    },
    {
        name: 'Pliny The Younger',
        brewer: 'Russian River Brewing',
        beer_type: 'West Coast Triple-IPA',
        description: "Hey there, gorgeous! I'm Pliny the Younger, and I'm here to tantalize your senses. From the moment I'm poured, my hazy golden-orange color is sure to catch your eye. And don't even get me started on my aroma - it's a heady blend of citrus, pine, and tropical fruits that'll leave you weak in the knees. But it's on the palate where I really shine - with notes of grapefruit, passionfruit, mango, and pine resin all vying for your attention. And even though I pack a bit of a punch with my high ABV, I'm surprisingly smooth and well-balanced. My clean, bitter finish will leave your taste buds begging for more. So come on, why not give me a try? You know you want to.",
        image: "https://media.istockphoto.com/id/1332320975/vector/opened-beer-bottle-isolated-on-white[…]12&w=0&k=20&c=smq3qrWlQ5qmkZk1I3c1fAdM89BCi5vor9QYYAMW8jQ="
    },
    {
        name: 'Cougar Bait',
        brewer: 'Country Boy Brewing',
        beer_type: 'Blonde Ale',
        description: "I'm Country Boy Cougar Bait, I am a beer that loves to be the center of attention. I have a charismatic and flirtatious personality that can win over anyone's heart with my light, crisp taste and sweet finish. I am always ready to party and have a good time, making me the perfect beer for social gatherings and events. My combination of pale and caramel malts, along with American and European hops, gives me a diverse range of flavors and aromas that always keep things exciting. I am versatile and adaptable to any occasion, whether it be a backyard barbecue or a night out on the town. My name is a playful nod to my alluring character, inviting people to let loose and enjoy life with a daring edge. So come on and give me a try, let's have some fun and make some memories together.",
        image: "https://media.istockphoto.com/id/1332320975/vector/opened-beer-bottle-isolated-on-white[…]12&w=0&k=20&c=smq3qrWlQ5qmkZk1I3c1fAdM89BCi5vor9QYYAMW8jQ="
    },
    {
        name: 'Double Bastard',
        brewer: 'Stone Brewing',
        beer_type: 'Double-IPA',
        description: "Hey there, I'm Double Bastard IPA, I am a bold and flirtatious beer that knows how to make a strong impression. My deep amber color and slightly hazy appearance draw people in, and my complex and intense flavor profile keeps them coming back for more. With a combination of specialty malts and a variety of hops, I am both malty and hoppy, with dominant notes of pine, citrus, and tropical fruits and a hint of caramel sweetness. My high alcohol by volume (ABV) content of 11% adds to my daring and adventurous personality, making me a beer that is best enjoyed slowly and savored like a fine whiskey. I am unapologetic in my bold and aggressive branding, with the words 'You're not worthy' printed prominently on my label. But don't let that intimidate you; I am a beer that loves to be appreciated and enjoyed by those who are willing to take on my bold and challenging character. So come on and take a chance on me, let's explore the depths of flavor and have a wild and unforgettable ride together.",
        image: "https://media.istockphoto.com/id/1332320975/vector/opened-beer-bottle-isolated-on-white[…]12&w=0&k=20&c=smq3qrWlQ5qmkZk1I3c1fAdM89BCi5vor9QYYAMW8jQ="
    },
    {
        name: 'The Oregon Pale',
        brewer: 'Mirror Twin Brewing',
        beer_type: 'Pale Ale',
        description: "Oh, hello there. I'm the Oregon Pale Ale, a delicious beer that is brewed to perfection using a variety of hops and caramel malts. My balanced and flavorful taste is simply irresistible, and I know you won't be able to resist me.
        My crisp and refreshing taste is perfect for any occasion, and my clean finish will leave you wanting more. My dominant notes of citrus and pine will transport you to a beautiful forest, surrounded by nature's bounty. And that hint of floral sweetness is just the perfect touch that makes me truly unique.
        I am a complex and well-rounded beer, and I know you'll enjoy exploring all the flavors and complexities that I have to offer. So why not take a chance on me? I promise to take you on a journey that you won't forget. Let's get to know each other better, shall we?",
        image: "https://media.istockphoto.com/id/1332320975/vector/opened-beer-bottle-isolated-on-white[…]12&w=0&k=20&c=smq3qrWlQ5qmkZk1I3c1fAdM89BCi5vor9QYYAMW8jQ="
    }
]

beers.each do |beer|
    Beer.create beer
    puts "creating beer #{beer}"
end