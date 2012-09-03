require 'spec_helper'

describe 'Expansion' do
  describe 'Factory' do
    subject { build :expansion }
    its(:name) { should == 'Test Expansion' }
  end
end
