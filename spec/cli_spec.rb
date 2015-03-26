require 'spec_helper.rb'
require 'tempfile'
require 'yaml'

describe XCBump::Cli::Application do
  describe "bump_version VALUE" do
    before(:each) do
      @temp_plist = setup_plist('1.2.3', '4.5.6')
    end

    context "bump_version major" do
      it "bumps the major version" do
        subject.bump('major')
        expect(Plist::parse_xml(@temp_plist.path)['CFBundleVersion']).to eq '2.0.0'
        expect(Plist::parse_xml(@temp_plist.path)['CFBundleShortVersionString']).to eq '5.0.0'
      end
    end

    context "bump_version minor" do
      it "bumps the major version" do
        subject.bump('minor')
        expect(Plist::parse_xml(@temp_plist.path)['CFBundleVersion']).to eq '1.3.0'
        expect(Plist::parse_xml(@temp_plist.path)['CFBundleShortVersionString']).to eq '4.6.0'
      end
    end

    context "bump_version patch" do
      it "bumps the major version" do
        subject.bump('patch')
        expect(Plist::parse_xml(@temp_plist.path)['CFBundleVersion']).to eq '1.2.4'
        expect(Plist::parse_xml(@temp_plist.path)['CFBundleShortVersionString']).to eq '4.5.7'
      end
    end
  end
end
