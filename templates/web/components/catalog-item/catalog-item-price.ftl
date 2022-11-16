<#import "/templates/system/common/crafter.ftl" as crafter />

<@crafter.div class="wow fadeInUp" $attributes={'data-wow-delay': '1s' }>
	<div class="pricing__item">
		<@crafter.h3 $field="titleText_t" class="pricing__title">
			${contentModel.titleText_t}
		</@crafter.h3>
		<div class="pricing__price">
			<span class="pricing__currency">$</span>
			<@crafter.span $field="price_t">
				${contentModel.price_t}
			</@crafter.span>
		</div>

		<@crafter.renderRepeatGroup
			$field="services_o"
			$containerAttributes={'class': 'pricing__feature-list'}
			$itemAttributes={'class': 'pricing__feature'};
			<#-- Nested content values passed down by the macro: -->
			item, index
		>
			<#assign myContentItem = siteItemService.getSiteItem(item.key) />
			<@crafter.span $model=myContentItem $field="titleText_t">
				${myContentItem.titleText_t}
			</@crafter.span>
		</@crafter.renderRepeatGroup>
		<#if contentModel.displayButton_b>
			<button class="pricing__action" onclick="location.href = '${contentModel.buttonUrl_s}';">
				<@crafter.span $field="buttonText_t">
					${contentModel.buttonText_t}
				</@crafter.span>
			</button>
		</#if>
	</div>
</@crafter.div>
