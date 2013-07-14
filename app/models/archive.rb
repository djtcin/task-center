class Archive < ActiveRecord::Base
  belongs_to :submission
  attr_accessible :format, :name, :size
  
end
