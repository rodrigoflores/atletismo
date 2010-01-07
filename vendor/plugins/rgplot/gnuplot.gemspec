# -*- ruby -*-

require 'rubygems'

spec = Gem::Specification.new do |s|
  s.name = 'gnuplot'
  s.summary = "Utility library to aid in interacting with gnuplot"
  s.version = "2.2"
  s.platform = Gem::Platform::RUBY
  s.date  = Time.new

  s.files = [ "lib/gnuplot.rb" ]

  s.autorequire = 'gnuplot.rb'
  s.author = "Gordon James Miller"
  s.email = "gmiller@bittwiddlers.com"
  s.rubyforge_project = "rgplot"
  s.homepage = "http://rgplot.rubyforge.org"
end

if $0==__FILE__
  Gem.manage_gems
  Gem::Builder.new(spec).build
end
