class UsedController < ApplicationController
  
  def index
    item = Item.where(user_id: current_user.id).order("created_at DESC")
    # binding.pry
    item.each do |i|
      if i.status == "unused"
        i.touch
        i.status = "used"
        i.save
        redirect_to root_path and return
      end
    end
  end

end
