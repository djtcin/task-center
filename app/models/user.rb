class User < ActiveRecord::Base
  attr_accessible :email, :login, :name, :pic, :redu_id, :token, :student, :emailChangeTask, :emailNewGrade, :emailNewTask, :rememberDefault, :space_id, :id
  validates :redu_id, :presence => true
  #validates_uniqueness_of :redu_id, :message => "este usuario ja foi adicionado"
  attr_accessor :newsubmissions
  
  def self.create_with_omniauth(auth)
    create! do |user|
      user.redu_id = auth[:redu_id]
      user.name = auth[:info][:name]
      user.login = auth[:info][:login]
      user.email = auth[:info][:email]
      user.pic = auth[:info][:pic]
      user.token = auth[:credentials][:token]
      user.student = auth[:info][:student]
      user.space_id = auth[:info][:space_id]
    end
  end
  
  def self.find_user(reduId, spaceId)
    @user = User.find(:all, :conditions => {:redu_id => reduId, :space_id => spaceId})
        
    if @user.empty? then
      return nil
    else
       return @user[0]
    end
  end
  
end
