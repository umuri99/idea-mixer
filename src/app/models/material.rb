class Material < ApplicationRecord
  validates :theme, presence: true, uniqueness: true
end
