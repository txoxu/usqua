# frozen_string_literal: true

class DistilleriesController < ApplicationController
  skip_before_action :require_login

  def index; end
end
