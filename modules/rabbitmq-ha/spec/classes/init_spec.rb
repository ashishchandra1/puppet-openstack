require 'spec_helper'
describe 'ha' do

  context 'with defaults for all parameters' do
    it { should contain_class('ha') }
  end
end
