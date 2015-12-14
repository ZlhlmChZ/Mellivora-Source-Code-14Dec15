<?php

require('../../../include/mellivora.inc.php');

enforce_authentication(CONFIG_UC_MODERATOR);

$users = db_query_fetch_all('SELECT * FROM users WHERE instanceID = \''.$_SESSION['IID'].'\'');

echo "id,email,team_name,added,passhash,class,enabled,user_type,competing,country_id,2fa_status,DOB,eduInstitution,mobileNo,instanceID,eduLevel,fullName,remarks \n";

foreach($users as $user) {
echo $user['id'].','.$user['email'].','.$user['team_name'].','.$user['added'].','.$user['passhash'].','.$user['class'].','.$user['enabled'].','.$user['user_type'].','.$user['competing'].','.$user['country_id'].','.$user['2fa_status'].','.$user['DOB'].','.$user['eduInstitution'].','.$user['mobileNo'].','.$user['instanceID'].','.$user['eduLevel'].','.$user['fullName'].','.$user['remarks']. "\n";
}

