/*  
 *@Version: 0.1
 *@Author: Davis Dong
 *@Function: Communication with API
 */
//These two functions only can work in the same domain with api.picoctf.com
//If you want to test in the different domain, please use Chrome.exe --disable-web-security
//databaseID and problem names defined in lib/game/entites/levelproblem.js

/*  @Function: Get problem description from database
    @param databaseID: corresponding problemID in database
    @return problemHTML: corresponding HTML content
 */
var testTeamname;
var testPassword;
//Test PASSED
function getProblemInfo(databaseID)
{	//var PID = 245;
    var requestURL = "http://localhost:8080/ToasterButo/ProbRetreive?PID=" + databaseID;
	//var requestURL = "/api/problems/" + databaseID;
    var problemHTML;
    $.ajax({
        type:'GET',
        url: requestURL,
        dataType: 'json',
		async: false,
        cache: false,
        success: function(data) {
            
                problemHTML = "<h2>" + data.displayname + "</h2>" +"<h4>" + "Score: " + data.basescore + "</h4>" + data.desc;
   
        },
        error: function(data) {
            problemHTML = "<p>Could not retrieve problem. Are you logged in? Have you unlocked this problem?</p>";
        }
    })
    return problemHTML;
}
/* @Function: get problem state form database
   @param databaseID: corresponding problemID in database
   @return state: corresponding problem state
 */
//Test PASSED

function getAllProblemInfo()
{
    var receivedData;
	
    var requestURL = "http://localhost:8080/ToasterButo/ProbRetreive"
    $.ajax({
        type: 'GET',
        url: requestURL,
        async: false,
        cache: false,
        dataType: 'json',
        success: function(data)
        {
            receivedData = data
        },
        error: function(data)
        {
            //TODO: return error code
        }
    })
    return receivedData;
}
function getProblemState(databaseID)
{
    //stored problem state
    var state;
	var PID = 245;
    var requestURL = "http://localhost:8080/ToasterButo/ProbSubmit?PID=" + PID;
    $.ajax({
        type: 'GET',
        url: requestURL,
        async: false,
        cache: false,
        dataType: 'json',
        success: function(data) {
            state = data.correct;
        },
        error: function(data) {
            state = undefined;
        }
    })
    return state;
}

function getProblemHint(databaseID)
{
    //var PID = 245;
	var hint;
    var requestURL = "http://localhost:8080/ToasterButo/ProbRetreive?PID=" + databaseID;
    $.ajax({
        type:'GET',
        url: requestURL,
        async: false,
        cache: false,
        dataType: 'json',
        success: function(data)
        {
           hint = data.hint;
        },
        error: function(data)
        {
           hint = "";
        }
    })
    return hint;
}
/* @Function: login in database
   @param teamname: teanname; password: password;
*/
//Test passed
function login(teamname, password)
{
    var requestURL = "/api/login";
    var loginMessage;
    $.ajax({
        type: 'POST',
        url: requestURL,
        async: false,
        cache: false,
        dataType: 'json',
        data:{
            teamname: teamname,
            password: password
        },
        success: function(data) {
            //TODO: more stuff about data.success
            loginMessage = data.message;
        },
        error: function(data) {
            loginMessage = "Cannot connect to the server.";
        }
    })
    return loginMessage;
}
//Test PASSED
function logout(teamID)
{
    var requestURL = "/api/logout"
    var logoutMessage;
    $.ajax({
        type: 'GET',
        url: requestURL,
        async: false,
        cache: false,
        datatype: 'json',
        success: function(data){
            logoutMessage = data.message;
        },
        error: function(data){
            logoutMessage = "Cannot connect to the server.";
        }
    })
    return logoutMessage;
}
function getTopScores()
{
    var requestURL = "/api/scores"
    var teaminfo = new Array();
    $.ajax({
        type:'GET',
        url: requestURL,
        async: false,
        cache: false,
        datatype:'json',
        success: function(data){
            for(var i = 0; i < 10; i++)
            {
                teaminfo[i] = data[i];
            }
        },
        error: function(data){

        }
    })
    return teaminfo;
}
function getScore(teamID)
{
    var requestURL = "/api/score"
    $.ajax({
        type:'GET',
        url: requestURL,
        async: false,
        cache: false,
        datatype: "json",
        success: function(data){
            //TODO: return score
        },
        error: function(data){
            //TODO: return error message
        }
    })
}

//Duplicate Key Error. I am not sure this problem is caused by the same account or something wrong in this function
$(document).ready(function()
{	
    $("#problemsubmit").click(function(){

        var pid = PROBLEMS[ig.gm.currentProblem].PID;
        //var pid = 245;
		var requestURL = "http://localhost:8080/ToasterButo/ProbSubmit";
        var key = $("#probleminput").val();
        key = $.trim(key);
        $.ajax({
            type:'POST',
            url: requestURL,
            async: false,            
            datatype:'json',
            data:{
                pid: pid,
                key: key
            },
            success: function(data)
            {
                ig.gm.currentLevel.onSubmit(data.status, data.message);
            },
            error: function(data)
            {
                     show_site_down_error();
                 //TODO: return error message
            }
        })
    })
})



