require 'rspec'
require 'xcbump'
require 'plist'

def setup_plist(version='0.0.0', version_short='0.0.0')
  tempfile = Tempfile.new 'plist'
  plist = {
    'CFBundleVersion' => version,
    'CFBundleShortVersionString' => version_short
  }
  # I don't like using plist gem in here, need more context independency
  Plist::Emit::save_plist plist, tempfile.path
  return tempfile
end

def capture_stdout(&block)
  original_stdout = $stdout
  $stdout = fake = StringIO.new
  begin
    yield
  ensure
    $stdout = original_stdout
  end
  fake.string
end

def capture_stderr(&block)
  original_stderr = $stderr
  $stderr = fake = StringIO.new
  begin
    yield
  ensure
    $stderr = original_stderr
  end
  fake.string
end

