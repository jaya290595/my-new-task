class View < ApplicationRecord
	belongs_to :movie, counter_cache: :counter
end
