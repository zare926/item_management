class Used < ApplicationRecord
  belongs_to :item,optional: true
end
