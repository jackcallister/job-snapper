module Addressable
  extend ActiveSupport::Concern

  included do
    belongs_to :region
    belongs_to :city
  end

  module ClassMethods
    def region
      Region.find(self.region_id).name
    end

    def city
      City.find(self.city_id).name
    end
  end
end
