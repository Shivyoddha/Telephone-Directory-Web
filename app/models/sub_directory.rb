class SubDirectory < ApplicationRecord
	
	has_many :faculties, dependent: :destroy
	end
