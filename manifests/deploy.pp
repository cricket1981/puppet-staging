define staging::deploy (
  $source,
  $target,
) {
  exec { "retrieve ${name}":
    command => "curl -o /opt/staging/${name} ${source}",
    creates => "/opt/staging/${name}",
    cwd     => $target,
  }
  $basename = staging_parse($source, 'basename', '.tar.gz')
  exec { "extract ${name}":
    command => "tar xzf /opt/staging/${name}",
    cwd     => $target,
    creates => "${target}/${basename}",
    require => Exec["retrieve ${name}"],
  }
}
