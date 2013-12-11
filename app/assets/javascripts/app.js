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


/*
 * Client Side contacts request handler
 */
/*var check = $("<a><img></img></a>"),
    cross = $("<a><img></img></a>");

check.attr("href","#approve").click(function(){
  $(this).parent().parent().removeClass("pending").appendTo(".confirmed");
  $(this).parent().remove();
  if ($(".pendingreq .pending").length === 0)
    $(".pendingreq").remove();
});
cross.attr("href","#remove").click(function(){
  $(this).parent().parent().remove();
  if ($(".pendingreq .pending").length === 0)
    $(".pendingreq").remove();
});
$("img",check).attr("src","images/check.png");
$("img",cross).attr("src","images/cross.png");
$(".pending").append($("<p></p>").append(check).append(cross));
*/

/*
 * New publication 
 */
$(".newn").click(function(){
  $(this).addClass("disabled btndisabled");
  $(".newpub").removeClass("none");
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

/*
 * Edit profile
 */
$(".add a.edit").click(function(){
  var about = "";
  var edit = "Editar Perfil";
  var confirm = "Confirmar";
  $(this).toggleClass("btngreen");
  if ($(this).hasClass("btngreen")){
    $(this).text(confirm);
    // Profile
    $(".jobedit").after($("<input class='jobedit' type='text'>").val($(".jobedit").text()));
    $(".jobedit").empty();

    $(".compedit").after($("<input class='compedit' type='text'>").val($(".compedit").text()));
    $(".compedit").empty();
    //Location
    $(".cityedit").after($("<input class='cityedit' type='text'>").val($(".cityedit").text()));
    $(".cityedit").empty();

    $(".countedit").after($("<input class='countedit' type='text'>").val($(".countedit").text()));
    $(".countedit").empty();
    // About
    var all = [];
    $(".about p").each(function(){
      all.push($(this).text());
    });
    about = $("<textarea></textarea>").val(all.join("\n"));
    $(".about").append(about);
    $(".about p").remove();
    // CV
    $(".cv").each(function(){
      $(this).after($("<a class='button addfield' href='#'>Adicionar outro campo</a>").click(function(){
        $(this).before($("<input class='cvedit' type='text'>"));
      }));
      $(this).after($("<input class='cvedit' type='text'>").val($(this).text()));
      $(this).remove();
    });
  }
  else {
    $(this).text(edit);
    // Profile
    $("span.jobedit").text($("input.jobedit").val());
    $("input.jobedit").remove();

    $("span.compedit").text($("input.compedit").val());
    $("input.compedit").remove();
    //Location
    $("span.cityedit").text($("input.cityedit").val());
    $("input.cityedit").remove();

    $("span.countedit").text($("input.countedit").val());
    $("input.countedit").remove();
    // About
    var texto = $(".about textarea").val().split(/\n/g);
    for (var i = 0; i < texto.length; i++) {
      about = $("<p></p>").text(texto[i]);
      $(".about").append(about);
    }
    $(".about textarea").remove();
    // CV
    $(".addfield").remove();
    $(".cvedit").each(function(){
      $(this).after($("<p class='cv'></p>").text($(this).val()));
      $(this).remove();
    });
  }
});

});

