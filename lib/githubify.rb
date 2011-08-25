class Githubifier
  attr_reader :user, :project

  def initialize(user, project)
    @user = user
    @project = project
  end
end
