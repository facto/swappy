require 'spec_helper'

describe Swappy::AppConfig do
  let(:options) do
    {
      path: path
    }
  end

  let(:path) { 'some_path' }

  let(:app_config) { described_class.new(options) }

  it 'includes Enumerable' do
    expect(app_config).to respond_to(:each)
  end

  describe '#initialize' do
    it 'sets the path' do
      expect(app_config.path).to eql(path)
    end
  end

  describe '#config_sets' do
    let(:json_config_sets) { ['1','2'] }

    it 'returns the config sets'
  end
end
