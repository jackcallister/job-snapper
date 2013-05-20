require 'spec_helper'

describe Category do
  it { should validate_presence_of(:title) }
  it { should validate_uniqueness_of(:title) }
  it { should have_many(:jobs).through(:categorizations) }
end
