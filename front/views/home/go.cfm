<cfoutput>
<nav aria-label="You are here:" role="navigation">
  <ul class="breadcrumbs">
    <li><a href="index.cfm?do=home.go&amp;buid=#rc.bucket.id#">#HTMLEditFormat(rc.bucket.label)#</a></li>    
    <cfset arrPath = ListToArray(rc.go, "/") />
    <cfset path = "" />
    <cfloop array="#arrPath#" index="p">
    <cfset path = path & "/" & p />
    <li><a href="index.cfm?do=home.go&amp;buid=#rc.bucket.id#&amp;go=#ToBase64(path)#">#HTMLEditFormat(p)#</a></li>    
    </cfloop>    
  </ul>
</nav>
</cfoutput>

<div class="row">
  <div class="large-12 columns">
    <ul class="slim-list no-bullet">
    <cfoutput query="#rc.qryDirectory#">
    
    <cfset path = ReplaceNoCase(rc.qryDirectory.directory, rc.bucket.root, "", "ALL") />
    <cfif rc.qryDirectory.type EQ "Dir">
        <li>
          <span class="label folder"><i class="fi-folder"></i> <a href="index.cfm?do=home.go&amp;buid=#rc.bucket.id#&amp;go=#ToBase64(path & "/" & rc.qryDirectory.name, "utf-8")#">#rc.qryDirectory.name#</a></span>
        </li>
    <cfelse>
      <cfset ext = ListLast(rc.qryDirectory.name, ".") />
      <cfif ext EQ "mp4">
        <li>
          <span class="label video"><i class="fi-play-video"></i> <a href="index.cfm?do=home.vu&amp;buid=#rc.bucket.id#&amp;p=#ToBase64(path)#&amp;o=#ToBase64(rc.qryDirectory.name, "utf-8")#">#rc.qryDirectory.name#</a></span>
          <span class="label primary">#fncFileSize(rc.qryDirectory.size)# <a target="_blank" href="#rc.bucket.website##path#/#rc.qryDirectory.name#"><i class="fi-download"></i></a></span>
        </li>
      <cfelse>
        <li>
          <span class="label file"><i class="fi-page"></i> <a target="_blank" href="#rc.bucket.website##path#/#rc.qryDirectory.name#">#rc.qryDirectory.name#</a></span>
          <span class="label primary">#fncFileSize(rc.qryDirectory.size)#</span>
        </li>
      </cfif>
    </cfif>    
    </cfoutput>
    </ul>
  </div>
</div>
<cfscript>
/**
 * Will take a number returned from a File.Filesize, calculate the number in terms of Bytes/Kilobytes/Megabytes and return the result.
 * v2 by Haikal Saadh
 * v3 by Michael Smith, cleaned up and added Gigabytes
 * 
 * @param number 	 Size in bytes of the file. (Required)
 * @return Returns a string. 
 * @author Kyle Morgan (admin@kylemorgan.com) 
 * @version 3, February 3, 2009 
 */
function fncFileSize(size) {
	if (size lt 1024) return "#size# B";
	if (size lt 1024^2) return "#round(size / 1024)#KB";
	if (size lt 1024^3) return "#decimalFormat(size/1024^2)#MB";
	return "#decimalFormat(size/1024^3)#GB";
}
</cfscript>