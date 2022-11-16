<#import "/templates/system/common/crafter.ftl" as crafter />

 
<#if contentModel.imageBackground_s?? && contentModel.imageBackground_s != "">
	<section id="price" class="catalog-section parallax-section prices-background" style="background: url('${contentModel.imageBackground_s}') 50% 0 repeat-y fixed">
<#else>
	<section id="class" class="catalog-section parallax-section">
</#if>
	<div class="container">
		<div class="row">

			<div class="col-md-12 col-sm-12 text-center">
				<@crafter.h2 $field="titleText_t" style="color:${contentModel.titleColor_s}">
					${contentModel.titleText_t}
				</@crafter.h2>
				<@crafter.p $field="description_t">
					${contentModel.description_t}
				</@crafter.p>
			</div>
			<@crafter.div $field="items_o" class="col-md-12 col-sm-12 components-container">
				<#if contentModel.items_o?? && contentModel.items_o.item??>
						<#list contentModel.items_o.item as class>
							<#assign index = class?index />
							<#if class.component??>
								<#assign classItem = class.component />
							<#else>
								<#assign classItem =  siteItemService.getSiteItem(class.key) />
							</#if>

							<#assign field = "content-type" />
							<#if classItem[field] == "/component/component-catalog-item-price" >
								<#assign columnSize = "col-md-4 col-sm-6" />
							<#else>
								<#assign columnSize = "col-md-6 col-sm-12" />
							</#if>

							<@crafter.div $field="items_o" $index=index class="${columnSize}">
								<@renderComponent component=class />
							</@crafter.div>
						</#list>
				</#if>
			</@crafter.div>
		</div>
	</div>
</section>