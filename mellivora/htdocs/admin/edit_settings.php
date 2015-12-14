<?php

require('../../include/mellivora.inc.php');

enforce_authentication(CONFIG_UC_MODERATOR);

$rule = db_select_one(
    'instances',
    array('*'),
    array('id' => $_SESSION['IID'])
);

head('Site management');
menu_management();

section_subhead('Edit Instance Settings');
form_start(CONFIG_SITE_ADMIN_RELPATH . 'actions/edit_settings');
echo '<div class="form-group">
      <label class="col-sm-2 control-label" for="rule">Registration Token</label>
      <div class="col-sm-10">
          <input id="rule" readonly name="rule" class="form-control" placeholder="Registration Token" value="',($rule['registrationToken'] != 0 ? $rule['registrationToken']: 'Registration Tokens are not enabled.'),'" type="text">
      </div>
    </div>';
form_hidden('action', 'edit');
echo ($rule['registrationToken'] == 0 ? form_button_submit('Enable Registration Token'):form_button_submit('Disable Registration Token')); 
form_end();

foot();