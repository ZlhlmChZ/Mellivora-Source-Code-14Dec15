<?php

require('../include/mellivora.inc.php');

if (user_is_logged_in()) {
    redirect(CONFIG_LOGIN_REDIRECT_TO);
    exit();
}

prefer_ssl();

head('Register');

 $instances = db_query_fetch_all('SELECT * FROM instances WHERE id = \''.$_SESSION["IID"].'\' ORDER BY id DESC');
    
    foreach ($instances as $item) {
       $_SESSION["IName"] = $item['name'];
       $_SESSION["IID"] = $item['id'];
       $_SESSION["IRQ"] = $item['registrationToken'];
    }

$REG_TOKEN_REQUIRED = ($_SESSION['IRQ'] != '0' ? true:false);

if (CONFIG_ACCOUNTS_SIGNUP_ALLOWED) {
    echo '
    <link rel="stylesheet" href="css/datepicker.css">
    
    <h2>Register your team ('.$_SESSION["IName"].')</h2>
    <p>
        Welcome to the Cyber Range. An account is required to partake in the challenges.
        ',(CONFIG_ACCOUNTS_EMAIL_PASSWORD_ON_SIGNUP ? 'This instance is ' : ''),'
    </p>
    <form method="post" id="registerForm" class="form-signin" action="actions/login">
        <input name="fullName" type="text" class="form-control" placeholder="Full Name" required />
        <input name="team_name" type="text" class="form-control" placeholder="Team name" minlength="',CONFIG_MIN_TEAM_NAME_LENGTH,'" maxlength="',CONFIG_MAX_TEAM_NAME_LENGTH,'" required />
        <input name="',md5(CONFIG_SITE_NAME.'USR'),'" type="email" class="form-control" placeholder="Email address" required />
        ',(!CONFIG_ACCOUNTS_EMAIL_PASSWORD_ON_SIGNUP ? '<input name="'.md5(CONFIG_SITE_NAME.'PWD').'" type="password" class="form-control" placeholder="Password" required />' : '<input name="'.md5(CONFIG_SITE_NAME.'PWD').'" type="password" class="form-control" placeholder="Confirm Password" required />');

        $user_types = db_select_all(
            'user_types',
            array(
                'id',
                'title',
                'description'
            )
        );

        if (!empty($user_types)) {
            echo '<select name="type" class="form-control">
            <option disabled selected>-- Please select team type --</option>';

            foreach ($user_types as $user_type) {
                echo '<option value="',htmlspecialchars($user_type['id']),'">',htmlspecialchars($user_type['title'] . ' - ' . $user_type['description']),'</option>';
            }

            echo '</select>';
        }

        if (CONFIG_RECAPTCHA_ENABLE_PUBLIC) {
            display_captcha();
        }    
        echo '
        </script>
	    <input name="phoneNo" type="text" class="form-control" placeholder="Phone No." required />
		<input data-provide="datepicker-inline" id="age" name="age" type="text" class="form-control" placeholder="D.O.B." required />
<select name="eduLevel" class ="form-control">
<option val="S1" >Secondary 1</option>
<option val="S2" >Secondary 2</option>
<option val="S3" >Secondary 3</option>
<option val="S4" >Secondary 4</option>
<option val="S5" >Secondary 5</option>
<option val="S5" >Polytechnic</option>
<option val="S5" >Junior College</option>
<option val="S5" >University</option>
</select>
	    <select name="eduI" class="form-control" placeholder="Educational Institution" required >
        <option value="Admiralty Secondary School">Admiralty Secondary School</option>
<option value="Ahmad Ibrahim Secondary School">Ahmad Ibrahim Secondary
School</option>
<option value="Anderson Secondary School">Anderson Secondary School</option>
<option value="Anglican High School">Anglican High School</option>
<option value="Anglo-Chinese School (Barker Road)">Anglo-Chinese School (Barker
Road)</option>
<option value="Anglo-Chinese School (Independent)">Anglo-Chinese School
(Independent)</option>
<option value="Ang Mo Kio Secondary School">Ang Mo Kio Secondary School</option>
<option value="Assumption English School">Assumption English School</option>
<option value="Balestier Hill Secondary School">Balestier Hill Secondary
School</option>
<option value="Bartley Secondary School">Bartley Secondary School</option>
<option value="Beatty Secondary School">Beatty Secondary School</option>
<option value="Bedok Green Secondary School">Bedok Green Secondary
School</option>
<option value="Bedok North Secondary School">Bedok North Secondary
School</option>
<option value="Bedok South Secondary School">Bedok South Secondary
School</option>
<option value="Bedok Town Secondary School">Bedok Town Secondary School</option>
<option value="Bedok View Secondary School">Bedok View Secondary School</option>
<option value="Bendemeer Secondary School">Bendemeer Secondary School</option>
<option value="Bishan Park Secondary School">Bishan Park Secondary
School</option>
<option value="Boon Lay Secondary School">Boon Lay Secondary School</option>
<option value="Bowen Secondary School">Bowen Secondary School</option>
<option value="Broadrick Secondary School">Broadrick Secondary School</option>
<option value="Bukit Batok Secondary School">Bukit Batok Secondary
School</option>
<option value="Bukit Merah Secondary School">Bukit Merah Secondary
School</option>
<option value="Bukit Panjang Govt. High School">Bukit Panjang Govt. High
School</option>
<option value="Bukit View Secondary School">Bukit View Secondary School</option>
<option value="Catholic High School">Catholic High School</option>
<option value="Canberra Secondary School">Canberra Secondary School</option>
<option value="Cedar Girls\' Secondary School">Cedar Girls\' Secondary
School</option>
<option value="Changkat Changi Secondary School">Changkat Changi Secondary
School</option>
<option value="Chestnut Drive Secondary School">Chestnut Drive Secondary
School</option>
<option value="CHIJ Katong Convent">CHIJ Katong Convent</option>
<option value="CHIJ Secondary (Toa Payoh)">CHIJ Secondary (Toa Payoh)</option>
<option value="CHIJ St. Joseph\'s Convent">CHIJ St. Joseph\'s Convent</option>
<option value="CHIJ St. Nicholas Girls\' School">CHIJ St. Nicholas Girls\'
School</option>
<option value="CHIJ St. Theresa\'s Convent">CHIJ St. Theresa\'s Convent</option>
<option value="Chong Boon Secondary School">Chong Boon Secondary School</option>
<option value="Chua Chu Kang Secondary School">Chua Chu Kang Secondary
School</option>
<option value="Christ Church Secondary School">Christ Church Secondary
School</option>
<option value="Chung Cheng High School (Main)">Chung Cheng High School
(Main)</option> <option value="Chung Cheng High School (Yishun)">Chung Cheng High School
(Yishun)</option>
<option value="Clementi Town Secondary School">Clementi Town Secondary
School</option>
<option value="Clementi Woods Secondary School">Clementi Woods Secondary
School</option>
<option value="Commonwealth Secondary School">Commonwealth Secondary
School</option>
<option value="Compassvale Secondary School">Compassvale Secondary
School</option>
<option value="Coral Secondary School">Coral Secondary School</option>
<option value="Crescent Girls\' School">Crescent Girls\' School</option>
<option value="Damai Secondary School">Damai Secondary School</option>
<option value="Deyi Secondary School">Deyi Secondary School</option>
<option value="Dunearn Secondary School">Dunearn Secondary School</option>
<option value="Dunman High School">Dunman High School</option>
<option value="Dunman Secondary School">Dunman Secondary School</option>
<option value="East Spring Secondary School">East Spring Secondary
School</option>
<option value="East View Secondary School">East View Secondary School</option>
<option value="Edgefield Secondary School">Edgefield Secondary School</option>
<option value="Evergreen Secondary School">Evergreen Secondary School</option>
<option value="Fairfield Methodist Secondary School">Fairfield Methodist
Secondary School</option>
<option value="Fajar Secondary School">Fajar Secondary School</option>
<option value="First Toa Payoh Secondary School">First Toa Payoh Secondary
School</option>
<option value="Fuchun Secondary School">Fuchun Secondary School</option>
<option value="Fuhua Secondary School">Fuhua Secondary School</option>
<option value="Gan Eng Seng School">Gan Eng Seng School</option>
<option value="Geylang Methodist School (Secondary)">Geylang Methodist School
(Secondary)</option>
<option value="Greendale Secondary School">Greendale Secondary School</option>
<option value="Greenridge Secondary School">Greenridge Secondary School</option>
<option value="Greenview Secondary School">Greenview Secondary School</option>
<option value="Guangyang Secondary School">Guangyang Secondary School</option>
<option value="Hai Sing Catholic School">Hai Sing Catholic School</option>
<option value="Henderson Secondary School">Henderson Secondary School</option>
<option value="Hillgrove Secondary School">Hillgrove Secondary School</option>
<option value="Holy Innocents\' High School">Holy Innocents\' High School</option>
<option value="Hong Kah Secondary School">Hong Kah Secondary School</option>
<option value="Hougang Secondary School">Hougang Secondary School</option>
<option value="Hua Yi Secondary School">Hua Yi Secondary School</option>
<option value="Hwa Chong Institution">Hwa Chong Institution</option>
<option value="Junyuan Secondary School">Junyuan Secondary School</option>
<option value="Jurong Secondary School">Jurong Secondary School</option>
<option value="Jurong West Secondary School">Jurong West Secondary
School</option>
<option value="Jurongville Secondary School">Jurongville Secondary
School</option>
<option value="Juying Secondary School">Juying Secondary School</option>
<option value="Kent Ridge Secondary School">Kent Ridge Secondary School</option>
<option value="Kranji Secondary School">Kranji Secondary School</option>
<option value="Kuo Chuan Presbyterian Secondary School">Kuo Chuan Presbyterian
Secondary School</option>
<option value="Loyang Secondary School">Loyang Secondary School</option>
<option value="MacPherson Secondary School">MacPherson Secondary School</option> <option value="Manjusri Secondary School">Manjusri Secondary School</option>
<option value="Maris Stella High School">Maris Stella High School</option>
<option value="Marsiling Secondary School">Marsiling Secondary School</option>
<option value="Mayflower Secondary School">Mayflower Secondary School</option>
<option value="Methodist Girls\' School (Secondary)">Methodist Girls\' School
(Secondary)</option>
<option value="Montfort Secondary School">Montfort Secondary School</option>
<option value="Nan Chiau High School">Nan Chiau High School</option>
<option value="Nan Hua High School">Nan Hua High School</option>
<option value="Nanyang Girls\' High School">Nanyang Girls\ High School</option>
<option value="Nanyang Polytechnic">Nanyang polytechnic</option>
<option value="National Junior College">National Junior College</option>
<option value="Naval Base Secondary School">Naval Base Secondary School</option>
<option value="New Town Secondary School">New Town Secondary School</option>
<option value="Ngee Ann Secondary School">Ngee Ann Secondary School</option>
<option value="Ngee Ann Polytechnic">Ngee Ann polytechnic</option>
<option value="Northlight School">Northlight School</option>
<option value="North View Secondary School">North View Secondary School</option>
<option value="North Vista Secondary School">North Vista Secondary
School</option>
<option value="Northbrooks Secondary School">Northbrooks Secondary
School</option>
<option value="Northland Secondary School">Northland Secondary School</option>
<option value="NUS High School of Mathematics and Science">NUS High School of
Mathematics and Science</option>
<option value="Orchid Park Secondary School">Orchid Park Secondary
School</option>
<option value="Outram Secondary School">Outram Secondary School</option>
<option value="Pasir Ris Crest Secondary School">Pasir Ris Crest Secondary
School</option>
<option value="Pasir Ris Secondary School">Pasir Ris Secondary School</option>
<option value="Paya Lebar Methodist Girls\' School (Secondary)">Paya Lebar
Methodist Girls\' School (Secondary)</option>
<option value="Pei Hwa Secondary School">Pei Hwa Secondary School</option>
<option value="Peicai Secondary School">Peicai Secondary School</option>
<option value="Peirce Secondary School">Peirce Secondary School</option>
<option value="Ping Yi Secondary School">Ping Yi Secondary School</option>
<option value="Pioneer Secondary School">Pioneer Secondary School</option>
<option value="Presbyterian High School">Presbyterian High School</option>
<option value="Punggol Secondary School">Punggol Secondary School</option>
<option value="Queenstown Secondary School">Queenstown Secondary School</option>
<option value="Queensway Secondary School">Queensway Secondary School</option>
<option value="Raffles Girls\' School (Secondary)">Raffles Girls\' School
(Secondary)</option>
<option value="Raffles Institution">Raffles Institution</option>
<option value="Regent Secondary School">Regent Secondary School</option>
<option value="Riverside Secondary School">Riverside Secondary School</option>
<option value="River Valley High School">River Valley High School</option>
<option value="Republic Polytechnic">Republic polytechnic</option>
<option value="St. Andrew\'s Secondary School">St. Andrew\'s Secondary
School</option>
<option value="St. Patrick\'s School">St. Patrick\'s School</option>
<option value="School of Science and Technology, Singapore">School of Science and
Technology, Singapore</option>
<option value="School of the Arts, Singapore">School of the Arts,
Singapore</option>
<option value="Sembawang Secondary School">Sembawang Secondary School</option>
<option value="Seng Kang Secondary School">Seng Kang Secondary School</option>
<option value="Serangoon Garden Secondary School">Serangoon Garden Secondary
School</option> <option value="Serangoon Secondary School">Serangoon Secondary School</option>
<option value="Shuqun Secondary School">Shuqun Secondary School</option>
<option value="Si Ling Secondary School">Si Ling Secondary School</option>
<option value="Siglap Secondary School">Siglap Secondary School</option>
<option value="Singapore Chinese Girls\' School">Singapore Chinese Girls\'
School</option>
<option value="Singapore Sports School">Singapore Sports School</option>
<option value="Springfield Secondary School">Springfield Secondary
School</option>
<option value="Singapore Polytechnic">Singapore polytechnic</option>
<option value="St. Anthony\'s Canossian Secondary School">St. Anthony\'s Canossian
Secondary School</option>
<option value="St. Gabriel\'s Secondary School">St. Gabriel\'s Secondary
School</option>
<option value="St. Hilda\'s Secondary School">St. Hilda\'s Secondary
School</option>
<option value="St. Margaret\'s Secondary School">St. Margaret\'s Secondary
School</option>
<option value="St. Joseph\'s Institution">St. Joseph\'s Institution</option>
<option value="Swiss Cottage Secondary School">Swiss Cottage Secondary
School</option>
<option value="Tampines Secondary School">Tampines Secondary School</option>
<option value="Tanglin Secondary School">Tanglin Secondary School</option>
<option value="Tanjong Katong Girls\' School">Tanjong Katong Girls\'
School</option>
<option value="Tanjong Katong Secondary School">Tanjong Katong Secondary
School</option>
<option value="Teck Whye Secondary School">Teck Whye Secondary School</option>
<option value="Temasek Academy">Temasek Academy</option>
<option value="Temasek Secondary School">Temasek Secondary School</option>
<option value="Unity Secondary School">Unity Secondary School</option>
<option value="Victoria Junior College">Victoria Junior College</option>
<option value="Victoria School">Victoria School</option>
<option value="West Spring Secondary School">West Spring Secondary
School</option>
<option value="Westwood Secondary School">Westwood Secondary School</option>
<option value="Whitley Secondary School">Whitley Secondary School</option>
<option value="Woodgrove Secondary School">Woodgrove Secondary School</option>
<option value="Woodlands Ring Secondary School">Woodlands Ring Secondary
School</option>
<option value="Woodlands Secondary School">Woodlands Secondary School</option>
<option value="Xinmin Secondary School">Xinmin Secondary School</option>
<option value="Yio Chu Kang Secondary School">Yio Chu Kang Secondary
School</option>
<option value="Yishun Secondary School">Yishun Secondary School</option>
<option value="Yishun Town Secondary School">Yishun Town Secondary
School</option>
<option value="Yuan Ching Secondary School">Yuan Ching Secondary School</option>
<option value="Yuhua Secondary School">Yuhua Secondary School</option>
<option value="Yusof Ishak Secondary School">Yusof Ishak Secondary
School</option>
<option value="Yuying Secondary School">Yuying Secondary School</option>
<option value="Zhenghua Secondary School">Zhenghua Secondary School</option>

        </select>
        ',($REG_TOKEN_REQUIRED ? 'A registration token is required to complete account creation.<input name="reqToken" type="text" class="form-control" placeholder="Registration Token" required />': ''),'
        <input type="hidden" name="action" value="register" />
        <button class="btn btn-primary btn-lg" type="submit">Register team</button>          
';

} else {
    echo '<i>Registration is currently closed, but you can still <a href="interest">register your interest for upcoming events</a>.</i>';
}
foot();
echo '<script>
        $( document ).ready(function() {
$("#age").datepicker();
});</script>';
