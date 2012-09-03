require 'spec_helper'

describe Expansion do
  it { should validate_presence_of(:name) }

  describe 'Factory' do
    subject { build :expansion }
    it { should be_valid }
  end
end
