
<div id="images">
			<img class="add-img" src="<?= BASE_URL ?>/public/img/imagePlaceholder.png"> </a>
			<div id="tinyImages">
				<ul id="tinyImages">
					
					<li><img class="tile" src="<?= BASE_URL ?>/public/img/imagePlaceholder.png" alt="Upload image" /></li>
					<li><img class="tile" src="<?= BASE_URL ?>/public/img/imagePlaceholder.png" alt="Upload image" /></li>
					
					
				</ul>

			
			</div>
</div>

			
		<div id="add-information">
			<h2 class="add-title">Add Item To Sell:</h2>
			
			    <ul class="product-checkout">
		    		
	  		    	<form id="add-product" action="<?= BASE_URL ?>/addProductProcess" method="POST">
	  		   
				
				  <input type="text" name="title" class="add-text" placeholder="INSERT TITLE OF ITEM">
				 	 <br>
				  <input type="text" name="price" class="add-text" placeholder="INSERT PRICE $$$">
				 	 <br>

				 	 <input type="text" name="sizes" class="add-text" placeholder="INSERT SIZES">
				 	 <br>
				 	 <input type="text" name="img_url" class="add-text" placeholder="INSERT IMAGE URL">
						<br>
				 		<textarea  class="add-textbox"  placeholder = "Enter Description" name="description"></textarea>
				 	<br>
				  <input type="submit" name="butt-add" class="add-button" value="Add item to site" onclick="addItems()">

				<!--  <input type="submit" name="submit" value="Add item">-->
				  <input type="button" name="butt-can" class="cancel-button" value="Cancel" onclick="location.href='<?= BASE_URL ?>/add'"">
				</form>

	  		    </ul>
	   </div>



		<div id="errorPopup" class="popup">

 			<div class="popup-content">
	  		    <span class="close" onclick="errorClose()">×</span>
	  		    <h2>Uh-oh! You missed a couple key details! Go back and fill those out and try again.</h2>
	  		    
	  		   	
			</div>

		</div>
	
		<div id="successPopup" class="popup">

 			<div class="popup-content">
	  		    <span class="close" onclick="location.href='addItem.html'"">×</span>
	  		    <h2>Success!!</h2>
	  		    
	  		   	
			</div>

		</div>
