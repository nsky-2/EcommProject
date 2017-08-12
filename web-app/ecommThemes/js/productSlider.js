/**
 * Created by sagar on 7/24/2017.
 */
(function($){
    $.fn.lbSlider = function(options) {
        var options = $.extend({
            leftBtn: '.leftBtn',
            rightBtn: '.rightBtn',
            itemSlide: '.itemSlide'
        }, options);
        var make = function() {
            $(this).css('overflow', 'hidden');

            var thisWidth = $(this).width();
            var mod = thisWidth % options.visible;
            if (mod) {
                $(this).width(thisWidth - mod); // to prevent bugs while scrolling to the end of slider
            }

            var el = $(this).children('ul');
            el.css({
                position: 'relative',
                left: '0'
            });
            var leftBtn = $(options.leftBtn), rightBtn = $(options.rightBtn);

            var sliderFirst = el.children('li').slice(0, options.visible);
            var tmp = '';
            sliderFirst.each(function(){
                tmp = tmp + '<li>' + $(this).html() + '</li>';
            });
            sliderFirst = tmp;
            var sliderLast = el.children('li').slice(-options.visible);
            tmp = '';
            sliderLast.each(function(){
                tmp = tmp + '<li>' + $(this).html() + '</li>';
            });
            sliderLast = tmp;

            var elRealQuant = el.children('li').length;
            el.append(sliderFirst);
            el.prepend(sliderLast);
            var elWidth = el.width()/options.visible;
            el.children('li').css({
                float: 'left',
                width: elWidth,
                padding: '10px'
            });
            var elQuant = el.children('li').length;
            el.width(elWidth * elQuant);
            el.css('left', '-' + elWidth * options.visible + 'px');

            function disableButtons() {
                leftBtn.addClass('inactive');
                rightBtn.addClass('inactive');
            }
            function enableButtons() {
                leftBtn.removeClass('inactive');
                rightBtn.removeClass('inactive');
            }

            leftBtn.click(function(event){
                event.preventDefault();
                if (!$(this).hasClass('inactive')) {
                    disableButtons();
                    el.animate({left: '+=' + options.itemSlide*elWidth + 'px'}, 300,
                        function(){
                            if ($(this).css('left') == '0px') {
                                $(this).css('left', '-' + elWidth * elRealQuant + 'px');
                            }
                            enableButtons();
                        }
                    );
                }
                return false;
            });

            rightBtn.click(function(event){
                event.preventDefault();
                if (!$(this).hasClass('inactive')) {
                    disableButtons();
                    el.animate({left: '-=' + options.itemSlide*elWidth + 'px'}, 300,
                        function(){
                            if ($(this).css('left') == '-' + (elWidth * (options.visible + elRealQuant)) + 'px') {$(this).css('left', '-' + elWidth * options.visible + 'px');}
                            enableButtons();
                        }
                    );
                }
                return false;
            });

        };
        return this.each(make);
    };
})(jQuery);

