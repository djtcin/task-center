class User < ActiveRecord::Base
  attr_accessible :email, :login, :name, :pic, :redu_id, :token, :student
  validates :redu_id, :presence => true
  validates_uniqueness_of :redu_id, :message => "este usuario ja foi adicionado"
  
  def self.create_with_omniauth(auth)
    create! do |user|
      user.redu_id = auth[:redu_id]
      user.name = auth[:info][:name]
      user.login = auth[:info][:login]
      user.email = auth[:info][:email]
      user.pic = auth[:info][:pic]
      user.token = auth[:credentials][:token]
      user.student = auth[:info][:student]
    end
  end
  
end
