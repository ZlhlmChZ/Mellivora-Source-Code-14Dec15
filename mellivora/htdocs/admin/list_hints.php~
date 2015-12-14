<?php

require('../../include/mellivora.inc.php');

enforce_authentication(CONFIG_UC_MODERATOR);

head('Hints');
menu_management();
section_head('Hints');

echo '
    <table id="hints" class="table table-striped table-hover">
      <thead>
        <tr>
	  <th>Category</th>
          <th>Challenge</th>
          <th>Added</th>
          <th>Hint</th>
          <th>Manage</th>
        </tr>
      </thead>
      <tbody>
    ';

$hints = db_query_fetch_all('
    SELECT
       cat.title as catTitle,
       h.added,
       h.body,
       c.title 
    FROM hints AS h
    LEFT JOIN challenges AS c ON c.id = h.challenge
    LEFT JOIN categories AS cat ON cat.id = c.category
    WHERE h.instanceID = \''.$_SESSION["IID"].'\'
    ORDER BY catTitle'
);

foreach($hints as $hint) {
    echo '
    <tr>
	<td>',htmlspecialchars($hint['catTitle']),'</td>
        <td>',htmlspecialchars($hint['title']),'</td>
        <td>',date_time($hint['added']),'</td>
        <td>',htmlspecialchars($hint['body']), '</td>
        <td><a href="edit_hint.php?id=',$hint['id'],'" class="btn btn-xs btn-primary">Edit</a></td>
    </tr>
    ';
}

echo '
      </tbody>
    </table>
     ';

foot();
