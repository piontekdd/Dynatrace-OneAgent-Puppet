# Class: dynatraceoneagent::service:  See README.md for documentation.
# ===========================
#
#
class dynatraceoneagent::service {

  $service_name             = $dynatraceoneagent::service_name

  if ($::kernel == 'Linux') or ($::osfamily  == 'AIX') {
    $require_value = Exec['install_oneagent']
  }

  if ($::osfamily == 'Windows'){
    $require_value = Package[$service_name]
  }

  service{ $service_name:
      ensure     => running,
      enable     => true,
      hasstatus  => true,
      hasrestart => true,
      require    => $require_value,
  }

}
