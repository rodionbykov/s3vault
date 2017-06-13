<cf_breadcrumbs bucket="#rc.bucket#" path="#rc.go#" />

<div class="row">
  <div class="large-8 columns">
    <cf_listing directory="#rc.qryDirectory#" bucket="#rc.bucket#" />
  </div>

  <div class="large-4 columns">
    <cf_sorting link="#APPLICATION.siteroot#/go/#rc.bucket.id#/#ToBase64(rc.go)#/" sort="#rc.sort#" order="#rc.order#" />
  </div>
</div>
