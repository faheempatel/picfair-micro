class Pic < ActiveRecord::Base
  # Starred pictures come before non-starred
  scope :starred_first, -> { order(starred: "desc") }
end
