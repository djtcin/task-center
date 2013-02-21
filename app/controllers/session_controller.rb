class SessionController < ApplicationController
  respond_to :html, :json

  def create
    logger.info("INICIO : "+ params[:redu_user_id]) # TODO  apagar teste
    
    # TODO  fazer auth_hash funcionar para saber o tipo de usuário  
    auth_hash_temp = { :redu_id  => params[:redu_user_id].to_i, :credentials => { :token => "token"} , :info => { :name => "Denise_#{params[:redu_user_id]}", :login => "djtcin", :email => "d@d" , :pic => "", :student => true } }
    
    # TODO  ou fazer isso funcionar para saber o tipo de usuário 
    #logger.info("AUTH: "+auth_hash)
    #conn = Faraday.new(:url => 'http://redu.com.br') do |faraday|
    #  faraday.request  :url_encoded
    #  faraday.response :logger
    #  faraday.headers['Authorization'] = "OAuth #{auth_hash["credentials"]["token"]}"
    #  faraday.adapter  Faraday.default_adapter
    #  faraday.response :json, :content_type => /\bjson$/
    #end
    #session[:me] = conn.get("me")
    #logger.info("ME: "+session[:me])

    @user = User.find_by_redu_id(auth_hash_temp[:redu_id]) || 
            User.create_with_omniauth(auth_hash_temp)  # TODO substituir pelo auth certo
    
    session[:user_id] = @user.redu_id
    logger.info("USER ID2: #{session[:user_id]}") # TODO apagar teste
    session[:user_student] = @user.student;
    session[:space_id] = params[:redu_space_id]
    logger.info("SPACE ID: #{session[:space_id]}") # TODO apagar teste
    
    
    #redirect_to root_path    
    #redirect_to :controller => "tasks", :action => "pending"
    redirect_to :controller => "tasks", :action => "pending"
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
