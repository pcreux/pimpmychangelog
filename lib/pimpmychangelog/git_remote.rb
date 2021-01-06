class GitRemote

  REPOSITORY_PATTERN = %r{
    # Define recurring patterns
    (?<part> [\w\d-]+ ){0}

    (?<user>\g<part>)/(?<repo>\g<part>)(.git)?$
  }x

  def initialize(url = nil)
    @url = url || fetch_url

    match = @url.match(REPOSITORY_PATTERN)

    @user = match[:user]
    @project = match[:repo]

    unless @user && @project
      raise "Can't extract github user and project from origin remote"
    end
  end

  attr_reader :user, :project

  private

  def fetch_url
    @fetch_url ||= run_command.split(' ').last
  end

  def run_command
    `git config --get remote.origin.url`
  end
end
