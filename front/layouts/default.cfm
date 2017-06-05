<!doctype html>
<html class="no-js" lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>S3 Vault powered by Lucee</title>
    <link rel="stylesheet" href="foundation/css/foundation.css">
    <link rel="stylesheet" href="foundation/css/foundation-icons.css">
    <link rel="stylesheet" href="foundation/css/app.css">
  </head>
  <body>
    
    <cfoutput>
    
    <div class="top-bar">
      <div class="top-bar-left">
        <ul class="dropdown menu" data-dropdown-menu>
          <li class="menu-text">S3 Vault</li>
          <cfif ArrayLen(APPLICATION.buckets) GT 1> 
          <li>
            <a href="##">Home</a>
            <ul class="menu vertical">
              <cfloop array="#APPLICATION.buckets#" index="i">
              <li><a href="index.cfm?do=home.go&amp;buid=#i.id#">#i.label#</a></li>
              </cfloop>
            </ul>
          </li>
          <cfelse>
          <li><a href="##">#APPLICATION.buckets[1].label#</a></li>
          </cfif>
        </ul>
      </div>        
    </div>  
     
    </cfoutput>

    <div class="row">
      <div class="large-12 columns">
          <cfoutput>#body#</cfoutput>
      </div>
    </div>
    
    <script src="foundation/js/vendor/jquery.js"></script>
    <script src="foundation/js/vendor/what-input.js"></script>
    <script src="foundation/js/vendor/foundation.js"></script>
    <script src="foundation/js/app.js"></script>
  </body>
</html>