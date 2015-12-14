<?php

require('../../include/mellivora.inc.php');

enforce_authentication(CONFIG_UC_MODERATOR);

head('Submissions');
menu_management();


if (!isset($_GET['all'])) {
    $_GET['all'] = 0;
}

if ($_GET['all']) {
    section_head('All submissions');
} else {
    section_head('Submissions in need of marking', '<a href="list_submissions?all=1">List all submissions</a>', false);
}


$num_subs = db_query_fetch_one('
    SELECT
       COUNT(*) AS num
    FROM submissions AS s
    LEFT JOIN challenges AS c ON c.id = s.challenge
    '.($_GET['all'] ? '' : 'WHERE c.automark = 0 AND s.marked = 0').'
');

$from = get_pager_from($_GET);
$results_per_page = 1000;
if(verifySA())
    $submissions = db_query_fetch_all('
    SELECT
       s.id,
       u.id AS user_id,
       u.team_name,
       s.added,
       s.correct,
       s.flag,
       c.id AS challenge_id,
       c.title AS challenge_title
    FROM submissions AS s
    LEFT JOIN users AS u on s.user_id = u.id
    LEFT JOIN challenges AS c ON c.id = s.challenge
    '.($_GET['all'] ? '' : 'WHERE c.automark = 0 AND s.marked = 0').'
    ORDER BY s.added DESC
    LIMIT '.$from.', '.$results_per_page);
else
$submissions = db_query_fetch_all('
    SELECT
       s.id,
       u.id AS user_id,
       u.team_name,
       s.added,
       s.correct,
       s.flag,
       c.id AS challenge_id,
       c.title AS challenge_title
    FROM submissions AS s
    LEFT JOIN users AS u on s.user_id = u.id
    LEFT JOIN challenges AS c ON c.id = s.challenge
    '.($_GET['all'] ? '' : 'WHERE c.automark = 0 AND s.marked = 0').'
    WHERE s.instanceID = \''.$_SESSION["IID"].'\'
    ORDER BY s.added DESC
    LIMIT '.$from.', '.$results_per_page);

pager(CONFIG_SITE_ADMIN_URL.'list_submissions/?'.(isset($_GET['all']) ? 'all='.$_GET['all'] : ''), count($submissions), $results_per_page, $from);

echo '
    <table style="width:100%; table-layout:fixed;"  id="files"  class="table table-striped table-hover" >
      <thead>
        <tr>
          <th style="white-space:nowrap;">Challenge</th>
          <th style="white-space:nowrap;">Team name</th>
          <th style="white-space:nowrap;">Added</th>
          <th style="white-space:nowrap;">Flag</th>
          <th style="white-space:nowrap;">Correct</th>
          <th style="white-space:nowrap;">Manage</th>
        </tr>
      </thead>
      <tbody>
    ';
 
foreach($submissions as $submission) {
    echo '
    <tr>
        <td><a href="../challenge.php?id=',htmlspecialchars($submission['challenge_id']),'">',htmlspecialchars($submission['challenge_title']),'</a></td>
        <td><a href="/user.php?id=',htmlspecialchars($submission['user_id']),'">',htmlspecialchars($submission['team_name']),'</a></td>
        <td>',date_time ($submission['added']),'</td>
        <td style="word-break: break-all;">',htmlspecialchars($submission['flag']),'</td>
        <td>
            ',($submission['correct'] ?
                '<img src="'.CONFIG_SITE_URL.'img/accept.png" alt="Correct!" title="Correct!" />' :
                '<img src="'.CONFIG_SITE_URL.'img/stop.png" alt="Wrong!" title="Wrong!" />'),'
        </td>
        <td>
            <form method="post" action="actions/list_submissions" class="discreet-inline">';
    form_xsrf_token();
    echo '
                <input type="hidden" name="action" value="',($submission['correct'] ? 'mark_incorrect' : 'mark_correct'),'" />
                <input type="hidden" name="id" value="',htmlspecialchars($submission['id']),'" />
                <button type="submit" class="btn btn-sm btn-',($submission['correct'] ? 'warning' : 'success'),'">Mark ',($submission['correct'] ? 'incorrect' : 'correct'),'</button>
            </form>

            <form method="post" action="actions/list_submissions" class="discreet-inline">';
    form_xsrf_token();
    echo '
                <input type="hidden" name="action" value="delete" />
                <input type="hidden" name="id" value="',htmlspecialchars($submission['id']),'" />
                <button type="submit" class="btn btn-sm btn-danger">Delete</button>
            </form>
        </td>
    </tr>
    ';
}

echo '
      </tbody>
    </table>
     ';

foot();


echo'
<!-- DataTables CSS -->
<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.9/css/jquery.dataTables.css">

<!-- jQuery -->
<script type="text/javascript" charset="utf8" src="//code.jquery.com/jquery-1.10.2.min.js"></script>

<!-- DataTables -->
<script type="text/javascript" charset="utf8" src="//cdn.datatables.net/1.10.9/js/jquery.dataTables.js"></script>

';
echo '<script>
        $( document ).ready(function() {
$("#files").DataTable();
});</script>';



