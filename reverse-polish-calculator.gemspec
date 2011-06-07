# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'reverse-polish-calculator/version'

Gem::Specification.new do |s|
  s.name        = 'reverse-polish-calculator'
  s.version     = ReversePolishCalculator::VERSION
  s.authors     = 'Justin Ko'
  s.email       = 'jko170@gmail.com'
  s.homepage    = 'https://github.com/justinko/reverse-polish-calculator'
  s.summary     = 'Reverse Polish Calculator'
  s.description = 'Command line RPN (Reverse Polish Notation) calculator'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_path  = 'lib'
  
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'aruba'
end
