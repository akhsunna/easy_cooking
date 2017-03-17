class Category < ApplicationRecord
  has_and_belongs_to_many :dishes

  has_attached_file :icon,
                    styles: {
                        medium: '300x300>',
                        thumb: '100x100>'
                    }
  validates_attachment_content_type :icon, content_type: /\Aimage\/.*\z/
end
