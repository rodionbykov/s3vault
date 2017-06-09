<cfparam name="ATTRIBUTES.directory" default="" />
<cfparam name="ATTRIBUTES.bucket" default="" />
<cfparam name="ATTRIBUTES.object" default="" />

<cfif THISTAG.ExecutionMode EQ "Start">

<ul class="slim-list no-bullet">
<cfoutput query="#ATTRIBUTES.directory#">

<cfset path = ReplaceNoCase(ATTRIBUTES.directory.directory, ATTRIBUTES.bucket.root, "", "ALL") />
<cfif ATTRIBUTES.directory.type EQ "Dir">
    <li>
      <span class="label folder"><i class="fi-folder"></i> <a href="index.cfm?do=home.go&amp;buid=#ATTRIBUTES.bucket.id#&amp;go=#ToBase64(path & "/" & ATTRIBUTES.directory.name, "utf-8")#">#ATTRIBUTES.directory.name#</a></span>
    </li>
<cfelse>
  <cfset ext = ListLast(ATTRIBUTES.directory.name, ".") />
  <cfif ListFindNoCase("mp4,webm,ogv", ext)>
    <li <cfif ATTRIBUTES.directory.name EQ ATTRIBUTES.object>class="current"</cfif>>
      <span class="label video"><i class="fi-play-video"></i> <a href="index.cfm?do=home.vu&amp;buid=#ATTRIBUTES.bucket.id#&amp;p=#ToBase64(path)#&amp;o=#ToBase64(ATTRIBUTES.directory.name, "utf-8")#">#ATTRIBUTES.directory.name#</a></span>
      <span class="label primary">#fncFileSize(ATTRIBUTES.directory.size)# <a target="_blank" href="#ATTRIBUTES.bucket.website##path#/#ATTRIBUTES.directory.name#"><i class="fi-download"></i></a></span>
    </li>
  <cfelseif ListFindNoCase("mp3,wav,ogv", ext)>
    <li <cfif ATTRIBUTES.directory.name EQ ATTRIBUTES.object>class="current"</cfif>>
      <span class="label audio"><i class="fi-sound"></i> <a href="index.cfm?do=home.vu&amp;buid=#ATTRIBUTES.bucket.id#&amp;p=#ToBase64(path)#&amp;o=#ToBase64(ATTRIBUTES.directory.name, "utf-8")#">#ATTRIBUTES.directory.name#</a></span>
      <span class="label primary">#fncFileSize(ATTRIBUTES.directory.size)# <a target="_blank" href="#ATTRIBUTES.bucket.website##path#/#ATTRIBUTES.directory.name#"><i class="fi-download"></i></a></span>
    </li>
  <cfelse>
    <li>
      <span class="label file"><i class="fi-page"></i> <a target="_blank" href="#ATTRIBUTES.bucket.website##path#/#ATTRIBUTES.directory.name#">#ATTRIBUTES.directory.name#</a></span>
      <span class="label primary">#fncFileSize(ATTRIBUTES.directory.size)#</span>
    </li>
  </cfif>
</cfif>    
</cfoutput>
</ul>

</cfif>

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