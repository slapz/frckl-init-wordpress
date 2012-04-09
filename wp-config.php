<?php

// load the local config if we are in the local enviroment
if (file_exists(dirname( __FILE__ ) . '/.env-local')) {
  require_once('wp-config-local.php');

} else { // load the remote config
  require_once('wp-config-remote.php');
}

?>
