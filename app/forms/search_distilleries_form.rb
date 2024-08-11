class SearchDistilleriesForm

  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :keyword, :string

  def search
    return Distillery.all,Region.all if keyword.blank?
    Distillery.keyword(keyword)
  end
end
