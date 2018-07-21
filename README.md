# Rebuild Search

Search service for [Rebuild.fm](https://rebuild.fm)'s episodes.

## Requirements

- Ruby 2.4.2
- Bundler
- [heroku](https://devcenter.heroku.com/articles/heroku-cli)

## Deployment

    heroku create rebuild-search
    heroku addons:create heroku-postgresql:hobby-dev
    heroku addons:add scheduler:standard
    heroku buildpacks:add --index 1 heroku/nodejs
    heroku buildpacks:add --index 2 heroku/ruby

    git push heroku master
    heroku run rake db:migrate

    heroku open

    heroku addons:open scheduler  # to configure scheduler
