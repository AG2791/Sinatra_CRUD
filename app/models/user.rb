class User < ActiveRecord::Base
    
     has_secure_password 
#user has many many object on items page. Rename home to "items" This is Macro
     has_many :items
end


