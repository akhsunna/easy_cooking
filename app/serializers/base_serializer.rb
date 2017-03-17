class BaseSerializer < ActiveModel::Serializer
  protected

  def root_url
    Rails.application.routes.url_helpers.root_url[0...-1]
  end
end