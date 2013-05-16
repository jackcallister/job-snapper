module Skillable
  extend ActiveSupport::Concern

  included do
    acts_as_taggable_on :skills
  end
end
