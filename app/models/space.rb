class Space < ActiveRecord::Base
  attr_accessible :redu_id
  has_many :tasks
  validates :redu_id, :presence => true
  validates_uniqueness_of :redu_id, :message => "este espaco ja foi adicionado"
  
  
  def self.create_with_omniauth(auth)
    create! do |space|
      space.redu_id = auth[:redu_id]
    end
  end
  
end
