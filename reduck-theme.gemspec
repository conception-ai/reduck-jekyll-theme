Gem::Specification.new do |spec|
	spec.name = "reduck-theme"
	spec.version = "1.0.0"
	spec.authors = ["Reduck"]
	spec.summary = "The design system blog.reduck.ai and docs.reduck.ai are both built on."
	spec.homepage = "https://github.com/conception-ai/reduck-jekyll-theme"
	spec.license = "Nonstandard"
	spec.required_ruby_version = ">= 3.3"
	spec.files = Dir["assets/**/*", "_includes/**/*", "lib/**/*", "README.md"]
	spec.add_runtime_dependency "jekyll", "~> 4.4"
end
