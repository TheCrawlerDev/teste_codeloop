<?php

function validaCPF($cpf) {
 
    $cpf = preg_replace( '/[^0-9]/is', '', $cpf );
     
    if (strlen($cpf) != 11) return false;

    if (preg_match('/(\d)\1{10}/', $cpf)) return false;

    for ($t = 9; $t < 11; $t++) {
        for ($d = 0, $c = 0; $c < $t; $c++) {
            $d += $cpf{$c} * (($t + 1) - $c);
        }
        $d = ((10 * $d) % 11) % 10;
        if ($cpf{$c} != $d) return false;
    }
    return true;

}

<?
function validaData($dat){
	$data = explode("/","$dat");
	$day = $data[0];
	$month = $data[1];
	$year = $data[2];
	return boolval(checkdate($month,$day,$year));
}

if(validaCPF($_POST['cpf_da_mae'])==false) die('cpf não existe!');

if(validaData($_POST['data_preferencial_de_pagamento'])==false) die('cpf não existe!');

if(validaData($_POST['data_de_nascimento'])==false) die('cpf não existe!');

$json = json_encode(file_get_contents('react.json'));

$json[] = $_POST;

file_put_contents('react.json', json_encode($json));

?>
