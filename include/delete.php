<?php

function delete_fav($pdo, $id)
{
  $sql = 'DELETE FROM favoris WHERE id_favoris=:id';

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