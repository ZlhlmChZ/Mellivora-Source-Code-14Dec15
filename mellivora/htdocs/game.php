<html>
<?php

require('../include/mellivora.inc.php');

login_session_refresh();

send_cache_headers('home', CONFIG_CACHE_TIME_HOME);

head('Home');

if (cache_start('home', CONFIG_CACHE_TIME_HOME)) {

    require(CONFIG_PATH_THIRDPARTY . 'nbbc/nbbc.php');

    $bbc = new BBCode();
    $bbc->SetEnableSmileys(false);

    section_subhead('PicoCTF Integrated Challenge');
    cache_end('home');
}


?>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes">
    <meta name="description" content="CTF Platform">
    <link href="css/game.css" rel="stylesheet" media="screen">
    <link href="lib/dark-hive/jquery-ui-1.10.2.custom.css" rel="stylesheet" media="screen">
</head>

<body>
<div class="container-narrow">
    <div class="container-narrow">
        <div class="row-fluid">
            <div class="span12">
                <div id="canvaswrapper">
                    <div id="problemdisplay">
                        <div id="problemhintdialog" title="Hint" display="none"></div>
                        <div id="problemcontent"></div>
                        <div id="problemform" class="form-inline">
                            <input class="form-inline" type="text" id="probleminput"/>
                            <button class="btn" id="problemsubmit">
                                Submit!
                            </button>
                        </div>
                        <div id="prob_submit_msg"></div>
                    </div>
                    <canvas id="canvas">
                        Sorry, your browser doesn't support the &lt;canvas&gt; element.
                    </canvas>
                </div>
            </div>
            <div class="row-fluid">
                <div class="offset4 span4">
                    <p>
                        <a href="challenges">Switch to challenges screen , and proceed to ToasterWars category.</a>
                    </p>
                </div>
            </div>
            <div class="row-fluid">
                <div class="offset1 span10">
                    <p>
                        Please note that the competition may contain a few imperfections. Please <a href="/contact">contact
                        us</a> concerning any problems or suggestions.
                    </p>
                </div>
            </div>
        </div>
        <!--
        <script type="text/javascript" src="compete/lib/jquery.js"></script>
        <script type="text/javascript" src="compete/lib/impact/impact.js"></script>
        <script type="text/javascript" src="compete/lib/game/main.js"></script>
        <script type="text/javascript" src="compete/lib/API.js"></script>
        <script type="text/javascript" src="compete/lib/jquery-ui.js"></script>
        <script type="text/javascript" src="compete/lib/hintinit.js"></script>
        -->
    </div>
	
	<div>
	</div>
    <div id="footer"></div>
</div>
<div id=UID>
<?php echo $_SESSION['id']; ?>
</div>
<script src="compete/lib/jquery.js"></script>
<script src="js/play.js"></script>
<script src="js/dependencies.js"></script>
<script src="js/compete.js"></script>
<script>
    $(function () {
    
        load_compete();
 
    })
</script>
</body>

<?php 

foot();

?>
<html>

