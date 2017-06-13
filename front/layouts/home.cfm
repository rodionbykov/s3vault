<cfoutput>

  <div class="top-bar">
    <div class="top-bar-left">
      <ul class="dropdown menu" data-dropdown-menu>
        <li class="menu-text">#REQUEST.labels.header#</li>
        <cfif ArrayLen(APPLICATION.buckets) GT 1> 
        <li>
          <a href="##">#REQUEST.labels.home#</a>
          <ul class="menu vertical">
            <cfloop array="#APPLICATION.buckets#" index="i">
            <li><a href="#APPLICATION.siteroot#/go/#i.id#/">#i.label#</a></li>
            </cfloop>
          </ul>
        </li>
        <cfelse>
        <li><a href="##">#APPLICATION.buckets[1].label#</a></li>
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

