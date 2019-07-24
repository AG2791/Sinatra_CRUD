
class SessionsController < AppController
    get '/login' do
    
        erb :'sessions/login'
      end

      post '/sessions' do
       
      login(params[:email], params[:password])
      redirect './items'
      end

      get '/logout' do
        logout!
      
        redirect './login'

      end

end