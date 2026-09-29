# reduck-theme

The design system that [blog.reduck.ai](https://github.com/conception-ai/blog.reduck.ai) and
[docs.reduck.ai](https://github.com/conception-ai/docs.reduck.ai) are both built on, as a Jekyll
theme gem. Change it here, once, and both sites pick it up on their next build.

## What is in it

- `assets/css/tokens.css`: the app's palette and type scale, restated.
- `assets/css/system.css`: the components: buttons, the tag, the code frame, callouts, steps.
- `assets/css/prose.css`: how anything written to be read is set, inside a `.prose` element.
- `_includes/reduck-head.html`: the font, the three stylesheets and analytics. A site's head
  includes it, then links its own stylesheet.
- `_includes/icon.html`, `_includes/stream.html`: the icon set and the video embed.

A site keeps only what is its own: its bar, its panel, its footer, its page layouts.

## How a site uses it

```ruby
# Gemfile
group :jekyll_plugins do
	gem "reduck-theme", git: "https://github.com/conception-ai/reduck-jekyll-theme.git", branch: "main"
end
```

```yaml
# _config.yml
theme: reduck-theme
```

Both sites build from the head of `main`: their deploy runs `bundle update reduck-theme` first, so a
commit here reaches them on their next build (each also builds daily). Locally, run the same
command to take the latest.

A site may not hold its own copy of a file this theme ships: `lib/reduck-theme.rb` stops the build
and names it. That rule is what keeps the two sites from drifting apart.

## Access

The repository is private. A site's deploy reads it with a read-only deploy key, held by each site
repository as the Actions secret `THEME_DEPLOY_KEY`. Locally, `bundle install` reads it with your
own GitHub credentials.
