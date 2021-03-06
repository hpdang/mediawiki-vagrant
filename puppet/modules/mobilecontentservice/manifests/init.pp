# == Class: mobilecontentservice
#
# The mobile content service is a Node.JS service for massaging Wiki
# HTML making it more suitable for display in native mobile phone apps.
#
# === Parameters
#
# [*port*]
#   Port the mobile content service listens on for incoming connections.
#
# [*log_level*]
#   The lowest level to log (trace, debug, info, warn, error, fatal)
#
class mobilecontentservice(
    $port,
    $log_level = undef,
) {

    require ::restbase

    service::node { 'mobileapps':
        port      => $port,
        log_level => $log_level,
        config    => {
            restbase_uri => "localhost:${::restbase::port}",
        },
    }

}
