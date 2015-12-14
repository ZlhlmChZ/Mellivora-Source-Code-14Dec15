<?php

require('../../include/mellivora.inc.php');

enforce_authentication(CONFIG_UC_MODERATOR);

head('Site management');
menu_management();

section_subhead('New category');
form_start(CONFIG_SITE_ADMIN_RELPATH . 'actions/new_category');
form_input_text('Title');
form_textarea('Description');
echo '<script>   window.onload = function(){CKEDITOR.replace("description", {
 filebrowserUploadUrl: "actions/upload.php"
});}</script>';
form_hidden('action', 'new');
form_button_submit('Create category');
form_end();

foot();