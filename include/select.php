<?php

/*FONCTIONS PAGE ACCUEIL*/
function select_affiche($pdo)
{
  $sql = 'SELECT * FROM film WHERE id_film>=1 AND id_film<=4;';

  $query = $pdo->prepare($sql); 
  $query->execute();

  if ($query->errorCode() == '00000') {
    $tableau = $query->fetchAll(PDO::FETCH_ASSOC);
  } else {
    echo '<p>Erreur dans la requête : ' . $query->errorInfo()[2] . '</p>';
    $tableau = null;
  }

  return $tableau;
}

function select_conseil($pdo)
{
  $sql = 'SELECT * FROM film WHERE id_film=11 OR id_film=6;';

  $query = $pdo->prepare($sql); 
  $query->execute();

  if ($query->errorCode() == '00000') {
    $tableau = $query->fetchAll(PDO::FETCH_ASSOC);
  } else {
    echo '<p>Erreur dans la requête : ' . $query->errorInfo()[2] . '</p>';
    $tableau = null;
  }

  return $tableau;
}


function select_duree($pdo)
{
  $sql = 'SELECT * FROM film WHERE duree > 120 ORDER BY duree DESC;';

  $query = $pdo->prepare($sql);
  $query->execute();


  if ($query->errorCode() == '00000') {
    $tableau = $query->fetchAll(PDO::FETCH_ASSOC);
  } else {
    echo '<p>Erreur dans la requête : ' . $query->errorInfo()[2] . '</p>';
    $tableau = null;
  }

  return $tableau;
}


function select_avg_duree($pdo)
{
  $sql = 'SELECT ROUND(AVG(duree),1) AS `avg` FROM film;';

  $query = $pdo->prepare($sql);
  $query->execute();


  if ($query->errorCode() == '00000') {
    $tableau = $query->fetchAll(PDO::FETCH_ASSOC);
  } else {
    echo '<p>Erreur dans la requête : ' . $query->errorInfo()[2] . '</p>';
    $tableau = null;
  }

  return $tableau;
}

function select_min($pdo)
{
  $sql = 'SELECT MIN(duree) AS `min` FROM film';

  $query = $pdo->prepare($sql);
  $query->execute();


  if ($query->errorCode() == '00000') {
    $tableau = $query->fetchAll(PDO::FETCH_ASSOC);
  } else {
    echo '<p>Erreur dans la requête : ' . $query->errorInfo()[2] . '</p>';
    $tableau = null;
  }

  return $tableau;
}


function select_nb_film($pdo)
{
  $sql = 'SELECT COUNT(film.id_film) AS `nb_film` FROM film';

  $query = $pdo->prepare($sql);
  $query->execute();


  if ($query->errorCode() == '00000') {
    $tableau = $query->fetchAll(PDO::FETCH_ASSOC);
  } else {
    echo '<p>Erreur dans la requête : ' . $query->errorInfo()[2] . '</p>';
    $tableau = null;
  }

  return $tableau;
}


function select_suggest($pdo)
{
  $sql = 'SELECT * FROM film INNER JOIN realisateur ON realisateur.id_realisateur=film.id_realisateur WHERE id_film>=7 AND id_film<=10;';

  $query = $pdo->prepare($sql); 
  $query->execute();

  if ($query->errorCode() == '00000') {
    $tableau = $query->fetchAll(PDO::FETCH_ASSOC);
  } else {
    echo '<p>Erreur dans la requête : ' . $query->errorInfo()[2] . '</p>';
    $tableau = null;
  }

  return $tableau;
}




/*FONCTIONS PAGE GENRES*/
function select_genre_aventure($pdo)
{
  $sql = 'SELECT * FROM film INNER JOIN genre ON genre.id_genre=film.id_genre JOIN realisateur ON realisateur.id_realisateur=film.id_realisateur WHERE genre="Aventure" ORDER BY titre;';

  $query = $pdo->prepare($sql);
  $query->execute();

  if ($query->errorCode() == '00000') {
    $tableau = $query->fetchAll(PDO::FETCH_ASSOC);
  } else {
    echo '<p>Erreur dans la requête : ' . $query->errorInfo()[2] . '</p>';
    $tableau = null;
  }

  return $tableau;
}


