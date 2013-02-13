class Configuration < ActiveRecord::Base
  attr_accessible :emailChangeTask, :emailNewGrade, :emailNewTask, :rememberDefault, :studentId
end
