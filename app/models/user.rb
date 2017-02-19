class User < ApplicationRecord
  belongs_to :cause
  has_many :vote
end