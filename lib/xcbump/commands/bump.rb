module XCBump
  class VersionBumper

    def bump(plist, value, name=nil)
      version = XCBump::ProjectVersionHelper.new.version_from_plist plist
      semver_helper = XCBump::SemverHelper.new

      new_version = version

      if value == :major
        new_version = semver_helper.bump_major version
      elsif value == :minor
        new_version = semver_helper.bump_minor version
      elsif value == :patch
        new_version = semver_helper.bump_patch version
      elsif value == :pre
        new_version = semver_helper.bump_pre version, name
      end

      XCBump::ProjectVersionHelper.new.set_version_in_plist new_version, plist
    end

    def bump_short(plist, value, name=nil)
      version = XCBump::ProjectVersionHelper.new.short_version_from_plist plist
      semver_helper = XCBump::SemverHelper.new

      new_version = version

      if value == :major
        new_version = semver_helper.bump_major version
      elsif value == :minor
        new_version = semver_helper.bump_minor version
      elsif value == :patch
        new_version = semver_helper.bump_patch version
      elsif value == :pre
        new_version = semver_helper.bump_pre version, name
      end

      XCBump::ProjectVersionHelper.new.set_short_version_in_plist new_version, plist
    end

  end
end
