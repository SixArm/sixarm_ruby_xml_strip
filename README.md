# SixArm.com → Ruby → <br> XML#strip methods to clean XML & HTML

* Doc: <http://sixarm.com/sixarm_ruby_xml_strip/doc>
* Gem: <http://rubygems.org/gems/sixarm_ruby_xml_strip>
* Repo: <http://github.com/sixarm/sixarm_ruby_xml_strip>
<!--HEADER-SHUT-->


## Introduction

Methods that work on an XML/HTML text string:

  * XML.strip_all: delete all extraneous junk
  * XML.strip_attributes: delete all attributes
  * XML.strip_comments: delete all comments
  * XML.strip_microsoft: delete all proprietary Microsoft code
  * XML.strip_unprintables: delete all unprintable characters

For docs go to <http://sixarm.com/sixarm_ruby_xml_strip/doc>

Want to help? We're happy to get pull requests.


<!--INSTALL-OPEN-->

## Install

To install using a Gemfile, add this:

    gem "sixarm_ruby_xml_strip", ">= 2.1.1", "< 3"

To install using the command line, run this:

    gem install sixarm_ruby_xml_strip -v ">= 2.1.1, < 3"

To install using the command line with high security, run this:

    wget http://sixarm.com/sixarm.pem
    gem cert --add sixarm.pem && gem sources --add http://sixarm.com
    gem install sixarm_ruby_xml_strip -v ">= 2.1.1, < 3" --trust-policy HighSecurity

To require the gem in your code:

    require "sixarm_ruby_xml_strip"

<!--INSTALL-SHUT-->
