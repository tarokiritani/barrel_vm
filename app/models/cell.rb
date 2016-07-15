class Cell < ActiveRecord::Base
  has_many :analyses, dependent: :destroy
  belongs_to :mouse
end
