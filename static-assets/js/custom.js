(function ($, { content, search, classes }, { operators }) {

  function getCookie(name) {
    var v = document.cookie.match('(^|;) ?' + name + '=([^;]*)(;|$)');
    return v ? v[2] : null;
  }

  function isAuthoring() {
    const html = document.documentElement;
    const attr = html.getAttribute('data-craftercms-preview');

    return (
      attr === '${modePreview?c}' || // Otherwise disable/enable if you want to see pencils in dev server.
      attr === 'true'
    );
  }

  function getICE(model, fieldId, index) {

    const iceAttrs = craftercms.xb.getICEAttributes({
      model,
      isAuthoring: isAuthoring(),
      ...(
        fieldId
          ? {fieldId}
          : {}
      ),
      ...(
        index || index === 0
          ? {index}
          : {}
      )
    });
    return iceAttrs;
  }

   /* jQuery Pre loader
    -----------------------------------------------*/
  $(window).load(function(){
      $('.preloader').fadeOut(1000); // set duration in brackets
  });


  /* HTML document is loaded. DOM is ready.
  -------------------------------------------*/
  $(document).ready(function() {

    /* template navigation
    -----------------------------------------------*/
   $('.main-navigation').onePageNav({
          scrollThreshold: 0.2, // Adjust if Navigation highlights too early or too late
          scrollOffset: 75, //Height of Navigation Bar
          filter: ':not(.external)',
          changeHash: true
      });

      /* Navigation visible on Scroll */
      mainNav();
      $(window).scroll(function () {
          mainNav();
      });

      function mainNav() {
          var top = (document.documentElement && document.documentElement.scrollTop) || document.body.scrollTop;
          if (top > 40) $('.sticky-navigation').stop().animate({
              "opacity": '1',
              "top": '0'
          });
          else $('.sticky-navigation').stop().animate({
              "opacity": '0',
              "top": '-75'
          });
      }


     /* Hide mobile menu after clicking on a link
      -----------------------------------------------*/
      $('.navbar-collapse a').click(function(){
          $(".navbar-collapse").collapse('hide');
      });


    /*  smoothscroll
    ----------------------------------------------*/
    $(function() {
         $('.navbar-default a, #home a, #overview a').bind('click', function(event) {
             const isIceOn = Boolean(document.querySelector('.craftercms-ice-on'));
             const isIceBypass = Boolean(document.querySelector('.craftercms-ice-bypass'));

             if (!isIceOn || isIceBypass) {
                 var $anchor = $(this);
                 $('html, body').stop().animate({
                     scrollTop: $($anchor.attr('href')).offset().top - 49
                 }, 1000);
             }
             event.preventDefault();
        });
    });


   /* Parallax section
      -----------------------------------------------*/
    function initParallax() {
      $('#home').parallax("100%", 0.1);
      $('#overview').parallax("100%", 0.3);
      $('#trainer').parallax("100%", 0.2);
      $('#newsletter').parallax("100%", 0.3);
      $('.catalog-section').parallax("100%", 0.1);
      $('.quotes-section').parallax("100%", 0.2);

    }
    initParallax();


     /* home slider section
    -----------------------------------------------*/
    $(function(){
      jQuery(document).ready(function() {
        var mediaBannerImagesDOM = $('#mediaBannerImages');
        if(mediaBannerImagesDOM) {
            var mediaBannerImageArray;
            var mediaBannerImagesValue = mediaBannerImagesDOM.attr('data-media-banner-images');
            if(mediaBannerImagesValue) {
                mediaBannerImageArray = mediaBannerImagesValue.split(",");
                $('#home').backstretch(mediaBannerImageArray,  {duration: 2000, fade: 750});
            }
        }
      });
    })


    /* Owl Carousel
    -----------------------------------------------*/
    $(document).ready(function() {
      $("#owl-testimonial").owlCarousel({
        autoPlay: 6000,
        items : 1,
        itemsDesktop : [1199,1],
        itemsDesktopSmall : [979,1],
        itemsTablet: [768,1],
        itemsTabletSmall: false,
        itemsMobile : [479,1],
      });

      const { crafterConf } = classes;

      crafterConf.configure({
        baseUrl: '',
        site: getCookie('crafterSite')
      });

      const { map } = operators;
      const { createQuery } = search;
      const searchContent = search.search;
      const { parseDescriptor, preParseSearchResults } = content;

      searchContent(
        createQuery('elasticsearch', {
          'query': {
            'bool': {
              'filter': [
                {
                  'match': {
                    'content-type': '/component/component-quotes'
                  }
                }
              ]
            }
          }
        })
      ).pipe(
        map(({ hits, ...rest }) => ({
          ...rest,
          hits: hits.map(({ _source }) => parseDescriptor(
            preParseSearchResults(_source)
          ))
        }))
      ).subscribe((results) => {
        results.hits.forEach(model => {
          const modelId = model.craftercms.id;
          const modelICE = getICE(model, 'quotes_o');
          const $container = $(`[model-id="${modelId}"] .owl-wrapper`);
          const $elements = $container.find('.owl-item');

          Object.keys(modelICE).forEach(key => {
            $container.attr(key, modelICE[key]);
          });

          $elements.each((index, element) => {
            const elementICE = getICE(model, 'quotes_o', index);

            Object.keys(elementICE).forEach(key => {
              const value = elementICE[key];
              $(element).attr(key, value);
            });
          });
        });

      });

      craftercms.xb?.contentController?.operations$
        .pipe(
          operators.filter(op => op.type === 'INSERT_COMPONENT_OPERATION' && op.args.contentType.id === '/component/component-quote-item')
        )
        .subscribe((op) => {
          craftercms.xb.fromTopic('INSERT_OPERATION_COMPLETE')
            .pipe(
              operators.filter(({payload}) => payload.modelId === op.args.modelId)
            )
            .subscribe(() => {
              document.location.reload();
            })
        });
    });

    /* wow
    -------------------------------*/
    new WOW({ mobile: false }).init();

    /* Catalog item */
    $(document).on('mouseleave', '.catalog-item .blog-thumb', function() {
      $(this).css('backgroundImage', 'url()');
    });

  });

    /* .modal-backdrop classes
    -------------------------------*/
  $('form').submit(function(event) {
      event.preventDefault();
      if (!this.checkValidity()) {
          // If the form is invalid, submit it. The form won't actually submit;
          // this will just cause the browser to display the native HTML5 error messages.
          this.find('input[type=submit]').click()
      } else {
          var values = $(this).serialize();
          $.ajax({
              type: this.method,
              url: this.action,
              data: values,
              success: function(data){
                  if (data.success) {
                      $("#modal-transparent").modal();
                      $('#form-submit')[0].reset();
                  } else {
                      $('#fail-dialog').modal('show');
                  }
              },
              error: function(response) {
                  $('#fail-dialog').modal('show');
              }
          });

      }
  });

  $(".modal-transparent").on('show.bs.modal', function () {
      setTimeout( function() {
          $(".modal-backdrop").addClass("modal-backdrop-transparent");
      }, 0);
      //$("#newsletter-signup").submit();
  });

  $(".modal-transparent").on('hidden.bs.modal', function () {
    $(".modal-backdrop").addClass("modal-backdrop-transparent");
  });

})(window.jQuery, craftercms, rxjs);