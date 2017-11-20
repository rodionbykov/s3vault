<cfcomponent>

  <cfproperty name="fw" />

  <cffunction name="init">
    <cfargument name="fw" />
    <cfset VARIABLES.fw = ARGUMENTS.fw />

    <cfreturn THIS />
  </cffunction>

  <cffunction name="before">
    
    <cfparam name="rc.buid" default="" />
    <cfparam name="rc.sort" default="name" />
    <cfparam name="rc.order" default="asc" />

    <cfif NOT ListFindNoCase("name,dateLastModified,size", rc.sort)>
      <cfset rc.sort = "name" />
    </cfif>

    <cfif NOT ListFindNoCase("asc,desc", rc.order)>
      <cfset rc.order = "asc" />
    </cfif>

    <cfset rc.bucket = {} />

    <cfloop array="#APPLICATION.buckets#" index="b">
      <cfif b.id EQ rc.buid> 
        <cfset rc.bucket = b />
      </cfif>      
    </cfloop>

  </cffunction>

  <cffunction name="go">
    <cfargument name="rc" />

    <cfparam name="rc.go" default="#ToBase64("/", "utf-8")#" />
    
    <cfif NOT StructKeyExists(rc.bucket, "id")>
      <cfthrow message = "Invalid Bucket" />
    </cfif>

    <cftry>
      <cfset rc.go = ReplaceNoCase(rc.go, "_", "/", "ALL") />
      <cfset rc.go = ReplaceNoCase(rc.go, " ", "+", "ALL") />
      <cfset rc.go = ToString(ToBinary(rc.go), "utf-8") />

      <cfcatch type="any">
        <cfthrow message = "Invalid Location" />
      </cfcatch>
    </cftry>

    <cftry>
      <cfdirectory directory="#rc.bucket.root##rc.go#" action="list" name="rc.qryDirectory" sort="#rc.sort# #rc.order#" recurse="false" />
      <cfcatch type="any">
        <cfthrow message = "Location Unreachable" />
      </cfcatch>
    </cftry>

    <cfreturn />
  </cffunction>

  <cffunction name="vu">
    <cfargument name="rc" />

    <cfparam name="rc.p" default="#ToBase64("/", "utf-8")#" />
    <cfparam name="rc.o" default="" />    

    <cfif NOT StructKeyExists(rc.bucket, "id")>
      <cfthrow message = "Invalid Bucket" />
    </cfif>

    <cftry>
      <cfset rc.p = ReplaceNoCase(rc.p, "_", "/", "ALL") />
      <cfset rc.p = ReplaceNoCase(rc.p, " ", "+", "ALL") />
      <cfset rc.p = ToString(ToBinary(rc.p), "utf-8") />

      <cfset rc.o = ReplaceNoCase(rc.o, "_", "/", "ALL") />
      <cfset rc.o = ReplaceNoCase(rc.o, " ", "+", "ALL") />
      <cfset rc.o = ToString(ToBinary(rc.o), "utf-8") />
      
      <cfcatch type="any">
        <cfthrow message = "Invalid Resource" />
      </cfcatch>
    </cftry>

    <cftry>
      <cfdirectory directory="#rc.bucket.root##rc.p#" action="list" name="rc.qryDirectory" sort="#rc.sort# #rc.order#" recurse="false" />
      <cfcatch type="any">
        <cfthrow message = "Resource Unreachable" />
      </cfcatch>
    </cftry>
    
    <cfreturn />
  </cffunction>

  <cffunction name="error">
    <cfargument name="rc" />

    <cfset fw.disableLayout() />
  </cffunction>
</cfcomponent>
