<?php

require('../../include/mellivora.inc.php');

enforce_authentication(CONFIG_UC_MODERATOR);

validate_id($_GET['id']);

$news = db_select_one(
    'news',
    array('*'),
    array('id' => $_GET['id'])
);

head('Site management');
menu_management();

section_subhead('Edit news item: ' . $news['title']);
form_start(CONFIG_SITE_ADMIN_RELPATH . 'actions/edit_news');
form_input_text('Title', $news['title']);
form_textarea('Body', $news['body']);

echo showConfirmDialogEditor('delete_news_item','Are you sure you want to delete this?');
form_hidden('action', 'edit');
form_hidden('id', $_GET['id']);
form_button_submit('Save changes');
form_end();

form_start(CONFIG_SITE_ADMIN_RELPATH . 'actions/edit_news');
form_hidden('action', 'delete');
form_hidden('id', $_GET['id']);
form_button_submit('Delete news item', 'danger');
form_end();

echo '<script>
  </script>';
foot();