function select_genre_fantastique($pdo)
{
  $sql = 'SELECT * FROM film INNER JOIN genre ON genre.id_genre=film.id_genre JOIN realisateur ON realisateur.id_realisateur=film.id_realisateur WHERE genre="Fantastique" ORDER BY titre;';

  $query = $pdo->prepare($sql);
  $query->execute();

  if ($query->errorCode() == '00000') {
    $tableau = $query->fetchAll(PDO::FETCH_ASSOC);
  } else {
    echo '<p>Erreur dans la requête : ' . $query->errorInfo()[2] . '</p>';
    $tableau = null;
  }

  return $tableau;
}


function select_genre_drame($pdo)
{
  $sql = 'SELECT * FROM film INNER JOIN genre ON genre.id_genre=film.id_genre JOIN realisateur ON realisateur.id_realisateur=film.id_realisateur WHERE genre="Drame" ORDER BY titre;';

  $query = $pdo->prepare($sql);
  $query->execute();


  if ($query->errorCode() == '00000') {
    $tableau = $query->fetchAll(PDO::FETCH_ASSOC);
  } else {
    echo '<p>Erreur dans la requête : ' . $query->errorInfo()[2] . '</p>';
    $tableau = null;
  }

  return $tableau;
}


function select_genre_romance($pdo)
{
  $sql = 'SELECT * FROM film INNER JOIN genre ON genre.id_genre=film.id_genre JOIN realisateur ON realisateur.id_realisateur=film.id_realisateur WHERE genre="Romance" ORDER BY titre;';

  $query = $pdo->prepare($sql);
  $query->execute();


  if ($query->errorCode() == '00000') {
    $tableau = $query->fetchAll(PDO::FETCH_ASSOC);
  } else {
    echo '<p>Erreur dans la requête : ' . $query->errorInfo()[2] . '</p>';
    $tableau = null;
  }

  return $tableau;
}


/*FONCTION PAGE REALISATEUR*/

function select_films_realisateur($pdo)
{
// Requête SQL pour récupérer tous les réalisateurs
$sql_realisateurs = "SELECT * FROM realisateur ORDER BY nom_realisateur";
 
// Exécution de la requête SQL
$stmt_realisateurs = $pdo->prepare($sql_realisateurs);
$stmt_realisateurs->execute();

// Tableau pour stocker les réalisateurs et leurs films
$realisateurs = array();

// Boucle sur les résultats pour récupérer la liste des films de chaque réalisateur
while ($realisateur = $stmt_realisateurs->fetch(PDO::FETCH_ASSOC)) {
    // Requête SQL pour récupérer les films du réalisateur en cours de traitement  ;
    $sql_films = "SELECT * FROM film WHERE id_realisateur = $realisateur[id_realisateur] order by titre;";
    
    // Préparation de la requête SQL
    $stmt_films = $pdo->prepare($sql_films);

    // Exécution de la requête SQL
    $stmt_films->execute();
    
    // Récupération des résultats
    $films = array();
    while ($film = $stmt_films->fetch(PDO::FETCH_ASSOC)) {
    $films[] = $film['titre'];
    }
    // Stockage des résultats dans le tableau des réalisateurs
    $realisateurs[] = array(
        'nom_realisateur' => $realisateur['nom_realisateur'] ,
        'prenom_realisateur' => $realisateur['prenom_realisateur'] ,
        'films' => $films
    );
}

return $realisateurs;
}


