require 'spec_helper'

describe GitRemote do
  context "when passed a SSH url to a repo" do
    subject { described_class.new('git@github.com:pcreux/pimpmychangelog.git') }

    its(:user) { should == 'pcreux' }
    its(:project) { should == 'pimpmychangelog' }
  end

  context "when passed a HTTPS url to a repo" do
    subject { described_class.new('https://github.com/pcreux/pimpmychangelog.git') }

    its(:user) { should == 'pcreux' }
    its(:project) { should == 'pimpmychangelog' }
  end

  context "when no URL is passed" do
    subject { described_class.new }

    # We can't match an exact user, as this depends on who
    # has checked out this repository.
    its(:user) { should be_a(String) }
    its(:project) { should == 'pimpmychangelog' }
  end
end
