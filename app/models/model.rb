class Model < ApplicationRecord
  include Rails.application.routes.url_helpers

  has_one_attached :photo

  include PgSearch::Model
  pg_search_scope :search_by_watch,
  against: [:brand_id, :name],
  using: {
    tsearch: { prefix: true }
  }

  def url_photo_model
    rails_blob_path(model.photo, disposition: "attachment", only_path: true)
  end

end
