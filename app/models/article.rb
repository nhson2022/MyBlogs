class Article < ApplicationRecord
  belongs_to :category, optional: true
  has_one_attached :featured_image do |attachable|
    attachable.variant :thumb, resize_to_limit: [200, 200]
  end
end
