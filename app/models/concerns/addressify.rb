module Addressify
  extend ActiveSupport::Concern

  included do
    belongs_to :region
    belongs_to :city
  end

  def address
    if city
      "#{city.name}, #{region.name}"
    else
      "#{region.name}"
    end
  end
end
