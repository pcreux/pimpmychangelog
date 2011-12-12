module PimpMyChangelog
  class CLI
    def self.run!
      new.run
    end

    def initialize
      @git_remote = GitRemote.new
    end

    def run
      changelog = read_changelog
      puts changelog
      puts ""
      puts "In case something goes wrong we printed out your current #{changelog_path} above"

      write_changelog(Pimper.new(user, project, changelog).better_changelog)
      puts "Your changelog is now pimped!"
    end

    private

    def user
      @git_remote.user
    end

    def project
      @git_remote.project
    end

    def changelog_path
      "CHANGELOG.md"
    end

    def read_changelog
      File.read(changelog_path)
    end

    def write_changelog(content)
      File.open(changelog_path, 'w') { |f| f.write content }
    end
  end
end
