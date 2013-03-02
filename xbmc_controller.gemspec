# -*- encoding: utf-8 -*-
require File.expand_path('../lib/xbmc/version', __FILE__)

Gem::Specification.new do |gem|
	gem.authors = ["Jack Palfrey"]
	gem.email = ["jack.palf@gmail.com"]
	gem.description = %q{A library for navigating and executing the XBMC JSONRPC API}
	gem.summary = %q{XBMC Controller}
	gem.homepage = ""

	gem.files = `git ls-files`.split($\)
	gem.executables = gem.files.grep(%r{^bin/}).map { |f| File.basename(f) }
	gem.test_files = gem.files.grep(%r{^(test|spec|features)/})
	gem.name = "xbmc_controller"
	gem.require_paths = ["lib"]
	gem.version = XBMC::VERSION
end
