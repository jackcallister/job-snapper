module Addressable
  extend ActiveSupport::Concern

  def region
    Region.find(region_id).name
  end

  def city
    City.find(city_id).name
  end
end
