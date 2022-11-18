workspace(name = "a2")

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")

#———————————————————————————————————————————————————————————————————————
# To get the latest ruby rules, grab the 'master' branch.
#———————————————————————————————————————————————————————————————————————

git_repository(
    name = "bazelruby_rules_ruby",
    remote = "https://github.com/bazelruby/rules_ruby.git",
    branch = "master"
)

load(
    "@bazelruby_rules_ruby//ruby:deps.bzl",
    "rules_ruby_dependencies",
    "rules_ruby_select_sdk",
)

rules_ruby_dependencies()

rules_ruby_select_sdk(version = "3.0.2")
#———————————————————————————————————————————————————————————————————————
# Specify Ruby version — this will either build Ruby or use a local
# RBENV installation if the Ruby version matches.
#———————————————————————————————————————————————————————————————————————

load("@bazelruby_rules_ruby//ruby:defs.bzl", "ruby_bundle")


#———————————————————————————————————————————————————————————————————————
# Now, load the ruby_bundle rule & install gems specified in the Gemfile
#———————————————————————————————————————————————————————————————————————
ruby_bundle(
    name = "bundle",
    gemfile = "//:Gemfile",
    gemfile_lock = "//:Gemfile.lock",
    srcs = ["//:a2.gemspec", "//:lib/a2/version.rb"],
    bundler_version = "2.2.22",
)
