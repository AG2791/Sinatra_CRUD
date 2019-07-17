
require 'sinatra'

class AppController < Sinatra::Base

configure do
    set :views, "app/views"
    set :public_dir, "public"
    enable :sessions  
    #  #rename session id from "secret"
    set :session_secret, "no_name"
end

   get '/' do
    erb :'/sessions/login'
  end

helpers do 

  # helper method  accessed by other ontrollers.

  def logged_in?
    #double neggate- use to convert the actual value of an object  into a binnary true or false. I.e !!7 = true, instead of of 7 = 7
    # !!session[:email]
    !!current_user #this checks @current_user is true, i.e does user exist
  end

#helper method to help find/edit posts per user
  def current_user
    @current_user ||= User.find_by(:email => session[:email]) if session[:email]
  end


  def login(email, password)
    #does the user w/ email exists
    user = User.find_by(:email => email)
    # if user exist and can be authenticated(uses authenticate method from has_secure_password) with password
    if user && user.authenticate(password)
     # then log user in 
      session[:email] = user.email
    else
    # otherwise, resturn redirect '/login'  
      redirect '/login'
    end
  end

  def logout!
    session.clear
  end
end


end