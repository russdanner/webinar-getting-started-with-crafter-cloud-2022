<#import "/templates/system/common/crafter.ftl" as crafter />

<@crafter.footer>
	<div class="container">
		<div class="row">

			<div class="wow fadeInUp col-md-4 col-sm-4" data-wow-delay="0.6s">
				<@crafter.h2 $field="tcs_titleText_t">
					${contentModel.tcs_titleText_t}
				</@crafter.h2>
				<@crafter.p $field="tcs_description_t">
					${contentModel.tcs_description_t}
				</@crafter.p>
			</div>

			<div class="wow fadeInUp col-md-5 col-sm-4"  data-wow-delay="0.9s">
				<@crafter.h2 $field="ss_titleText_t">
					${contentModel.ss_titleText_t}
				</@crafter.h2>
				<div>
					<h5>Morning</h5>
					<h4>
						${contentModel.ss_morningFrom_dt?time?string.short} -
						${contentModel.ss_morningTo_dt?time?string.short}</h4>
				</div>
				<div>
					<h5>Evening</h5>
					<h4>
						${contentModel.ss_eveningFrom_dt?time?string.short} -
						${contentModel.ss_eveningTo_dt?time?string.short}</h4>
				</div>
			</div>

			<div class="wow fadeInUp col-md-3 col-sm-4" data-wow-delay="1s">
				<@crafter.h2 $field="sns_titleText_t">
					${contentModel.sns_titleText_t}
				</@crafter.h2>
				<ul class="social-icon">
					<#list contentModel.socialNetwork_o.item as row>
						<li><a href="${row.sns_url_s}" class="fa fa-${row.sns_socialNetwork_s} wow fadeIn" data-wow-delay="1s"></a></li>
					</#list>
				</ul>
			</div>

			<div class="clearfix"></div>

			<div class="col-md-12 col-sm-12">
				<p class="copyright-text">
					Copyright &copy;
					<@crafter.span $field="year_s">
						${contentModel.year_s}
					</@crafter.span>
					<@crafter.span $field="companyName_t">
						${contentModel.companyName_t}
					</@crafter.span>
					<#if contentModel.displayThemeCredits_b>
						| Design: <a rel="nofollow" href="${contentModel.themeCreditsURL_s}" target="_parent">${contentModel.themeCredits_t}</a>
					</#if>
				</p>
			</div>

		</div>
	</div>
</@crafter.footer>
