#!/usr/bin/env php
<?php
$deviceToken = '676ba4523dd74b405f63e3b52df538ab5260649b3ed2a27ab4c3a6a4c1592a83'; //Dnepr iPad2
$clipTitle = 'Obama is president';
$message = array( 'loc-key' => 'APNS_VIDEO_AVAILABLE', 'loc-args' => array( $clipTitle ), 'action-loc-key' => 'APNS_SHOW_VIDEO' );

//$badge = 8;
//$sound = true;

// Construct the notification payload
$body = array();
$body['aps'] = array('alert' => $message);
//if ($badge)
//$body['aps']['badge'] = $badge;
//if ($sound)
//$body['aps']['sound'] = $sound;

$body['clipId'] = '123456';
/* End of Configurable Items */

$ctx = stream_context_create();

stream_context_set_option($ctx, 'ssl', 'local_cert', 'ReutersAPNS.pem');
// assume the private key passphase was removed.
// stream_context_set_option($ctx, 'ssl', 'passphrase', '123');

$fp = stream_socket_client('ssl://gateway.sandbox.push.apple.com:2195', $err, $errstr, 60, STREAM_CLIENT_CONNECT, $ctx);
if (!$fp) {
 print "Failed to connect $err $errstr\n";
 return;
}
else {
print "Connection OK\n";
}

$payload = json_encode($body);
$msg = chr(0) . pack("n",32) . pack('H*', str_replace(' ', '', $deviceToken)) . pack("n",strlen($payload)) . $payload;
print "sending message :" . $payload . "\n";
fwrite($fp, $msg);
fclose($fp);
?>