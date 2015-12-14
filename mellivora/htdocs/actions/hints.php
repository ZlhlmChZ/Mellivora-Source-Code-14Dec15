<?php
require('../../include/mellivora.inc.php');
enforce_authentication();

if($_GET['action'] == "purchase"){
    
    $hint = db_select_one(
    'hints',
    array('*'),
    array('id' => $_GET['id'])
);
    
     $scores = db_query_fetch_one('
            SELECT
               u.id AS user_id,
               u.team_name,
               u.instanceid,
               co.id AS country_id,
               co.country_name,
               co.country_code,
               SUM(c.points) AS score,
               MAX(s.added) AS tiebreaker
            FROM users AS u
            LEFT JOIN countries AS co ON co.id = u.country_id
            LEFT JOIN submissions AS s ON u.id = s.user_id AND s.correct = 1
            LEFT JOIN challenges AS c ON c.id = s.challenge
            WHERE u.id = \''.$_SESSION["id"].'\'
            GROUP BY u.id
            ORDER BY score DESC, tiebreaker ASC'
        );
     
     $hintpurchase = db_query_fetch_one('SELECT SUM(value) as total FROM purchases WHERE uid ='.$_SESSION['id']);
     $userbal = $scores['score'] - $hintpurchase['score'];
     
     if($hint['value'] <= $userbal){
	 
	  $id = db_insert(
          'purchases',
          array(
             'type'=>'1',
             'value'=>$hint['value'],
             'uid'=>$_SESSION["id"],
	     'hid'=>$hint['id'],
             'instanceID'=>$_SESSION['IID']
          )
        );
	  
	   redirect('challenges');
     }
     else{
	  redirect('challenges?BAlert=1');
     }
    
    
}

