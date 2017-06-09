<cfparam name="ATTRIBUTES.bucket" default="" />
<cfparam name="ATTRIBUTES.path" default="" />
<cfparam name="ATTRIBUTES.object" default="" />

<cfif THISTAG.ExecutionMode EQ "Start">
<cfoutput>
  <cfset resource = ATTRIBUTES.bucket.website & ATTRIBUTES.path & "/" & ATTRIBUTES.object />
  <cfset ext = ListLast(ATTRIBUTES.object, ".") />
  <cfswitch expression="#ext#">
    <cfcase value="mp4">
      <video width="100%" controls="true">
        <source src="#resource#" type="video/mp4" />
      </video>
    </cfcase>
    <cfcase value="webm">
      <video width="100%" controls="true">
        <source src="#resource#" type="video/webm" />
      </video>
    </cfcase>
    <cfcase value="ogv">
      <video width="100%" controls="true">
        <source src="#resource#" type="video/ogg" />
      </video>
    </cfcase>
    <cfcase value="mp3">
      <audio width="100%" controls="true">
        <source src="#resource#" type="audio/mp3" />
      </audio>
    </cfcase>
    <cfcase value="ogg">
      <audio width="100%" controls="true">
        <source src="#resource#" type="audio/ogg" />
      </audio>
    </cfcase>
    <cfcase value="wav">
      <audio width="100%" controls="true">
        <source src="#resource#" type="audio/wav" />
      </audio>
    </cfcase>
    <cfdefaultcase>
      <a href="#resource#">#HTMLEditFormat(ATTRIBUTES.object)#</a>
    </cfdefaultcase>
  </cfswitch>
</cfoutput>
</cfif>