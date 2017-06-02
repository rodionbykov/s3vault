<cfcomponent>

  <cffunction name="before">
    
    <cfparam name="rc.buid" default="" />
    <cfset rc.bucket = {} />

    <cfloop array="#APPLICATION.buckets#" index="b">
      <cfif b.id EQ rc.buid> 
        <cfset rc.bucket = b />
      </cfif>      
    </cfloop>

  </cffunction>

  <cffunction name="go">
    <cfargument name="rc" />

    <cfparam name="rc.go" default="/" />
    <cfif Len(rc.go) GT 1>
      <cfset rc.go = ToBinary(rc.go) />
    </cfif>

    <cfdirectory directory="#rc.bucket.root##rc.go#" action="list" name="rc.qryDirectory" sort="name" recurse="false" />

    <cfreturn />
  </cffunction>

  <cffunction name="vu">
    <cfargument name="rc" />

    <cfparam name="rc.p" default="/" />
    <cfparam name="rc.o" default="" />

    <cfif Len(rc.p) GT 1>
      <cfset rc.p = ToBinary(rc.p) />
    </cfif>
    
    <cfif Len(rc.o) GT 0>
      <cfset rc.o = ToBinary(rc.o) />
    </cfif>

    <cfdirectory directory="#rc.bucket.root##rc.p#" action="list" name="rc.qryDirectory" sort="name" recurse="false" />

    <cfreturn />
  </cffunction>

</cfcomponent>
