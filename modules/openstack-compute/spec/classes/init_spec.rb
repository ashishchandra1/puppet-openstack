require 'spec_helper'
describe 'compute' do

  context 'with defaults for all parameters' do
    it { should contain_class('compute') }
  end
end
