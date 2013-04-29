require 'spec_helper'

describe Application do
  it { should belong_to(:candidate) }
  it { should belong_to(:job) }
end
