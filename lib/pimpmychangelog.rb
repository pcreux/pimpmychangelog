%w(pimper parser cli).each do |file|
  require File.expand_path("../pimpmychangelog/#{file}.rb", __FILE__)
end
