<cfoutput>
<div class="row">
  <div class="large-12 columns">
    &nbsp;
  </div>
</div>
<div class="row">
  <div class="large-2 columns">&nbsp;</div>
  <div class="large-8 columns">
    <div class="panel callout radius">
      <h5>#HTMLEditFormat(REQUEST.labels.locations)#</h5>
      <p>
      <cfloop array="#APPLICATION.buckets#" index="i">
      <a href="#APPLICATION.siteroot#/go/#i.id#/" class="button primary large"><i class="fi-cloud"></i> #HTMLEditFormat(i.label)#</a>
      </cfloop>
      </p>
    </div>
  </div>
  <div class="large-2 columns">&nbsp;</div>
</div>
</cfoutput>