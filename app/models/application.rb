class Application < ActiveRecord::Base
  belongs_to :job
  belongs_to :candidate

  validates_presence_of :job_id
  validates_presence_of :candidate_id

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
