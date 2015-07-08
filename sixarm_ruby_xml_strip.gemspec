# -*- coding: utf-8 -*-

Gem::Specification.new do |s|

  s.name              = "sixarm_ruby_xml_strip"
  s.summary           = "SixArm.com » Ruby » XML#strip"
  s.description       = "XML#strip methods to clean up XML and HTML"
  s.version           = "2.1.1"

  s.author            = "SixArm"
  s.email             = "sixarm@sixarm.com"
  s.homepage          = "http://sixarm.com/"
  s.licenses          = ["BSD", "GPL", "MIT", "PAL", "Various"]

  s.signing_key       = "/opt/keys/sixarm/sixarm-rsa-4096-x509-20150314-private.pem"
  s.cert_chain        = ["/opt/keys/sixarm/sixarm-rsa-4096-x509-20150314-public.pem"]

  s.platform          = Gem::Platform::RUBY
  s.require_path      = "lib"
  s.has_rdoc          = true

  s.files = [
    ".gemtest",
    "Rakefile",
    "README.md",
    "VERSION",
    "lib/sixarm_ruby_xml_strip.rb",
  ]

  s.test_files = [
    "test/sixarm_ruby_xml_strip_test.rb",
    "test/sixarm_ruby_xml_strip_test/microsoft_word_clean.html",
    "test/sixarm_ruby_xml_strip_test/microsoft_word_dirty.html",
  ]

  s.add_dependency('sixarm_ruby_rexml', '>= 2.1.0', '< 3')

end
