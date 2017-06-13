component extends = "framework.one" {

    THIS.name = 's3vault' & hash( getCurrentTemplatePath() );
    THIS.applicationTimeout = createTimeSpan( 0, 0, 5, 0 ); //5 minutes    

    THIS.customTagPaths = './customtags';

    THIS.s3 = readConfig().credentials;

    VARIABLES.framework = {
        action = 'do',
        usingSubsystems = true,
        defaultSubsystem = 'front',
        defaultSection = 'home',
        defaultItem = 'welcome',
        reloadApplicationOnEveryRequest = false,
        generateSES = false,
        SESOmitIndex = false,
        diLocations = 'model,controllers',
        initMethod = 'configure'
    };

    function setupApplication(){
        APPLICATION.buckets = readConfig().buckets;
        APPLICATION.siteroot = ReplaceNoCase(CGI.script_name, "/index.cfm", "");
    }

    function setupRequest(){
        REQUEST.labels = readConfig().labels;
    }    

    function readConfig(){
        var jsonConfig = FileRead('s3.conf.json');
        return DeserializeJSON(jsonConfig);
    }

}