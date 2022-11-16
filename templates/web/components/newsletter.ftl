<#import "/templates/system/common/crafter.ftl" as crafter />

<section id="newsletter" class="parallax-section">
	<div class="container">
		<div class="row">

			<div class="wow fadeInUp col-md-offset-2 col-md-8 col-sm-offset-1 col-sm-10" data-wow-delay="0.9s">
				<@crafter.h2 $field="titleText_t">
					${contentModel.titleText_t}
				</@crafter.h2>
				<@crafter.p $field="description_t">
					${contentModel.description_t}
				</@crafter.p>
				<div class="newsletter_detail">
					<form id="form-submit" action="/api/1/services/message.json" method="post">
						<div class="col-md-6 col-sm-6">
							<input name="name" type="text" class="form-control" id="name" placeholder="${contentModel.namePlaceHolder_t}" required="">
						</div>
						<div class="col-md-6 col-sm-6">
							<input name="email" type="email" class="form-control" id="email" placeholder="${contentModel.emailPlaceHolder_t}" required="">
						</div>
						<div class="col-md-offset-3 col-md-6 col-sm-offset-2 col-sm-8">
							<input name="submit" type="submit" class="form-control" id="submit" value="${contentModel.buttonText_t}" >
						</div>
					</form>
				</div>
			</div>

		</div>
	</div>
</section>