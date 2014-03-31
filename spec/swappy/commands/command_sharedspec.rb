require 'spec_helper'

shared_examples_for 'a command' do
  it 'extends forwardable' do
    expect(described_class).to respond_to(:def_delegator)
  end
end
