require 'spec_helper'
describe 'cinder' do

  context 'with defaults for all parameters' do
    it { should contain_class('cinder') }
  end
end
