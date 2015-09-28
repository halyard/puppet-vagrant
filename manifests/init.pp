# == Class: vagrant
#
# Install vagrant
#
class vagrant (
) {
  package { 'vagrant':
    provider => 'brewcask',
    require  => Homebrew::Tap['halyard/casks']
  }

  ruby_gem { ['ruby-keychain', 'linodeapi']: }
}
