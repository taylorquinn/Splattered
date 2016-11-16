
<!--form with the original content automatically filled in, allowing updates-->
<div id="content">

<h2>Edit Product</h2>

<form id="edit-product" action="<?= BASE_URL ?>/paintings/edit<?= $id ?>/process" method="POST">

<label>Title: <input type="text" name="title" value="<?= $product['title'] ?>"></label>

<label>Description: <textarea name="description"><?= $product['description'] ?></textarea></label>

<label>Sizes: <input type="text" name="sizes" value="<?= $product['sizes'] ?>"></label>

<label>Price ($): <input type="text" name="price" value="<?= $product['price'] ?>"></label>

<label>Image URL: <input type="text" name="img_url" value="<?= $product['img_url'] ?>"></label>

<input type="submit" name="submit" class="edit-button2" value="Save Changes">

</form>

<button class="edit-button2" onclick = "deleteAppear(<?= $id?>)">Delete</button>


<table>

</table>


</div>


<!--Popup to ensure that you actually want to delete -->
<div id="myDeletePopup" class="popup">

 		<div class="popup-content">
	  		    <span class="close" onclick="deleteClose()">×</span>


	  		   <form  method="POST">



				</form>

	  		    <form  action="<?= BASE_URL ?>/paintings/delete" method="POST">
	  		  	  <h2>Are you sure you want to delete this?</h2>


	  		   	 <input type="id_number" value="15" id="id_number" name= "id_number"/>


				  <input class="close1" type="submit" value="Delete"/>

				</form>
				<button class="close" onclick="deleteClose()">Cancel</button>



		</div>

</div>
