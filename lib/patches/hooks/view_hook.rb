module RedmineListHooks
    class Hooks  < Redmine::Hook::ViewListener     
       @list_hook = ListHook.all       
       @list_hook.each do |l|
        @txt_for_view = ""
        @list_text = TextHook.find(SetingText.where("list_hook_id" =>l.id).pluck("text_hook_id"))
        @list_text.each do |t| 
            @txt_for_view = @txt_for_view + t.txt    
        end   
        render_on l.name , :inline => @txt_for_view
       end        
    end
 end