require 'spec_helper'

describe Candidate do
  it { should have_one(:profile) }
  it { should have_many(:applications) }
end
