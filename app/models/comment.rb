class Comment < ApplicationRecord
    belongs_to :work
    belongs_to :content
end
