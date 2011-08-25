class Githubifier

  attr_reader :user, :project, :changelog

  def initialize(user, project, changelog)
    @user = user
    @project = project
    @changelog = changelog
  end

  ISSUE_NUMBER_REGEXP = /#(\d+)/

  def better_changelog
    better_changelog = changelog.gsub(ISSUE_NUMBER_REGEXP, '[#\1][]')

    issues.each do |issue|
      better_changelog += "\n[##{issue}]: https://github.com/#{user}/#{project}/issues/#{issue}"
    end

    better_changelog
  end

  def issues
    changelog.scan(ISSUE_NUMBER_REGEXP).uniq.sort
  end
end
