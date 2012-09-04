require 'spec_helper'

describe Expansion do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:year) }
  it { should validate_uniqueness_of(:name) }
  it { should have_many(:investigators) }

  describe 'Factory' do
    subject { build :expansion }

    context 'first time' do
      it { should be_valid }
    end

    context 'second time' do
      before { create :expansion }
      it { should be_valid }
    end
  end
end
