module ApplicationHelper
  def title(val=false)
    if val
      @title = val
    else
      @title 
    end
  end
end
