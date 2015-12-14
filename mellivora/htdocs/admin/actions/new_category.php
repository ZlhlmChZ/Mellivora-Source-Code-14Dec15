<?php

require('../../../include/mellivora.inc.php');

enforce_authentication(CONFIG_UC_MODERATOR);

if ($_SERVER['REQUEST_METHOD'] == 'POST') {

    validate_xsrf_token($_POST['xsrf_token']);

    if ($_POST['action'] == 'new') {

       $id = db_insert(
          'categories',
          array(
             'added'=>time(),
             'added_by'=>$_SESSION['id'],
             'title'=>$_POST['title'],
             'instanceID'=>$_SESSION["IID"],
             'description'=>$_POST['description'],
             'available_from'=>strtotime('2015-02-03 21:17:57'),
             'available_until'=>strtotime('2099-02-03 21:17:57')
          )
       );

        if ($id) {
            redirect(CONFIG_SITE_ADMIN_RELPATH . 'edit_category.php?id='.$id);
        } else {
            message_error('Could not insert new category.');
        }
    }
}