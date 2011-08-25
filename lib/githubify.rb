class Githubifier

  attr_reader :user, :project, :changelog

  def initialize(user, project, changelog)
    @user = user
    @project = project
    @changelog = changelog
  end

  ISSUE_NUMBER_REGEXP = /(^|[^\[])#(\d+)($|[^\]])/
  CONTRIBUTOR_REGEXP = /(^|[^\[])@(\w+)($|[^\]])/

  # @return [String] The changelog with contributors and issues as link
  def better_changelog
    better_changelog = changelog.clone

    # Make links out of issue numbers and contributors
    better_changelog.gsub!(ISSUE_NUMBER_REGEXP, '\1[#\2][]\3')
    better_changelog.gsub!(CONTRIBUTOR_REGEXP, '\1[@\2][]\3')

    # Append definitions of issue links
    issues.each do |issue|
      better_changelog += "\n[##{issue}]: https://github.com/#{user}/#{project}/issues/#{issue}"
    end

    # Append definitions of contributors links
    contributors.each do |contributor|
      better_changelog += "\n[@#{contributor}]: https://github.com/#{contributor}"
    end

    better_changelog
  end

  # @return [Array] issue numbers found in the changelog
  #   Example: ['123', '223', '470']
  def issues
    changelog.scan(ISSUE_NUMBER_REGEXP).map { |match| match[1] }.uniq.sort
  end

  # @return [Array] contributors found in the changelog
  #   Example: ['gregbell', 'pcreux', 'samvincent']
  def contributors
    changelog.scan(CONTRIBUTOR_REGEXP).map { |match| match[1] }.uniq.sort
  end
end
