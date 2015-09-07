require 'spec_helper'
describe 'heat' do

  context 'with defaults for all parameters' do
    it { should contain_class('heat') }
  end
end
