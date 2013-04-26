require 'spec_helper'

describe Employer do
  it { should have_one(:user) }
  it { should have_one(:profile) }
end
