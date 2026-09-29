# frozen_string_literal: true

# A site that uses this theme may not hold its own copy of a theme file. Jekyll gives the site's
# file precedence without a word, so a copy is a fork: the theme moves on and the site goes on
# serving what it copied. The build stops instead, and names the files to delete.
Jekyll::Hooks.register :site, :after_init do |site|
	theme = site.theme
	next unless theme && theme.name == "reduck-theme"

	shadowed = %w[assets _includes].flat_map do |dir|
		Dir.glob("**/*", base: File.join(theme.root, dir))
			.map { |path| File.join(dir, path) }
			.select { |path| File.file?(File.join(theme.root, path)) }
			.select { |path| File.exist?(File.join(site.source, path)) }
	end

	unless shadowed.empty?
		raise Jekyll::Errors::FatalException,
			"reduck-theme: this site holds its own copy of #{shadowed.join(", ")}. " \
			"The theme's file is the only one; delete the site's copy and change the theme instead."
	end
end
