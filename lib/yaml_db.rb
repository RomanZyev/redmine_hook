class ListHook < ActiveRecord::Base 
 require 'yaml'

 path = "plugins/redmine_hook/db/list_hook.yml"
 
 data = YAML.load_file(path)
 element = {}
 if data 
  puts "Loaded " + path

    data.each_value do |str_l|     
      str_l = str_l.split(" ")      
      str_l.each do |s|
        if ListHook.where("name" => s).first
             
        else                
          l = ListHook.new
          l.name = s
          l.save
          puts "create " + s   
        end
      end
    end
  end
end