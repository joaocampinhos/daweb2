$(document).ready(function(){
    /*
     * Dropdown menu handler
     */
  $(".login").click(function() {
    $(".submenu").toggle();
  });

  $(".submenu").click(function() {
    $(this).hide();
  });

  /*
   * Responsive menu
   */
  $(".togglemenu").click(function(){
    $(".menutoggle").toggle();
  });

  // Reset css that was applied on small devices
  $(window).resize(function(){
    if(window.innerWidth > 890) {
      $(".menutoggle").removeAttr("style");
    }
  });

  // Handlers for the submit and cancel button
  $(".pubsubmit").click(function(){

    //On a real application, we would get this data from the db or something like that
    var photo = "images/avatar.jpg",
    name  = "Steve Holt";

    var media = $("<div><div><a href='#'><img></a><div><h4></h4></div></div></div>");
    $("div:first",media).addClass("media");
    $(".media a",media).addClass("img").find("img").addClass("avatar").attr("src",photo);
    $("div:last",media).addClass("bd").find("h4").addClass("name").text(name);
    $("h4",media).after($("<p></p>").text($(".newpub textarea").val()));
    $(".content").append(media);
    $(".newpub textarea").val("");
    $(".pubcancel").click();
  });
  $(".pubcancel").click(function(){
    $(".newpub").addClass("none");
    $(".newn").removeClass("disabled btndisabled");
  });

  $(".empsel").change(function() {
    
  });

});
