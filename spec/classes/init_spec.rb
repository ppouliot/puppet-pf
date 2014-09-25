require 'spec_helper'
describe 'pf' do

  context 'with defaults for all parameters' do
    it { should contain_class('pf') }
  end
end
