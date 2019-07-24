
require 'sinatra'

class AppController < Sinatra::Base

configure do
    set :views, "app/views"
    set :public_dir, "public"
    enable :sessions  
    set :session_secret, "no_name"
end

   get '/' do
    erb :'/sessions/login'
  end

helpers do 

  # helper method s

  def logged_in?
    #double neggate- use to convert the actual value of an object  into a binnary true or false. I.e !!7 = true, instead of of 7 = 7
    !!current_user #this checks @current_user is true, i.e does user exist
  end

#helper method to help find/edit posts per user
  def current_user
    @current_user ||= User.find_by(:email => session[:email]) if session[:email]
  end


  def login(email, password)
    #does the user w/ email exists
    user = User.find_by(:email => email
    if user && user.authenticate(password)
      session[:email] = user.email
    else
      redirect '/login'
    end
  end

  def logout!
    session.clear
  end
end


end