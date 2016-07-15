class Mouse < ActiveRecord::Base
    has_many :cells, dependent: :destroy
end
