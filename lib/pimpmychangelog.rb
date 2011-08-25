%w(pimper parser cli version).each do |file|
  require File.expand_path("../pimpmychangelog/#{file}.rb", __FILE__)
end
