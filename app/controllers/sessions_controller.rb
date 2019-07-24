
class SessionsController < AppController
    get '/login' do
        # the line of code below render the view page in app/views/sessions/login.erb
        erb :'sessions/login'
      end

      post '/sessions' do
       
      login(params[:email], params[:password])
      redirect './items'
      end

      get '/logout' do
        logout!
        # session.clear
        redirect './login'

      end

end