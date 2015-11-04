class Product < ActiveRecord::Base
  has_many :reviews, dependent: :destroy #or :nullify
end
