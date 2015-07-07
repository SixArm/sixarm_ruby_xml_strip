# -*- coding: utf-8 -*-
require "minitest/autorun"
require "simplecov"
SimpleCov.start
require "sixarm_ruby_xml_strip"
require "pathname"

describe XML do

  before do
    TESTPATH ||= Pathname.new("test/sixarm_ruby_xml_strip_test")
  end

  describe ".strip_all" do

    it "=> String" do
      XML.strip_all("").must_be_kind_of String
    end

    it "strips everything from a sample string" do
      s="<foo a=b c=d><!--comment-->Hello<!-[if bar]>Microsoft<![endif]>World</foo>"
      XML.strip_all(s).must_equal "<foo>HelloWorld</foo>"
    end

    it "strip everything from a real document with Microsoft Word HTML" do
      dirty=File.open(TESTPATH + "microsoft_word_dirty.html", "rb")
      clean=File.open(TESTPATH + "microsoft_word_clean.html", "rb")
      XML.strip_all(dirty.read).must_equal clean.read
    end
    
  end 
    
  describe ".strip_attributes" do

    it "=> String" do
      XML.strip_attributes("").must_be_kind_of String
    end

    it "strips all attributes" do
      s="<foo a=b c=d e=f>Hello</foo>"                                                                          
      XML.strip_attributes(s).must_equal "<foo>Hello</foo>" 
    end

  end

  describe ".strip_comments" do

    it "=> String" do
      XML.strip_comments("").must_be_kind_of String
    end

    it "strips all comments" do
      s="Hello<!--comment-->World" 
      XML.strip_comments(s).must_equal "HelloWorld"
    end
  end

  describe ".strip_micrsoft" do

    it "=> String" do
      XML.strip_microsoft("").must_be_kind_of String
    end

    it "strips Microsoft-specific markup" do
      s="Hello<!-[if foo]>Microsoft<![endif]->World"     
      XML.strip_microsoft(s).must_equal "HelloWorld"    
    end

  end

  describe ".strip_unprintables" do

    it "=> String" do
      XML.strip_unprintables("").must_be_kind_of String
    end

    it "strips unprintable characters" do
      s="\aHello\bWorld\b" 
      XML.strip_unprintables(s).must_equal "HelloWorld"
    end

  end

end
