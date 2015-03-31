require 'spec_helper'
describe 'galera' do

  context 'with defaults for all parameters' do
    it { should contain_class('galera') }
  end
end
