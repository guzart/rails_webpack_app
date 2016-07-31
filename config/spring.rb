%w(
  .ruby-version
  .rbenv-vars
  tmp/restart.txt
  tmp/caching-dev.txt
  vendor/hauler/lib
).each { |path| Spring.watch(path) }
