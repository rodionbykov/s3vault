<cf_breadcrumbs bucket="#rc.bucket#" path="#rc.go#" />

<div class="row">
  <div class="large-8 columns">
    <cf_listing directory="#rc.qryDirectory#" bucket="#rc.bucket#" />
  </div>

  <div class="large-4 columns">
    <cf_sorting link="index.cfm?do=home.go&amp;buid=#rc.bucket.id#&amp;go=#ToBase64(rc.go)#" sort="#rc.sort#" order="#rc.order#" />
  </div>
</div>
