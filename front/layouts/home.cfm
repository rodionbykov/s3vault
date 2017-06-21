<cfoutput>

  <div class="top-bar">
    <div class="top-bar-left">
      <ul class="dropdown menu" data-dropdown-menu>
        <li class="menu-text">#HTMLEditFormat(REQUEST.labels.header)#</li>
        <cfif ArrayLen(APPLICATION.buckets) GT 1> 
        <li>
          <a href="#APPLICATION.siteroot#/"><i class="fi-home"></i> #HTMLEditFormat(REQUEST.labels.home)#</a>
          <ul class="menu vertical">
            <cfloop array="#APPLICATION.buckets#" index="i">
            <li><a href="#APPLICATION.siteroot#/go/#i.id#/">#HTMLEditFormat(i.label)#</a></li>
            </cfloop>
          </ul>
        </li>
        <cfelse>
        <li><a href="##">#HTMLEditFormat(APPLICATION.buckets[1].label)#</a></li>
        </cfif>
      </ul>
    </div>        
  </div>  
    
  <div class="row">
    <div class="large-12 columns">
        <cfoutput>#body#</cfoutput>
    </div>
  </div>

</cfoutput>

