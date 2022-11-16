<#import "/templates/system/common/crafter.ftl" as crafter />


<div class="catalog-item wow fadeInUp" data-wow-delay="1.9s">
	<div class="blog-thumb catalog-item-size" onmouseover='this.style.backgroundImage="url(${contentModel.classImage_s})"'>
		<#assign classDays = "" />
    <#if contentModel.classDays_o?? && contentModel.classDays_o.item??>
      <#list contentModel.classDays_o.item as row>
        <#if classDays?has_content>
          <#assign classDays = classDays + " | " + row.day_s />
        <#else>
          <#assign classDays = classDays + row.day_s />
        </#if>
      </#list>
    </#if>
		<span class="blog-date">
			<@crafter.span $field="classCategory_s">
				${contentModel.classCategory_s!''}
			</@crafter.span>
			/ ${classDays} - ${contentModel.startTime_dt?time?string.short}
		</span>

		<@crafter.h3 $field="titleText_t" class="blog-title">
			${contentModel.titleText_t}
		</@crafter.h3>

		<h5 id="blog-author">
			by
			<@crafter.span $field="trainerName_t">
				${contentModel.trainerName_t}
			</@crafter.span>
		</h5>
	</div>
</div>
