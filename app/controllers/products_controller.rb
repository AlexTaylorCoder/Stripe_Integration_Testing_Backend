class ProductsController < ApplicationController
    #Should just get all products from db
    def index 
        render json: Product.all
    end


end
