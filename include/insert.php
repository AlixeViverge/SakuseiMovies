<?php


function insert_favoris($pdo, $id)
{
  $sql = 'INSERT INTO favoris (id_film)
  (SELECT DISTINCT :id FROM film where not exists (select id_film from favoris where id_film = :id));';

  $query = $pdo->prepare($sql); 
  $query->bindValue(':id',$id,PDO::PARAM_INT);
  $query->execute();

  if ($query->errorCode() == '00000') {
    $tableau = $query->fetchAll(PDO::FETCH_ASSOC);
  } else {
    echo '<p>Erreur dans la requête : ' . $query->errorInfo()[2] . '</p>';
    $tableau = null;
  }

  return $tableau;
}
