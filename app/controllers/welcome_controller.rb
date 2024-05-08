# app/controllers/welcome_controller.rb
class WelcomeController < ApplicationController
  def index
    render plain: 'Hello, world!'
  end
end
