Gem::Specification.new do |s|

  s.name              = "sixarm_ruby_xml_strip"
  s.summary           = "SixArm.com » Ruby » XML#strip methods to clean up XML and HTML"
  s.version           = "2.0.4"
  s.author            = "SixArm"
  s.email             = "sixarm@sixarm.com"
  s.homepage          = "http://sixarm.com/"
  s.signing_key       = '/home/sixarm/keys/certs/sixarm-rsa1024-x509-private.pem'
  s.cert_chain        = ['/home/sixarm/keys/certs/sixarm-rsa1024-x509-public.pem']

  s.platform          = Gem::Platform::RUBY
  s.require_path      = 'lib'
  s.has_rdoc          = true

  SOURCES             = []
  TESTERS             = ['microsoft_word_clean.html','microsoft_word_dirty.html']

  top_files           = [".gemtest", "CHANGELOG.txt", "INSTALL.txt", "LICENSE.txt", "Rakefile", "README.md", "VERSION"]
  lib_files           = ["lib/#{s.name}.rb"] + SOURCES.map{|x| "lib/#{s.name}/#{x}.rb"}
  test_files          = ["test/#{s.name}_test.rb"] + SOURCES.map{|x| "test/#{s.name}_test/#{x}_test.rb"} + TESTERS.map{|x| "test/#{s.name}_test/#{x}"}

  s.files             = top_files + lib_files + test_files
  s.test_files        = test_files

  s.add_dependency('sixarm_ruby_rexml', '>= 2.0.4')

end
