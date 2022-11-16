<#import "/templates/system/common/crafter.ftl" as crafter />

<div class="trainer-thumb">
	<@crafter.img
		$field="trainerImage_s"
		class="img-responsive trainer-image"
		src=(contentModel.trainerImage_s)
		alt="Trainer"
	/>
	<div class="trainer-overlay">
		<div class="trainer-des">
			<@crafter.h2 $field="trainerName_t">
				${contentModel.trainerName_t}
			</@crafter.h2>
			<@crafter.h3 $field="trainerTitle_t">
				${contentModel.trainerTitle_t}
			</@crafter.h3>

			<ul class="social-icon">
				<#if contentModel.socialMediaLinks_o?? && contentModel.socialMediaLinks_o.item??>
					<#list contentModel.socialMediaLinks_o.item as item>
						<li><a href="${item.url_s}" class="fa fa-${item.socialNetworkName_s} wow fadeInUp" data-wow-delay="1s"></a></li>
					</#list>
				</#if>
			</ul>
		</div>
	</div>
</div>
<@crafter.p $field="trainerDescription_t" class="trainer-description_t">
	${contentModel.trainerDescription_t}
</@crafter.p>
