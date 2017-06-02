<!--- <cfdump var="#rc.qryDirectory#" /> --->

<div class="row">
  <div class="large-4 columns">
  </div>
  <div class="large-8 columns">
  <cfoutput>
    <video width="640" controls="true">
      <source src="#rc.bucket.website##rc.p#/#rc.o#" type="video/mp4" />
    </video>
  </cfoutput> 
  </div>
</div>