class ItemsController < AppController


        def all_items
           @items = current_user.items.all
        end




         # only visible to user logged in. 
        get '/items' do
                if !logged_in?
                        # if session[:email].empty?
                   redirect '/login'   # redirect if no email input
                else
                 all_items #to pull the list of items 
                   erb :'items/items'        
                end
              
          end 
             


         get '/items/new' do
        # check if email is in input form . 
        if !logged_in?
        # if session[:email].empty?
                redirect '/login'   # redirect if no email input
        else
        erb :'items/new'
        end 
        end

      
        
        post '/items' do
                @item = Item.new
                @item.title = params[:title]
                @item.content = params[:content]
                ######
                # why is the the last param necessary to get as object?
                #  @item.filename = @item.title  #params[:item][:title]
                @item.file = params[:file][:tempfile]
                @file = params[:file][:title]
                
                ######
                @item.user_id = current_user.id
                @item.save
                if @item.save
                  ##############
                  #send to content folder w/ title as name 
                  File.open("./content/#{@file}", 'wb') do |file|
                 file.write(file.read)
                #   end
                 erb :'items/show'
                  end
                 #############      
                 erb :'items/items'  
                else
                redirect '/items/error'
                end
        end


        

          #get  single item  for loggin user 
 get '/items/:id' do
                # binding.pry
         if !logged_in?    
           redirect '/login'   # redirect if no email input
         else
           if @item = current_user.items.find_by(params[:id])
          erb :'items/show'    
         else
                redirect '/items'
         end 
        end
      end



 get '/items/:id/edit' do
        # check if email is in input form . 
        if !logged_in? #  checks logged_in? method in app_controller, if logged in user can edit
        # if session[:email].empty?
                redirect '/login'   # redirect if no email input
        else
        if @item = current_user.items.find_by(params[:id])
        # "#{current_user.id} is editing #{item.id}" #render if email is present 
        erb :'/items/edit'

        else
                redirect '/items'
        end
      end
     end


     patch '/items/:id' do 
        @item = Item.find_by(params[:id])
        @item.title = params[:title]
        @item.content = params[:content]
        @item.save
        redirect to "/items/#{@item.id}"
        # redirect to "/items"
      end


delete '/items/:id/delete' do
        if !logged_in? 
            redirect '/login'   # redirect if no email input
         elsif
         @item = current_user.items.find_by(params[:id])
         @item.delete 
         redirect '/items'
         else
         redirect '/items/error'
   end
end


############################

# get "/" do
#         erb :form
#       end
      
#       post '/save_image' do
      
#         @filename = params[:file]
#         file = params[:file]
      
#         # File.open("./public/#{@filename}", 'wb') do |f|
#         #   f.write(file.read)
#         # end
      
#         erb :show_image
#       end
#############################



   
end



