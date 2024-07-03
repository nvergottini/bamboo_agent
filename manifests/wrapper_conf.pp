# Defines properties in the wrapper.conf file
# @param home The home directory of the bamboo-agent user
# @param properties A hash of options to add to the wrapper.conf file
define bamboo_agent::wrapper_conf (
  Stdlib::Unixpath $home,
  Hash[String, String] $properties = {},
) {
  $_path = "${home}/conf/wrapper.conf"

  $properties.each |$key, $value| {
    file_line { "${_path}:${key}":
      path  => $_path,
      line  => "${key}=${value}",
      match => "^#?${key}=",
    }
  }
}
