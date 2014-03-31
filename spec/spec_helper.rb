begin
  require 'pry'
rescue LoadError
end

require 'swappy'

Dir[File.join(File.dirname(__FILE__), 'fixtures/**/*.rb')].each do |fixture|
  require fixture
end

RSpec.configure do |config|
end
