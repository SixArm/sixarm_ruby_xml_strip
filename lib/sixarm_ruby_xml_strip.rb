# -*- coding: utf-8 -*-
=begin rdoc
Please see README.rdoc
=end

require 'sixarm_ruby_rexml'

module XML

  # Santize dirty xml by removing unprintables, bad tags,
  # comments, and generally anything else we might need
  # to enable the XML parser to handle a dirty document.
  #
  # This method calls these in order:
  #   - XML.strip_unprintables
  #   - XML.strip_microsoft
  #   - XML.strip_comments
  #   - XML.strip_attributes
  #
  # @example 
  #   # This example shows curly braces instead of angle braces because of HTML formatting
  #   s="{foo a=b c=d}{!--comment--}Hello{!-[if bar]}Microsoft{![endif]}World{/foo}"
  #   XML.strip_all(s) => "{foo}HelloWorld{/foo}"
  #
  # @return [String] the text, stripped of unprintables, Microsoft markup, comments, and attributes

  def XML.strip_all(xml_text)
    return XML.strip_attributes(XML.strip_comments(XML.strip_microsoft(XML.strip_unprintables(xml_text))))
  end


  # Strip out all attributes from the XML/HTML input string.
  #
  # @example
  #   s="<foo a=b c=d e=f>Hello</foo>"
  #   XML.strip_attributes(s) => "<foo>Hello</foo>"
  #
  # @return [String] the text, stripped of attributes

  def XML.strip_attributes(xml_text)
    return xml_text.gsub(/<(\/?\w+).*?>/im){"<#{$1}>"}  # delete attributes
  end


  # Strip out all XML/HTML comments from the XML/HTML input string.
  #
  # @example
  #   # This example shows curly braces instead of angle braces because of HTML formatting
  #   s="Hello{!--comment--}World"
  #   XML.strip_comments(s) => "HelloWorld"
  #
  # @return [String] the text, stripped of comments

  def XML.strip_comments(xml_text)
    return xml_text.gsub(/<!.*?>/im,'')  
  end


  # Strip out all microsoft proprietary codes from the XML/HTLM input string.
  #
  # @example
  #   s="Hello<!-[if foo]>Microsoft<![endif]->World"
  #   XML.strip_microsoft(s) => "HelloWorld"
  #
  # @return [String] the text, stripped of Microsoft markup

  def XML.strip_microsoft(xml_text)
    return xml_text.gsub(/<!-*\[if\b.*?<!\[endif\]-*>/im,'')
  end


  # Strip out all unprintable characters from the XML/HTML input string.
  #
  # @example
  #   s="Hello\XXXWorld" # where XXX is unprintable
  #   XML.strip_unprintables(s) => "HelloWorld"
  #
  # @return [String] the text, stripped of unprintables

  def XML.strip_unprintables(xml_text)
    return xml_text.gsub(/[^[:print:]]/, "")
  end

end
