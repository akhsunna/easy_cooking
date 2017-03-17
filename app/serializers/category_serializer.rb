class CategorySerializer < BaseSerializer
  attributes :id, :name, :icon_url

  def icon_url
    root_url + object.icon.url
  end
end