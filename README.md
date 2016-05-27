# Today Icelab Learned

[A knowledgebase of little learnings](http://til.icelab.com.au/) from the team at [Icelab](http://icelab.com.au/).

## Contributing

1. Open a new pull request against this repository (using a feature branch).
2. Add a markdown file with your learnings under `source/posts/`, or you can ask middleman to create one for you:

```
middleman article "Your new post’s title"
```

3. Add YAML front-matter for the post's `title`, publishing `date`, your name as `author`, and a comma-separated list of `tags`
4. Short is sweet. Your learning doesn't need to be lengthy. A few sentences and some example code is enough. The markdown is parsed as [GFM](https://help.github.com/articles/github-flavored-markdown/) so you can used fenced code-blocks with syntax highlighting.

## Building the site

The site is _(well, will be)_ built automatically when new posts are merged into the `master` branch.

You can run it locally thusly:

```
bin/setup
bundle exec rake watch
```

This’ll spin up the development server on `http://localhost:4567`.

To build out the static files into `build/` run:

```
bundle exec rake build
```

## Assets

The design-specifics for this site are contained in a separate `til-assets` private repo. You’ll need to remove the `.gitmodules` file and place your own assets in `./source/assets/public`.

We’ve left a base target for you to copy in `./source/assets/public-demo`, so just:

```
rm .gitmodules
mv ./source/assets/public-demo ./source/assets/public
```

... and you should be good to go!

## Copyright

© 2015-2016 [Icelab](http://icelab.com.au/). Distributed under the [Creative Commons Attribution License](http://creativecommons.org/licenses/by/3.0/).
