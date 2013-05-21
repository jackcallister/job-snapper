module Addressify
  extend ActiveSupport::Concern

  included do
    belongs_to :region
    belongs_to :city
    validates :city_id,
              :inclusion => {:in => proc { |address_model| address_model.region.city_ids }, :allow_nil => true }
  end

  def address
    if city
      "#{city.name}, #{region.name}"
    else
      "#{region.name}"
    end
  end
end
