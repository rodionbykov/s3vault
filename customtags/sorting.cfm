<cfparam name="ATTRIBUTES.link" default="" />
<cfparam name="ATTRIBUTES.sort" default="name" />
<cfparam name="ATTRIBUTES.order" default="asc" />

<cfif THISTAG.ExecutionMode EQ "Start">
<cfoutput>
    <ul class="slim-list no-bullet">
      <li><a class="#(ATTRIBUTES.sort EQ "name" AND ATTRIBUTES.order EQ "asc")?"":"hollow "#button secondary small" href="#ATTRIBUTES.link#&amp;sort=name&amp;order=asc">Name A-Z</a></li>
      <li><a class="#(ATTRIBUTES.sort EQ "name" AND ATTRIBUTES.order EQ "desc")?"":"hollow "#button secondary small" href="#ATTRIBUTES.link#&amp;sort=name&amp;order=desc">Name Z-A</a></li>
      <li><a class="#(ATTRIBUTES.sort EQ "dateLastModified" AND ATTRIBUTES.order EQ "desc")?"":"hollow "#button secondary small" href="#ATTRIBUTES.link#&amp;sort=dateLastModified&amp;order=desc">Newest first</a></li>
      <li><a class="#(ATTRIBUTES.sort EQ "dateLastModified" AND ATTRIBUTES.order EQ "asc")?"":"hollow "#button secondary small" href="#ATTRIBUTES.link#&amp;sort=dateLastModified&amp;order=asc">Oldest first</a></li>
      <li><a class="#(ATTRIBUTES.sort EQ "size" AND ATTRIBUTES.order EQ "desc")?"":"hollow "#button secondary small" href="#ATTRIBUTES.link#&amp;sort=size&amp;order=desc">Largest first</a></li>
      <li><a class="#(ATTRIBUTES.sort EQ "size" AND ATTRIBUTES.order EQ "asc")?"":"hollow "#button secondary small" href="#ATTRIBUTES.link#&amp;sort=size&amp;order=asc">Smallest first</a></li>
    </ul>
</cfoutput>
</cfif>