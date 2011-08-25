class Githubifier
  attr_reader :user, :project, :changelog

  def initialize(user, project, changelog)
    @user = user
    @project = project
    @changelog = changelog
  end
end
