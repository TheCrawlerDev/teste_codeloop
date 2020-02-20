<?php

$json = json_encode(file_get_contents('react.json'));

$json[] = $_POST;

file_put_contents('react.json', json_encode($json));

?>
