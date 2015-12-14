<?php

require('../../../include/mellivora.inc.php');

enforce_authentication(CONFIG_UC_MODERATOR);

if ($_SERVER['REQUEST_METHOD'] == 'POST') {

    validate_xsrf_token($_POST['xsrf_token']);

    if ($_POST['action'] == 'edit') {

        if($_SESSION['IRQ'] == 0) {
            $token = substr(md5(rand()), 0, 7);
            $_SESSION['IRQ'] =$token;
            
       db_update(
          'instances',
          array(
             'registrationToken'=>$token
          ),
          array(
             'id'=>$_SESSION['IID']
          )
       );
        }
        else {
        $_SESSION['IRQ'] = '0';
        db_update(
          'instances',
          array(
             'registrationToken'=>'0'
          ),
          array(
             'id'=>$_SESSION['IID']
          )
       );
        
        
        }      
    }
          
           

        redirect(CONFIG_SITE_ADMIN_RELPATH . 'edit_settings.php');
    }