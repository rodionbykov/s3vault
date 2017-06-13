<cfparam name="ATTRIBUTES.bucket" default="" />
<cfparam name="ATTRIBUTES.path" default="" />
<cfparam name="ATTRIBUTES.object" default="" />

<cfif THISTAG.ExecutionMode EQ "Start">
<cfoutput>
<nav>  
  <cfif IsStruct(ATTRIBUTES.bucket)>
  <ul class="breadcrumbs">
    
    <li><a href="#APPLICATION.siteroot#/go/#ATTRIBUTES.bucket.id#/">#HTMLEditFormat(ATTRIBUTES.bucket.label)#</a></li>    
    
    <cfif Len(ATTRIBUTES.path) GT 0>
      <cfset arrPath = ListToArray(ATTRIBUTES.path, "/") />
      <cfset currentPath = "" />
      
      <cfloop array="#arrPath#" index="p">
        <cfset currentPath = currentPath & "/" & p />
        <li><a href="#APPLICATION.siteroot#/go/#ATTRIBUTES.bucket.id#/#ToBase64(currentPath)#/">#HTMLEditFormat(p)#</a></li>    
      </cfloop>    
    </cfif>

    <cfif Len(ATTRIBUTES.object) GT 0>
    <li>
      #HTMLEditFormat(ATTRIBUTES.object)#
    </li>    
    </cfif>  
  </ul>
  </cfif>
</nav>
</cfoutput>
</cfif>