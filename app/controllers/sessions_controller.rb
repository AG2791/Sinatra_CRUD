
class SessionsController < AppController
    get '/login' do
        # the line of code below render the view page in app/views/sessions/login.erb
        erb :'sessions/login'
      end

      post '/sessions' do
        #take email input and redirect to items page. start of session
        #login a user with their email 
      # session[:email] = params[:email]
      login(params[:email], params[:password])
      redirect './items'
      end

      get '/logout' do
        logout!
        # session.clear
        redirect './login'

      end

end