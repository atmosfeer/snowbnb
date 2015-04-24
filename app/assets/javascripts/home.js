$(document).ready(function () {
  $(document).mousemove(function( event ) {
    var height = (event.pageY / $(document).height());
    var width = (event.pageX / $(document).width());
    var t = Math.floor(100 * height);
    var b = Math.floor(100 * width);
    var style = 'linear-gradient(rgba(' + t + ',' + t + ',' + t + ',0.5),rgba('+ b + ',' + b + ',' + b + ',0.5))';
    console.log(style);
    $('.fullscreen-film').css({ 'background': style });
    var fill = $('img.svg');
    console.log(fill);
  });
});