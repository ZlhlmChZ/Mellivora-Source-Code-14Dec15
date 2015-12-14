<?php

require('../../include/mellivora.inc.php');

enforce_authentication(CONFIG_UC_MODERATOR);
enforce_instance_auth();

head('Instances');
menu_management();
section_head('Instances');

echo '
    <table id="files" class="table table-striped table-hover">
      <thead>
        <tr>
          <th>#</th>
          <th>Name</th>
          <th>URI</th>
          <th>Session Administrator Account Email</th>
          <th></th>
        </tr>
      </thead>
      <tbody>
    ';

$types = db_query_fetch_all('SELECT * FROM instances ORDER BY id ASC');
foreach($types as $type) {
    
    $user = db_select_one(
    'users',
    array('*'),
    array('id' => $type['authoratativeAccountID'])
   );
    
    echo '
    <tr>
        <td>',htmlspecialchars($type['id']),'</td>
        <td>',short_description($type['name'], 50),'</td>
         <td>',short_description($type['instanceURI'], 50),'</td>
         <td>',short_description($user['email'], 50),'</td>
        <td><a href="actions/edit_instance.php?action=view&id=',htmlspecialchars($type['id']),'" class="btn btn-xs btn-warning">View</a>
        <a href="edit_instance.php?action=edit&id=',htmlspecialchars($type['id']), '" class="btn btn-xs btn-primary">Edit</a>
        </td>
    </tr>
    ';
}

echo '
      </tbody>
    </table>
     ';

foot();