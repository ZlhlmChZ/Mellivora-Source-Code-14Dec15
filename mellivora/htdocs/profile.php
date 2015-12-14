<?php

require('../include/mellivora.inc.php');

enforce_authentication();

$user = db_select_one(
    'users',
    array(
        'team_name',
        'email',
        'enabled',
        'competing',
        'country_id',
        '2fa_status'
    ),
    array('id' => $_SESSION['id'])
);

head('Profile');

section_subhead('Profile settings', '| <a href="user?id='.htmlspecialchars($_SESSION['id']).'">View public profile</a>', false);

form_start('actions/profile');
form_input_text('Email', $user['email'], array('disabled'=>true));
form_input_text('Team name', $user['team_name'], array('disabled'=>true));
form_input_text('Instance Name', $_SESSION['IName'], array('disabled'=>true));

form_end();

section_subhead('Reset password');
form_start('actions/profile');
form_input_password('Current password');
form_input_password('New password');
form_input_password('New password again');
form_hidden('action', 'reset_password');
form_input_captcha();
form_button_submit('Reset password', 'warning');
form_end();

foot();