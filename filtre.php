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
$genre = select_filtre_genre($pdo);
$realisateur = select_filtre_realisateur($pdo);
$acteur = select_filtre_acteur($pdo);
$filtre = select_filtre($pdo);
$filtre_count = select_filtre_count($pdo);

// Lancement du moteur Twig avec les données
echo $twig->render('filtre.twig', [
    'genre' => $genre,
    'realisateur' => $realisateur,
    'acteur' => $acteur,
    'filtre' => $filtre,
    'filtre_count' => $filtre_count,
]);