/*FONCTIONS PAGE LISTE DE TOUS LES FILMS*/
function select_lst_films($pdo,$id)
{
  $sql = 'SELECT * 
  FROM film
  ORDER BY titre;';

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


/*FONCTIONS PAGE DETAILS*/
function select_detail($pdo,$id)
{
  $sql = 'SELECT * FROM film 
  INNER JOIN realisateur ON realisateur.id_realisateur=film.id_realisateur
  JOIN genre ON genre.id_genre=film.id_genre
  JOIN acteur ON acteur.id_acteur=film.id_acteur
  WHERE id_film=:id';

  $query = $pdo->prepare($sql);
  $query->bindValue(':id',$id,PDO::PARAM_INT);
  $query->execute();

  if ($query->errorCode() == '00000') {
    $tableau = $query->fetch(PDO::FETCH_ASSOC);
  } else {
    echo '<p>Erreur dans la requête : ' . $query->errorInfo()[2] . '</p>';
    $tableau = null;
  }
  return $tableau;
}

function select_comm($pdo, $id)
{
  $sql = 'SELECT * FROM commentaire WHERE id_film = :id';

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


/*FONCTIONS PAGE FILTRE*/

function select_filtre_genre($pdo)
{
  $sql = 'SELECT * FROM genre';

  $query = $pdo->prepare($sql);
  $query->execute();

  if ($query->errorCode() == '00000') {
    $tableau = $query->fetchAll(PDO::FETCH_ASSOC);
  } else {
    echo '<p>Erreur dans la requête : ' . $query->errorInfo()[2] . '</p>';
    $tableau = null;
  }

  return $tableau;
}

function select_filtre_realisateur($pdo)
{
  $sql = 'SELECT * FROM realisateur';

  $query = $pdo->prepare($sql);
  $query->execute();

  if ($query->errorCode() == '00000') {
    $tableau = $query->fetchAll(PDO::FETCH_ASSOC);
  } else {
    echo '<p>Erreur dans la requête : ' . $query->errorInfo()[2] . '</p>';
    $tableau = null;
  }

  return $tableau;
}

function select_filtre_acteur($pdo)
{
  $sql = 'SELECT * FROM acteur';

  $query = $pdo->prepare($sql);
  $query->execute();

  if ($query->errorCode() == '00000') {
    $tableau = $query->fetchAll(PDO::FETCH_ASSOC);
  } else {
    echo '<p>Erreur dans la requête : ' . $query->errorInfo()[2] . '</p>';
    $tableau = null;
  }

  return $tableau;
}

// Sélectionne toutes les lignes d'une table
function select_filtre($pdo)
{

// construction de la requête
  $sql = 'SELECT * FROM film
  WHERE true';

  if (isset($_POST['genre'])) {
      $sql = $sql . " and id_genre in (";

      $sql = $sql . implode(',',$_POST['genre']);

      $sql = $sql . ")";

  }

  if (isset($_POST['realisateur'])) {
      $sql = $sql . " and id_realisateur in (";

      $sql = $sql . implode(',',$_POST['realisateur']);

      $sql = $sql . ")";

  }

  if (isset($_POST['acteur'])) {
        $sql = $sql . " and id_acteur in (";

        $sql = $sql . implode(',',$_POST['acteur']);

        $sql = $sql . ")";

}

  // préparation et exécution de la requête
  $query = $pdo->prepare($sql);
  $query->execute();

  // vérification des erreurs
  if ($query->errorCode() == '00000') {
  // récupération des données dans un tableau
    $tableau = $query->fetchAll(PDO::FETCH_ASSOC);
  } else {
    echo '<p>Erreur dans la requête : ' . $query->errorInfo()[2] . '</p>';
    $tableau = null;
  }

  // renvoie le tableau
  return $tableau;
}

function select_filtre_count($pdo)
{
  $sql = 'SELECT *, COUNT(*) AS "filtre_count"
  FROM film
  WHERE true ';

  if (isset($_POST['genre'])) {
      $sql = $sql . " and id_genre in (";

      $sql = $sql . implode(',',$_POST['genre']);

      $sql = $sql . ")";

  }

  if (isset($_POST['realisateur'])) {
      $sql = $sql . " and id_realisateur in (";

      $sql = $sql . implode(',',$_POST['realisateur']);

      $sql = $sql . ")";

  }

  if (isset($_POST['acteur'])) {
      $sql = $sql . " and id_acteur in (";

      $sql = $sql . implode(',',$_POST['acteur']);

      $sql = $sql . ")";

  }

  $query = $pdo->prepare($sql);
  $query->execute();

  if ($query->errorCode() == '00000') {
    $tableau = $query->fetch(PDO::FETCH_ASSOC);
  } else {
    echo '<p>Erreur dans la requête : ' . $query->errorInfo()[2] . '</p>';
    $tableau = null;
  }

  return $tableau;
}

/*FONCTIONS PAGE FAVORIS*/
function select_favoris($pdo)
{
  $sql = 'SELECT * FROM film 
  INNER JOIN genre ON genre.id_genre=film.id_genre 
  JOIN realisateur ON realisateur.id_realisateur=film.id_realisateur
  JOIN acteur ON acteur.id_acteur=film.id_acteur
  JOIN favoris ON favoris.id_film=film.id_film
  WHERE favoris.id_film=film.id_film
  ORDER BY id_favoris DESC;';

  $query = $pdo->prepare($sql);
  $query->execute();


  if ($query->errorCode() == '00000') {
    $tableau = $query->fetchAll(PDO::FETCH_ASSOC);
  } else {
    echo '<p>Erreur dans la requête : ' . $query->errorInfo()[2] . '</p>';
    $tableau = null;
  }

  return $tableau;
}