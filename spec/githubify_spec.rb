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

  describe "#better_changelog" do
    let(:user) { 'gregbell' }
    let(:project) { 'activeadmin' }

    let(:better_changelog) { Githubifier.new(user, project, changelog).better_changelog }

    subject { better_changelog }

    context "when the changelog does not contain any reference to issues or users" do
      let(:changelog) { 'ChangeLog' }

      it "should return the original changelog" do
        better_changelog.should == changelog
      end
    end

    context "when the changelog contains an issue number" do
      let(:changelog) { 'Pull Request #123: Add I18n.' }

      it "should wrap the issue number to make a link" do
        better_changelog.should include("[#123][]")
      end

      it "should append the link definition at the end of the changelog" do
        better_changelog.should include("[#123]: https://github.com/gregbell/activeadmin/issues/123")
      end
    end
  end
end
