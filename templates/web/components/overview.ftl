<#import "/templates/system/common/crafter.ftl" as crafter />

<section id="${contentModel.sectionId}" class="parallax-section">
  <div class="container">
    <div class="row">
      <div class="col-md-6 col-sm-12">
        <@crafter.img $field="imageSection_s" class="img-responsive" src=(contentModel.imageSection_s) alt=(contentModel.titleText_t) />
        <#if contentModel.displayBlockQuote_b>
          <@crafter.blockquote $field="quoteDescription_html" class="wow fadeInUp" $attributes={'data-wow-delay': '1.9s'}>
            ${contentModel.quoteDescription_html}
          </@crafter.blockquote>
        </#if>
      </div>

      <div class="col-md-1"></div>

      <div class="wow fadeInUp col-md-4 col-sm-12" data-wow-delay="1s">
        <div class="overview-detail">
          <@crafter.h2 $field="titleText_t">
            ${contentModel.titleText_t}
          </@crafter.h2>

          <@crafter.div $field="description_t">
            ${contentModel.description_t}
          </@crafter.div>

          <#if contentModel.displayButton_b>
            <a href="${contentModel.buttonSectionLink_s}" class="btn btn-default smoothScroll">
              <@crafter.span $field="buttonText_t">
                ${contentModel.buttonText_t}
              </@crafter.span>
            </a>
          </#if>
        </div>
      </div>

      <div class="col-md-1"></div>

    </div>
  </div>
</section>
