class Model < ApplicationRecord

  has_one_attached :photo

  include PgSearch::Model
  pg_search_scope :search_by_watch,
  against: [:brand_id, :name],
  using: {
    tsearch: { prefix: true }
  }

end
