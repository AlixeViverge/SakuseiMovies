<?php
// Get the form data
$id_film = $_POST['id_film'];
$pseudo = strip_tags(stripslashes($_POST['pseudo']));
$commentaire = strip_tags(stripslashes($_POST['commentaire']));



// Create a PDO connection to the database
include('include/connexion.php');
$pdo = connexion();

// Prepare the SQL statement
    $sql = "INSERT INTO commentaire (id_film, pseudo, commentaire) VALUES (:id_film,:pseudo,:commentaire)";

$stmt = $pdo->prepare($sql);

// Bind the form data to the SQL parameters
$stmt->bindParam(':id_film', $id_film, PDO::PARAM_INT);
$stmt->bindParam(':pseudo', $pseudo, PDO::PARAM_STR);
$stmt->bindParam(':commentaire', $commentaire, PDO::PARAM_STR);


// Execute the SQL statement
$stmt->execute();

// Redirect back to the form page or to a thank you page
header("Location: detail.php?id=" . $id_film);
exit();
?>