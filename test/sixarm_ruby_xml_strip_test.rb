# -*- coding: utf-8 -*-
require 'minitest/autorun'
require 'minitest/autorun'
require 'simplecov'
SimpleCov.start

require 'pathname'
require 'sixarm_ruby_xml_strip'

describe XML do

  before do
    TESTPATH ||= Pathname.new("test/sixarm_ruby_xml_strip_test")
  end

  describe ".strip_all" do

    it "=> String" do
      assert_kind_of(String, XML.strip_all(""))
    end

    it "strips everything from a sample string" do
      s="<foo a=b c=d><!--comment-->Hello<!-[if bar]>Microsoft<![endif]>World</foo>"
      expect="<foo>HelloWorld</foo>"
      actual=XML.strip_all(s)
      assert_equal(expect,actual)
    end

    it "strip everything from a real document with Microsoft Word HTML" do
      dirty=File.open(TESTPATH + "microsoft_word_dirty.html", "rb")
      clean=File.open(TESTPATH + "microsoft_word_clean.html", "rb")
      expect=clean.read
      actual=XML.strip_all(dirty.read)
      assert_equal(expect,actual)
    end
    
  end 
    
  describe ".strip_attributes" do

    it "=> String" do
      assert_kind_of(String, XML.strip_attributes(""))
    end

    it "strips all attributes" do
      s="<foo a=b c=d e=f>Hello</foo>"                                                                          
      expect="<foo>Hello</foo>" 
      actual=XML.strip_attributes(s) 
      assert_equal(expect,actual)
    end

  end

  describe ".strip_comments" do

    it "=> String" do
      assert_kind_of(String, XML.strip_comments(""))
    end

    it "strips all comments" do
      s="Hello<!--comment-->World" 
      expect="HelloWorld"
      actual=XML.strip_comments(s)
      assert_equal(expect,actual)
    end
  end

  describe ".strip_micrsoft" do

    it "=> String" do
      assert_kind_of(String, XML.strip_microsoft(""))
    end

    it "strips Microsoft-specific markup" do
      s="Hello<!-[if foo]>Microsoft<![endif]->World"     
      expect="HelloWorld"    
      actual=XML.strip_microsoft(s)
      assert_equal(expect,actual)
    end

  end

  describe ".strip_unprintables" do

    it "=> String" do
      assert_kind_of(String, XML.strip_unprintables(""))
    end

    it "strips unprintable characters" do
      s="HelloWorld" #TODO create test that has unprintables
      expect="HelloWorld"
      actual=XML.strip_unprintables(s)
      assert_equal(expect,actual)
    end

  end

end
