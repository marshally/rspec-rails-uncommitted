# rspec-rails-uncommitted

rake tasks for rails-3 which selectively run rspec tests based on your SCM status.

## Install
```ruby
gem install rspec-rails-uncommitted
```

## Configure

Add `rspec-rails-uncommitted` to the `:test` and `:development` groups in the Gemfile:

```ruby
group :test, :development do
  gem "rspec-rails-uncommitted", "~> 2.0"
end
```

It needs to be in the `:development` group to expose generators and rake
tasks without having to type `RAILS_ENV=test`.

## `rake rspec:uncommitted`

This task will execute specs associated with files you have changed and not yet committed.

## `rake rspec:unpushed`

This task will execute specs for files you have committed locally, but haven't pushed up to origin.

## `rake rspec:unmerged`

This task will execute specs for files you have not yet merged back into the master branch.

# Contribute

See [http://github.com/rspec/rspec-dev](http://github.com/rspec/rspec-dev)

# Also see

* [http://github.com/rspec/rspec](http://github.com/rspec/rspec)
* [http://github.com/rspec/rspec-core](http://github.com/rspec/rspec-core)
* [http://github.com/rspec/rspec-rails](http://github.com/rspec/rspec-rails)