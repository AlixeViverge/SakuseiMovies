<?php

function connexion()
{
  $pdo = new PDO('mysql:host=tp2.iha.unistra.fr;dbname=viverge_sae203;charset=utf8', 'viverge', 'ei45354eAlixe!');
  $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_WARNING);

  if ($pdo) {
    return $pdo;
  } else {
    echo '<p>Erreur de connexion</p>';
    exit;
  }
}
