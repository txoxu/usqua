# frozen_string_literal: true

# 蒸留所一覧
class DistilleriesController < ApplicationController
  skip_before_action :require_login

  def index; end
end
