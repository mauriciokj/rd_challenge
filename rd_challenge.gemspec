# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
Gem::Specification.new do |s|
    s.add_dependency 'restforce'
    s.name          = 'rd_challenge'
    s.version       = '0.0.3'
    s.summary       = "Gem to integrate an Rails App with Salesforce"
    s.description   = "Gem to integrate an Rails App with Salesforce"
    s.authors       = ["Mauricio Krzesinski Junior"]
    s.email         = 'mauriciokj@gmail.com'
    s.files         = `git ls-files -z`.split("\x0")
    s.executables   = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
    s.test_files    = s.files.grep(%r{^(test|spec|features)/})
    s.require_paths = ["lib"]
    s.homepage      = ''
    s.license       = 'MIT'
    
end
