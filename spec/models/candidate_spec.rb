require 'spec_helper'

describe Candidate do
  it { should have_one(:user) }
  it { should have_one(:profile) }
end
