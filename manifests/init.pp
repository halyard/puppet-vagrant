# == Class: vagrant
#
# Full description of class vagrant here.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
class vagrant (
) {
  package { 'vagrant':
    provider => 'brewcask',
    require  => Homebrew::Tap['halyard/casks']
  }

  ruby_gem { ['ruby-keychain', 'linodeapi']: }
}
