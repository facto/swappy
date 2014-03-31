require 'spec_helper'
require_relative './command_sharedspec'

describe Swappy::Commands::Swap do
  it_should_behave_like 'a command'

  describe '#initialize' do
    let(:name) { 'awesome_config_set' }
    let(:swap_command) { described_class.new(name) }

    context 'with an existing matching config set' do
      let(:config_set) { double('config_set') }

      before :each do
        allow_any_instance_of(described_class).to receive(:config_set).and_return(config_set)
      end

      it 'sets the name' do
        expect(swap_command.name).to eql(name)
      end
    end

    it 'raises ConfigSetNotFoundError if the config set is not found' do
      expect { swap_command }.to raise_error(described_class::ConfigSetNotFoundError)
    end
  end
end
