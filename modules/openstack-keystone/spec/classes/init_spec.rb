require 'spec_helper'
describe 'keystone' do

  context 'with defaults for all parameters' do
    it { should contain_class('keystone') }
  end
end
