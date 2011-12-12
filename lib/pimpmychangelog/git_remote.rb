class GitRemote
  def initialize
    match = fetch_url.match(/(\w+)\/(\w+)/)
    @user = match[1]
    @project = match[2]
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
   `git remote show origin | grep "Fetch URL"`
  end
end
