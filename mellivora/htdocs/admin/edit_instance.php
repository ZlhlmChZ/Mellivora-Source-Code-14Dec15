<?php

require('../../include/mellivora.inc.php');

enforce_authentication(CONFIG_UC_MODERATOR);
enforce_instance_auth();

validate_id($_GET['id']);

head('Site management');
menu_management();
section_subhead('Edit instance');


$user_type = db_select_one(
    'instances',
    array('*'),
    array('id' => $_GET['id'])
);

form_start(CONFIG_SITE_ADMIN_RELPATH . 'actions/edit_instance');
form_input_text('Instance Name', $user_type['name'], array('disabled'=>true));
form_input_text('Instance URI', $user_type['instanceURI'], array('disabled'=>true));
form_end();

echo showConfirmDialogNoEditor('delete_instance', 'Warning! You are about to delete an instance. Do note that records will be stored as part of our archival policy. Contact the Director of the Defense Intelligence Agency for any query.');
form_start(CONFIG_SITE_ADMIN_RELPATH . 'actions/edit_instance');
form_hidden('action', 'delete');
form_hidden('id', $_GET['id']);
form_button_submit('Delete instance', 'danger');
form_end();

foot();