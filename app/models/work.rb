class Work < ApplicationRecord
  has_many :comments
  is_impressionable
end
