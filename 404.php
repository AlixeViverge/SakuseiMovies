<?php

// Initialise Twig
include('include/twig.php');
$twig = init_twig();

include('include/404.php');

// Lancement du moteur Twig avec les données
echo $twig->render('404.twig', [
    'info' => $info,
]);