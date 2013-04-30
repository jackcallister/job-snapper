class Application < ActiveRecord::Base
  belongs_to :job
  belongs_to :candidate

  def pending?
    if status == nil
      return true
    else
      return false
    end
  end

  def accepted?
    if status == true
      return true
    else
      return false
    end
  end

  def rejected?
   if status == false
     return true
   else
     return false
   end
  end
end
