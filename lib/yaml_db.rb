class ListHook < ActiveRecord::Base 
 require 'yaml'

 path = "plugins/redmine_hook/db/list_hooks.yml"
 
 data = YAML.load_file(path)
 element = {}
 if data 
  puts "Loaded " + path

    data.each_value do |str_l|     
      str_l = str_l.split(" ")      
      str_l.each do |s|
        if ListHooks.where("name" => s).first
           #puts "find " + s   
        else                
          l = ListHooks.new
          l.name = s
          l.save
          puts "create " + s   
        end
      end
    end
  end
end