<?php

// Initialise Twig
include('include/twig.php');
$twig = init_twig();

// Connexion à la base de données
include('include/connexion.php');
$pdo = connexion();
if (isset($_GET['id'])) $id = $_GET['id']; else $id = 0;

// Convertit l'identifiant en entier
$id = intval($id);

include('include/select.php');
$detail = select_detail($pdo,$id);
$comm = select_comm($pdo,$id);


// Lancement du moteur Twig avec les données
echo $twig->render('detail.twig', [
    'detail' => $detail,
    'comm' => $comm,
]);