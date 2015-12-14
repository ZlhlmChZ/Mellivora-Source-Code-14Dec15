<?php

require('../../../include/mellivora.inc.php');

enforce_authentication(CONFIG_UC_MODERATOR);
enforce_instance_auth();

if($_GET['action'] == 'view'){
    $instanceInformation = db_select_one(
        'instances',
        array(
            'id',
            'instanceURI',
            'name',
            'authoratativeAccountID',
            'registrationToken'
        ),
        array(
            'id'=>$_GET['id']
        )
    );
    
    $_SESSION['IID'] = $instanceInformation['id'];
    $_SESSION['IName'] = $instanceInformation['name'];
    $_SESSION['IAID'] = $instanceInformation['authoratativeAccountID'];
    redirect(CONFIG_SITE_ADMIN_RELPATH . 'index.php');
    }
    
    if($_GET['action'] == 'reset'){
    $instanceInformation = db_select_one(
        'instances',
        array(
            'id',
            'instanceURI',
            'name',
            'authoratativeAccountID',
            'registrationToken'
        ),
        array(
            'id'=>'0'
        )
    );
    
    $_SESSION['IID'] = $instanceInformation['id'];
    $_SESSION['IName'] = $instanceInformation['name'];
    $_SESSION['IAID'] = $instanceInformation['authoratativeAccountID'];
    redirect(CONFIG_SITE_ADMIN_RELPATH . 'index.php');
    }
    
if ($_SERVER['REQUEST_METHOD'] == 'POST') {

    validate_id($_POST['id']);
    validate_xsrf_token($_POST['xsrf_token']);

    
if ($_POST['action'] == 'delete') {

        db_delete(
            'categories',
            array(
                'instanceID'=>$_POST['id']
            )
        );
        
         db_delete(
            'challenges',
            array(
                'instanceID'=>$_POST['id']
            )
        );
       
          db_delete(
            'news',
            array(
                'instanceID'=>$_POST['id']
            )
        );
          
           db_delete(
            'submissions',
            array(
                'instanceID'=>$_POST['id']
            )
        );
           
            db_delete(
            'purchases',
            array(
                'instanceID'=>$_POST['id']
            )
        );

            db_delete(
            'hints',
            array(
                'instanceID'=>$_POST['id']
            )
        );
             
             db_delete(
            'instances',
            array(
                'id'=>$_POST['id']
            )
        );
        
        redirect(CONFIG_SITE_ADMIN_RELPATH . 'list_instance.php');
    }
}