require File.expand_path('../../lib/githubify', __FILE__)

describe Githubifier do
  describe "#initialize" do
    it "should take a github user and a github project" do
      g = Githubifier.new('gregbell', 'activeadmin')
      g.user.should == 'gregbell'
      g.project.should == 'activeadmin'
    end
  end
end
