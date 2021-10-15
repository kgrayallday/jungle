class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV["HTTP_BASIC_AUTH_USER"], password: ENV["HTTP_BASIC_AUTH_PASS"]
  

  def show
    @products = Product.all.length
    @categories = Category.all.length

  end
end
