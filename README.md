# Ruby » <br> XML#strip methods to clean XML & HTML

* Doc: <http://sixarm.com/sixarm_ruby_xml_strip/doc>
* Gem: <http://rubygems.org/gems/sixarm_ruby_xml_strip>
* Repo: <http://github.com/sixarm/sixarm_ruby_xml_strip>
* Email: Joel Parker Henderson, <joel@sixarm.com>


## Introduction

Methods that work on an XML/HTML text string:

  * XML.strip_all: delete all extraneous junk
  * XML.strip_attributes: delete all attributes
  * XML.strip_comments: delete all comments
  * XML.strip_microsoft: delete all proprietary Microsoft code
  * XML.strip_unprintables: delete all unprintable characters

For docs go to <http://sixarm.com/sixarm_ruby_xml_strip/doc>

Want to help? We're happy to get pull requests.


## Install quickstart

Install:

    gem install sixarm_ruby_xml_strip

Bundler:

    gem "sixarm_ruby_xml_strip", "~>2.1.0"

Require:
   
    require "sixarm_ruby_xml_strip"


## Install with security (optional)

To enable high security	for all	our gems:

    wget http://sixarm.com/sixarm.pem
    gem cert --add sixarm.pem
    gem sources --add http://sixarm.com

To install with high security:

    gem install sixarm_ruby_xml_strip --trust-policy HighSecurity
