require 'spec_helper'

describe GitRemote do
  context "when working on pcreux/pimpmychangelog" do
    its(:user) { should == 'pcreux' }
    its(:project) { should == 'pimpmychangelog' }
  end
end
