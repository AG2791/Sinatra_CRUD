class ItemsController < AppController

         # only visible to user login. 
        get '/items' do
                if !logged_in?
                        # if session[:email].empty?
                   redirect '/login'   # redirect if no email input
                
                else
                # redirect './items'
                #   @items = items.all #to pull the list of items 
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


         
          #get  single item  for loggin user 
 get '/items/:id' do
                # binding.pry
         if !logged_in?    
           redirect '/login'   # redirect if no email input
         else
           if @item = current_user.items.find_by(params[:id])
        #      @item = Item.find(params[:id])
          erb :'items/show'    
         else
                redirect '/items'
         end 
        end
      end




#send new items to db
 
   post '/items_new' do
#     item = items(params[:title], params[:content])

#    redirect './items/items'
# #    end
        @item = Item.new
        @item.title = params[:title]
        @item.content = params[:content]
        @item.save
        if @item.save
         erb :'items/items'  
   
        else
           redirect '/items/error'
        end
       
  end  

 
 get '/items/:id/edit' do
        # check if email is in input form . 
        if !logged_in? #  checks logged_in? method in app_controller, if logged in user can edit
        # if session[:email].empty?
                redirect '/login'   # redirect if no email input
        else
        #   item = Item.find(params[:id])
        #   if item.user_id == current_user.id
        if item = current_user.items.find_by(params[:id])
        "An edit items page #{current_user.id} is editing #{item.id}" #render if email is present 
         erb :'/items/edit'
        else
                redirect '/items'
        end
      end
     end

 
 get '/items/:id/delete' do
 # check if email is in input form . 
 if !logged_in? #  checks logged_in? method in app_controller, if logged in user can edit
      
                redirect '/login'  
        else
        #   item = Item.find(params[:id])
        #   if item.user_id == current_user.id
        if item = current_user.items.find_by(params[:id])
                " #{current_user.id} is deleting #{item.id}" 
      
        else
         "huh"        # redirect '/items' 
        end
      end
     end
   
end



