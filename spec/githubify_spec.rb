require File.expand_path('../../lib/githubify', __FILE__)

describe Githubifier do
  describe "#initialize" do
    it "should take a github user, a github project and a changelog" do
      g = Githubifier.new('gregbell', 'activeadmin', 'ChangeLog')
      g.user.should == 'gregbell'
      g.project.should == 'activeadmin'
      g.changelog.should == 'ChangeLog'
    end
  end
end
