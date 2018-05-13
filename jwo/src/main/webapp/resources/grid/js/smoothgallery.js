/*
 * Smoothbox
 * http://kthornbloom.com/smoothbox.php
 *
 * Copyright 2013, Kevin Thornbloom
 * Free to use and abuse under the MIT license.
 * http://www.opensource.org/licenses/mit-license.php
 */
 
(function ($) {
    $.fn.extend({
        smoothGallery: function (options) {

            // options for the plugin
            var defaults = {
                animSpeed: 180,
                delaySpeed: 50,
                visibleRows: 2,
                animEasing: 'easeOutQuart'
            }

            var options =  $.extend(defaults, options);

            return this.each(function () {
                jQuery.fn.reverse = [].reverse;

                /* function to set height of gallery */
                setHeight = function () {
                    var itemHeight = $('.sg-item').outerHeight(),                            
                        wrapperHeight = (itemHeight * options.visibleRows),
                        posTop = parseInt($('.sg-item').css('top')),
                        newTop = Math.round(Math.abs(posTop) / itemHeight) * itemHeight;
                    /* Oh, the page size changed? Let me fix that */
                    $('.sg-item').css('top', '-' + newTop + 'px');
                    /* Adjust height for visible rows */
                    $('.sg').css('height', wrapperHeight);
                };

                modalHeight = function () {
                    if ($('.sg-modal').length) {
                        var modalimgHeight = parseInt($('.sg-modal a').height()),
                            screenheight = parseInt($(window).height());

                        if (screenheight < (modalimgHeight + 50)) {
                            $('.sg-modal a').css('height', (screenheight - 20));
                            $('#bug').html('smaller');
                        } else {
                            $('.sg-modal a').css('height', 'auto');
                            $('#bug').html(modalimgHeight + '' + screenheight);
                        }
                    }
                }

                /* add disabled class to up button on start */
                $('.sg-up').addClass('sg-disabled');
                $('.sg').show();

                /* call setHeight on page load */
                setHeight();

                /* call setHeight on page resize */
                $(window).resize(function () {
                    setHeight();
                    modalHeight();
                });

                /* Slide Down */
                slideDown = function () {
                    /* Disable button during animation */
                    if ($('.sg-item').is(':animated')) {
                        return false;
                    } else {

                        /* are you all the way down? */
                        var lastPos = parseInt($('.sg-item').last().css('top')),
                            lastHeight = parseInt($('.sg-item').last().outerHeight()),
                            lastWidth = parseInt($('.sg-item').last().outerWidth()),
                            itemNum = $('.sg-item').length,
                            wrapperWidth = parseInt($('.sg').width()),
                            wrapperHeight = parseInt($('.sg').height()),
                            columns = Math.floor(wrapperWidth / lastWidth),
                            totalRows = Math.ceil(itemNum / columns),
                            r1 = (totalRows * lastHeight),
                            r2 = ((wrapperHeight / lastHeight) * lastHeight);
                        if (lastPos <= -(r1 - r2)) {
                            //
                        } else {
                            /* Animate Each */
                            $('.sg-up').removeClass('sg-disabled');
                            $('.sg-item').each(function (i) {
                                /* Check how far to move items */
                                itemHeight2 = parseInt($('.sg-item').outerHeight());
                                $(this).delay(options.delaySpeed * i).animate({
                                    top: '-=' + itemHeight2 + 'px'
                                }, options.animSpeed, options.animEasing);
                            });
                            if (lastPos <= -((r1 - r2))+lastHeight){
                                $('.sg-down').addClass('sg-disabled');
                            }
                        }                        
                        event.preventDefault();
                    }
                }
                $(document.body).on('click', '.sg-down', function (event) {
                    slideDown();
                });
                $(document).keydown(function(e){
                    if (e.keyCode == 40) { 
                        slideDown();
                       return false;
                    }
                });

                /* Slide Up */

                slideUp = function () {
                    /* Disable button during animation */
                    if ($('.sg-item').is(':animated')) {
                        return false;
                    } else {
                        /* are you all the way up? */
                        if ($('.sg-item').first().css('top') == '0px') {
                            //
                        } else {
                            /* Animate Each */
                            $('.sg-down').removeClass('sg-disabled');
                            $('.sg-item').reverse().each(function (i) {
                                /* Check how far to move items */
                                itemHeight2 = parseInt($('.sg-item').outerHeight());
                                $(this).delay(options.delaySpeed * i).animate({
                                    top: '+=' + itemHeight2 + 'px'
                                }, options.animSpeed, options.animEasing);
                            });
                            var lastHeight = parseInt($('.sg-item').last().outerHeight());
                            if (parseInt($('.sg-item').first().css('top')) == (0-lastHeight)) {
                                $('.sg-up').addClass('sg-disabled');
                            }
                        }
                        event.preventDefault();
                    }
                }
                $(document.body).on('click', '.sg-up', function (event) {
                    slideUp();
                });
                $(document).keydown(function(e){
                    if (e.keyCode == 38) { 
                        slideUp();
                       return false;
                    }
                });

                /* Zoom Function */
//                $(document.body).on('click', '.sg-item a', function (event) {
//                    var caption = $(this).attr('title'),
//                        clickedUrl = $(this).attr('href');
//                    if ($(this).attr('title')) {
//                        $('body').append('<a href="' + clickedUrl + '"/><a href="#" id="sg-close">✕</a><br><div class="sg-caption">'+ caption +'</div>');
//                    }
//                    else {
//                        $('body').append('<a href="' + clickedUrl + '"/><a href="#" id="sg-close">✕</a>');
//                    }
//                    $('.sg-modal').fadeIn( 300, function() {
//                            modalHeight();
//                      });
//                    
//                    event.preventDefault();
//                });
//                $(document.body).on('click', '#sg-close', function (closeModal) {
//                    $('.sg-modal').fadeOut(300, function() { $(this).remove(); });
//                    closeModal.preventDefault();
//                });
            }); /* end return */
        }
    });
})(jQuery);
