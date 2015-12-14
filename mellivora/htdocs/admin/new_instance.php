<?php

require('../../include/mellivora.inc.php');

enforce_authentication(CONFIG_UC_MODERATOR);
enforce_instance_auth();

head('Site management');
menu_management();
section_subhead('New Instance');

form_start(CONFIG_SITE_ADMIN_RELPATH . 'actions/new_instance');
form_input_text('Name');
form_input_text('URI');
form_input_checkbox('Import Sample Challenge Set');
echo '<h4>Instance Administration</h4>';
form_input_text('Team Name');
form_input_text('Email');
echo '

<div class="form-group">
      <label class="col-sm-2 control-label" for="password">Password</label>
      <div class="col-sm-10">
          <input id="password" name="password" class="form-control" placeholder="Password" type="password">
      </div>
    </div>

</div>

	
';
form_hidden('action', 'new');
form_button_submit('Create Instance');
form_end();

foot();
