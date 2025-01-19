# frozen_string_literal: true

# トップページとこのアプリについてのコントローラ
class StaticPagesController < ApplicationController
  skip_before_action :require_login, only: %i[top select explanation]

  def top;end

  def select
    @whiskey_name = StaticPage.whiskey_names.sample
    # @whiskey_nameに格納されているのは日本語なので、to_jsonで@whiskey_name自体をjson形式に
    render json: @whiskey_name.to_json
  end
  
  def explanation; end
end
