<?php

// Initialise Twig
include('include/twig.php');
$twig = init_twig();


// Récupère les données GET sur l'URL
if (isset($_GET['id'])) $id = $_GET['id']; else $id = 0;

// Convertit l'identifiant en entier
$id = intval($id);


// Connexion à la base de données
include('include/connexion.php');
$pdo = connexion();

// Récupération des données : exemples
include('include/select.php');
$affiche = select_affiche($pdo, $id);
$conseil = select_conseil($pdo);
$duree = select_duree($pdo);
$avg = select_avg_duree($pdo);
$min = select_min($pdo);
$nb_film = select_nb_film($pdo);
$suggest = select_suggest($pdo, $id);


// Lancement du moteur Twig avec les données
echo $twig->render('index.twig', [
    'affiche' => $affiche,
    'conseil' => $conseil,
    'duree' => $duree,
    'avg' => $avg,
    'min' => $min,
    'nb_film' => $nb_film,
    'suggest' => $suggest,
]);
