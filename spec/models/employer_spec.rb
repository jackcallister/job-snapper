require 'spec_helper'

describe Employer do
  it { should have_one(:profile) }
  it { should have_many(:jobs) }
end
