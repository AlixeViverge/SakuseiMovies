<?php

include('include/twig.php');
$twig = init_twig();

include('include/connexion.php');
$pdo = connexion();
// Convertit l'identifiant en entier
$id = intval($id);


include('include/insert.php');
include('include/select.php');
include('include/delete.php');

if (isset($_GET['id'])) {
    $id = $_GET['id'];
    if ($_GET['action'] == 'add')
        $fav= insert_favoris($pdo,$id);
    else
        $delete = delete_fav($pdo,$id);
}

$favoris = select_favoris($pdo);


// Lancement du moteur Twig avec les données
echo $twig->render('favoris.twig', [
    'favoris' => $favoris,
]);