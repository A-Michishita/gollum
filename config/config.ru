#!/usr/bin/env ruby
require 'rubygems'
require 'gollum/app'

gollum_path = File.expand_path(File.expand_path("../..", __FILE__))
Precious::App.set(:gollum_path, gollum_path)
Precious::App.set(:default_markup, :markdown)
Precious::App.set(:wiki_options,{
	:universal_toc => true,
	:allow_uploads => true
})
run Precious::App
