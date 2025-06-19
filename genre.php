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
$aventure = select_genre_aventure($pdo, $id);
$drame = select_genre_drame($pdo, $id);
$fantastique = select_genre_fantastique($pdo, $id);
$romance = select_genre_romance($pdo, $id);

// Lancement du moteur Twig avec les données
echo $twig->render('genres.twig', [
    'aventure' => $aventure,
    'drame'=> $drame,
    'fantastique' => $fantastique,
    'romance'=> $romance
]);