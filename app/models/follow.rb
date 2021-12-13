class Follow < ApplicationRecord
  belongs_to :cartoon
  belongs_to :user
end
