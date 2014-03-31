require 'spec_helper'
require_relative './command_sharedspec'

describe Swappy::Commands::List do
  it_should_behave_like 'a command'

  let(:list_command) { subject }

  describe '#call' do
    let(:config_sets) { ['awesome', 'cool', 'bleh'] }

    it 'returns the config sets' do
      app_config = double('app_config')
      expect(app_config).to receive(:map).and_return(config_sets)
      expect(list_command).to receive(:app_config).and_return(app_config)
      list_command.call
    end
  end
end
