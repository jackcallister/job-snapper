require 'spec_helper'

describe Type do
  it { should have_many :classifications }
  it { should have_many(:jobs).through(:classifications) }
  it { should validate_presence_of(:title) }
end
