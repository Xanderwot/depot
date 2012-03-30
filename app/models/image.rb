class Image < ActiveRecord::Base
	file_accessor :image
    belongs_to :product
    validates_size_of :image, :maximum => 100.kilobytes
end
