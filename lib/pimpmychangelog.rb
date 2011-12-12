%w(pimper parser git_remote cli version).each do |file|
  require File.expand_path("../pimpmychangelog/#{file}.rb", __FILE__)
end
