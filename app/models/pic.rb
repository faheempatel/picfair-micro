class Pic < ActiveRecord::Base
  scope :starred_first, -> { order(starred: "desc") }
end
