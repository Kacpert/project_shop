class Favorite < ActiveRecord::Base
  belongs_to :customer
  belongs_to :favorited, polymorphic: true
end
