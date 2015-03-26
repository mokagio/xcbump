require 'thor'

module XCBump
  module Cli
    class Application < Thor

      desc 'bump_version VALUE', 'Bump the given version VALUE of the project'
      method_option :commit, aliases: '-c', desc: 'Commit version bump'
      def bump(value, name=nil)
        project_version_helper = XCBump::ProjectVersionHelper.new

        old_version = project_version_helper.version_from_plist plists[0]

        XCBump::VersionBumper.new.bump_all_environments value.to_sym, name

        return unless options[:commit]

        # commit and tag, here only for the moment!
        new_version = project_version_helper.version_from_plist plists[0]
        message = "Do you want to commit the changes to the version (#{old_version} -> #{new_version})?"
        XCBump::GitHelper.new.commit_asking_user(message, new_version, plists)
      end
    end
  end
end
