<?php

require('../../include/mellivora.inc.php');

enforce_authentication(CONFIG_UC_MODERATOR);

validate_id($_GET['id']);

head('Site management');
menu_management();
section_subhead('Edit hint');

$hint = db_select_one(
    'hints',
    array('*'),
    array('id' => $_GET['id'])
);

form_start(CONFIG_SITE_ADMIN_RELPATH . 'actions/edit_hint');
form_textarea('Body', $hint['body']);

$opts = db_query_fetch_all(
    'SELECT
       ch.id,
       ch.title,
       ca.title AS category
     FROM challenges AS ch
     LEFT JOIN categories AS ca ON ca.id = ch.category
     WHERE ca.instanceID = \''.$_SESSION["IID"].'\'
     ORDER BY ca.title, ch.title'
);
form_input_text('Value',$hint['value']);
form_select($opts, 'Challenge', 'id', $hint['challenge'], 'title', 'category');
form_input_checkbox('Visible', $hint['visible']);
form_hidden('action', 'edit');
form_hidden('id', $_GET['id']);
form_button_submit('Save changes');
form_end();

section_subhead('Files');
form_start(CONFIG_SITE_ADMIN_RELPATH . 'actions/edit_challenge','','multipart/form-data');
form_file('file');
form_hidden('action', 'upload_file');
form_hidden('id', $_GET['id']);
form_button_submit('Upload file');
echo 'Max file size: ',bytes_to_pretty_size(max_file_upload_size());
form_end();

section_subhead('Delete hint');
form_start(CONFIG_SITE_ADMIN_RELPATH . 'actions/edit_hint');
form_input_checkbox('Delete confirmation');
form_hidden('action', 'delete');
form_hidden('id', $_GET['id']);
form_button_submit('Delete hint', 'danger');
form_end();

foot();