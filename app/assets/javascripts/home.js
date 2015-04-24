$(document).ready(function () {
  $(document).mousemove(function( event ) {
    var height = 1 - (event.pageY / $(document).height());
    var width = 1 - (event.pageX / $(document).width());
    var h = Math.floor(100 * height);
    var w = Math.floor(100 * width);
    var r = Math.floor(113 + 142 * height);
    var g = Math.floor(193 + 62 * height);
    var b = Math.floor(208 + 47 * height);
    var style = 'linear-gradient(rgba(' + h + ',' + h + ',' + h + ',0.5),rgba('+ w + ',' + w + ',' + w + ',0.5))';
    console.log(r);
    $('.fullscreen-film').css({ 'background': style });
    $('.logo #Logo').attr('fill', 'rgba(' + r + ',' + g + ',' + b + ',1)');
  });
});