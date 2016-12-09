$(document).ready(function(){

  // event handler for checkboxes with name "size"
  $('input[name="size"]').click(function(){
    // by default, hide everything
    $('div.product').hide();

    // iterate through only the checked checkboxes
    $('input[name="size"]:checked').each(function(){
      var checkedVal = $(this).val(); // value of checked box

      // show products matching that value
      switch(checkedVal) {
        case 's':
          $('div.product.Small').show(); // show the Small items
          break;
        case 'm':
          $('div.product.Medium').show();
          break;
        case 'l':
          $('div.product.Large').show();
          break;
        case 'xl':
          $('div.product.Xlarge').show();
          break;
      }
    });
  });

  // by default, check all the boxes
  $('input[name="size"]').each(function(){
    $(this).prop("checked", true); // check the box
  })

});



function addItems(){

    var $inputs = $('#myForm :input');

    var numberWrong = 0;
    $inputs.each(function() {


        if(this.name != "butt-add" && this.name != "butt-can"){

           console.log(this.name, ": ", $(this).val());


            if($(this).val() == ""){
                $(this).css('border-color', 'red');
                 numberWrong++;
            }
            else{
                $(this).css('border-color', '#CCCCCC');
            }
        }

});


    if(numberWrong != 0){
      errorAppear();
    }
      else{
        successAppear();
      // errorAppear();
         $inputs.each(function() {
          $(this).val().text = "";
        } );

         console.log("Attempted to upload!");

      }





}


function clearFilters(){
  var $inputs = $('#sidebar :input');

    var numberWrong = 0;
    $inputs.each(function() {
       $(this).attr('checked', false);

    });

}

 function sidebarAppear(){
    $("#sidebar").css("display", "block");
    $("#sidebar").css("width", '15%');
    $("#content").css("width", '75%');
    $("#sidebarButton").css("display", "none");

    // document.getElementById("sidebar").style.display = "block";
    // document.getElementById("sidebar").style.width = '15%';
    // document.getElementById("content").style.width = '75%';
     //document.getElementById("sidebarButton").style.display = "none";
     console.log("Tried to make visible");
 }

  function sidebarDisappear(){
    $("#sidebar").css("display", "none");
    $("#content").css("width", '90%');
    $("#sidebarButton").css("display", "block");

    // document.getElementById("sidebar").style.display = "none";
     //document.getElementById("content").style.width = '90%';
     //document.getElementById("sidebarButton").style.display = "block";

   console.log("Tried to make invisible");
 }

/*var popup = document.getElementById('myLoginPopup');

// Get the button that opens the modal
var btn = document.getElementById("popupButt");*/

// Get the <span> element that closes the modal
/*var span = document.getElementsByClassName("close")[0];*/

// When the user clicks the button, open the modal
function popupAppear() {
   $("#myItemPopup").css("display", "block");
    console.log("did this.");
}

// When the user clicks on <span> (x), close the modal
function popupClose() {
    $("#myItemPopup").css("display", "none");
    console.log("did this. appear");
}
/*
// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        popup.style.display = "none";
    }
  }*/


function blogAppear() {
   $("#addBlogPopup").css("display", "block");
    console.log("did this.");
}

function blogDisappear() {
   $("#addBlogPopup").css("display", "none");
    console.log("did this.");
}





function loginAppear() {
   $("#myLoginPopup").css("display", "block");
    console.log("did this.");
}


function signupAppear() {
   $("#mySignupPopup").css("display", "block");
    console.log("did this.");
}

function deleteAppear(id) {
   $("#myDeletePopup").css("display", "block");

    document.getElementById("id_number").value = id;

    console.log("did this!!!!!!!!!!!" + id);
}

function deleteClose() {
    $("#myDeletePopup").css("display", "none");
    console.log("did this. appear");
}

function logoutAppear() {
   $("#myLogoutPopup").css("display", "block");
    console.log("WHY AM I NOT THE BLOG.");
}

function logoutClose() {
   $("#myLogoutPopup").css("display", "none");
    console.log("did this.");
}


// When the user clicks on <span> (x), close the modal
function loginClose() {
    $("#myLoginPopup").css("display", "none");
    console.log("did this. appear");
}

function signupClose() {
    $("#mySignupPopup").css("display", "none");
    console.log("did this. appear");
}


 function errorAppear() {
   $("#errorPopup").css("display", "block");
    console.log("did this.");
}

// When the user clicks on <span> (x), close the modal
function errorClose() {
    $("#errorPopup").css("display", "none");
    console.log("did this. appear");
}


function successAppear() {
   $("#successPopup").css("display", "block");
    console.log("did this.");
}

// When the user clicks on <span> (x), close the modal
function successClose() {
    $("#successPopup").css("display", "none");
    console.log("did this. appear");
}

//ajax for commenting on the blog