(function($){
    $.fn.lbSlider1 = function(options) {
        var options = $.extend({
            leftBtn: '.leftBtn',
            rightBtn: '.rightBtn',
            itemSlide: '.itemSlide'

        }, options);
        var make = function() {
            $(this).css('overflow', 'hidden');

            var thisWidth = $(this).width();
            var mod = thisWidth % options.visible;
            if (mod) {
                $(this).width(thisWidth - mod); // to prevent bugs while scrolling to the end of slider
            }

            var el = $(this).children('ul');
            el.css({
                position: 'relative',
                left: '0'
            });
            var leftBtn = $(options.leftBtn), rightBtn = $(options.rightBtn);

            var sliderFirst = el.children('li').slice(0, options.visible);
            var tmp = '';
            sliderFirst.each(function(){
                tmp = tmp + '<li>' + $(this).html() + '</li>';
            });
            sliderFirst = tmp;
            var sliderLast = el.children('li').slice(-options.visible);
            tmp = '';
            sliderLast.each(function(){
                tmp = tmp + '<li>' + $(this).html() + '</li>';
            });
            sliderLast = tmp;

            var elRealQuant = el.children('li').length;
            el.append(sliderFirst);
            el.prepend(sliderLast);
            var elWidth = el.width()/options.visible;
            el.children('li').css({
                float: 'left',
                width: elWidth,
                padding: '10px'
            });
            var elQuant = el.children('li').length;
            el.width(elWidth * elQuant);
            el.css('left', '-' + elWidth * options.visible + 'px');

            function disableButtons() {
                leftBtn.addClass('inactive');
                rightBtn.addClass('inactive');
            }
            function enableButtons() {
                leftBtn.removeClass('inactive');
                rightBtn.removeClass('inactive');
            }

            leftBtn.click(function(event){
                event.preventDefault();
                if (!$(this).hasClass('inactive')) {
                    disableButtons();
                    el.animate({left: '+=' + options.itemSlide*elWidth + 'px'}, 300,
                        function(){
                            if ($(this).css('left') == '0px') {
                                $(this).css('left', '-' + elWidth * elRealQuant + 'px');
                            }
                            enableButtons();
                        }
                    );
                }
                return false;
            });

            rightBtn.click(function(event){
                event.preventDefault();
                if (!$(this).hasClass('inactive')) {
                    disableButtons();
                    el.animate({left: '-=' + options.itemSlide*elWidth + 'px'}, 300,
                        function(){
                            if ($(this).css('left') == '-' + (elWidth * (options.visible + elRealQuant)) + 'px') {$(this).css('left', '-' + elWidth * options.visible + 'px');}
                            enableButtons();
                        }
                    );
                }
                return false;
            });

        };
        return this.each(make);
    };
})(jQuery);
(function($){
    $.fn.lbSlider2 = function(options) {
        var options = $.extend({
            leftBtn: '.leftBtn',
            rightBtn: '.rightBtn',
            itemSlide: '.itemSlide'
            }, options);
        var make = function() {
            $(this).css('overflow', 'hidden');

            var thisWidth = $(this).width();
            var mod = thisWidth % options.visible;
            if (mod) {
                $(this).width(thisWidth - mod); // to prevent bugs while scrolling to the end of slider
            }

            var el = $(this).children('ul');
            el.css({
                position: 'relative',
                left: '0'
            });
            var leftBtn = $(options.leftBtn), rightBtn = $(options.rightBtn);

            var sliderFirst = el.children('li').slice(0, options.visible);
            var tmp = '';
            sliderFirst.each(function(){
                tmp = tmp + '<li>' + $(this).html() + '</li>';
            });
            sliderFirst = tmp;
            var sliderLast = el.children('li').slice(-options.visible);
            tmp = '';
            sliderLast.each(function(){
                tmp = tmp + '<li>' + $(this).html() + '</li>';
            });
            sliderLast = tmp;

            var elRealQuant = el.children('li').length;
            el.append(sliderFirst);
            el.prepend(sliderLast);
            var elWidth = el.width()/options.visible;
            el.children('li').css({
                float: 'left',
                width: elWidth,
                padding: '10px'
            });
            var elQuant = el.children('li').length;
            el.width(elWidth * elQuant);
            el.css('left', '-' + elWidth * options.visible + 'px');

            function disableButtons() {
                leftBtn.addClass('inactive');
                rightBtn.addClass('inactive');
            }
            function enableButtons() {
                leftBtn.removeClass('inactive');
                rightBtn.removeClass('inactive');
            }

            leftBtn.click(function(event){
                event.preventDefault();
                if (!$(this).hasClass('inactive')) {
                    disableButtons();
                    el.animate({left: '+=' + options.itemSlide*elWidth + 'px'}, 300,
                        function(){
                            if ($(this).css('left') == '0px') {
                                $(this).css('left', '-' + elWidth * elRealQuant + 'px');
                            }
                            enableButtons();
                        }
                    );
                }
                return false;
            });

            rightBtn.click(function(event){
                event.preventDefault();
                if (!$(this).hasClass('inactive')) {
                    disableButtons();
                    el.animate({left: '-=' + options.itemSlide*elWidth + 'px'}, 300,
                        function(){
                            if ($(this).css('left') == '-' + (elWidth * (options.visible + elRealQuant)) + 'px') {$(this).css('left', '-' + elWidth * options.visible + 'px');}
                            enableButtons();
                        }
                    );
                }
                return false;
            });
                    };
        return this.each(make);
    };
})(jQuery);