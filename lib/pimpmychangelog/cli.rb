module PimpMyChangelog
  class CLI
    def self.run!(args)
      unless args.size == 3
        puts "Usage: pimpmychangelog github_user github_project CHANGELOG.md"
        exit 1
      end

      new(*args).run
    end

    attr_reader :user, :project, :changelog_path

    def initialize(user, project, changelog_path)
      @user = user
      @project = project
      @changelog_path = changelog_path
    end

    def run
      puts Pimper.new(user, project, File.read(changelog_path)).better_changelog
    end
  end
end
