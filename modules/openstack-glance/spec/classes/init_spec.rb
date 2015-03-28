require 'spec_helper'
describe 'glance' do

  context 'with defaults for all parameters' do
    it { should contain_class('glance') }
  end
end
