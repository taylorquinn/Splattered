<h2 style="color:black">Blog Visualization</h2>

<svg></svg>
<div id = "parent">
  <?php if(isset($_SESSION['user'])) {?>
  <div>
  <form id="editShirtTitleForm" method="POST" action="<?= BASE_URL ?>/blogs/editTitle/">
    <label>Edit Title: <input type="text" id="editShirtTitle" name="title" value=""></label>
    <input type="hidden" id="editPostID" name="productID" value="">
    <input type="submit" name="submit" value="Edit">
    <button type="button" name="cancel">Cancel</button>
  </form>
  </div>

  <div>
  <form id="deleteBlog" method="POST" action="<?= BASE_URL ?>/blogs/deleteBlog/">
    <label>Delete: <input type="text" id="deleteTitle" name="title" value=""></label>
    <input type="hidden" id="deleteID" name="productID" value="">
    <input type="submit" name="submit" value="Delete">
  </form>
  </div>
  <div>
  <form id="addCommentForm" method="POST" action="<?= BASE_URL ?>/blogs/addComment/">
    <label>Add Comment: <input type="text" id="addedComment" name="title" value=""></label>
    <input type="submit" name="submit" value="Add">
    <button type="button" name="cancel">Cancel</button>
  </form>
  </div>
  <?php } ?>


</div>




<!-- displays an error message when the user does not input valid data for sign up, login, or edit profile -->
<!--<h3 style="text-align: center; width:100%;">VISUALIZATION PAGE OMG SO PURDY</h3>-->
<form  action="<?= BASE_URL ?>/blogs" method="POST">
  <input style="margin-left: calc(50% - 65px);" class="buttonFollow buttonFollow2" type="submit" value="Go Back" >
</form>
