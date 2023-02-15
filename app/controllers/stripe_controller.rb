class StripeController < ApplicationController
    require 'stripe' 


    def index
        secret = Rails.application.credentials.stripe_key
        Stripe.api_key = secret
        session = Stripe::Checkout::Session.create({ 
            #Provide price ID and quantity
            #Can pass in address and other things into this form
            #Idea is to have a seperate form on frontend and then send these items to stripe session. 
            #Then when clicking stripe button redirect to stripe session url
            line_items: [{
                price: 'price_1MbWqSEBJ4P9nRwPP9wM8DIU',
                quantity: 1,
            }],
            mode: 'payment',
            success_url: 'http://localhost:3001/' + '?success=true',
            cancel_url: 'http://localhost:3001/' + '?canceled=true',
        })

        #Send back session url 
        #This could honestly all be done on frontend with payment link
        obj = {"url":session.url}
        render json: obj
    end

end
