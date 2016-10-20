<div id="content">

<!--h2>Product Details</h2>


<div class="product">



	<img class="product-image" src="<?= BASE_URL.'/public/img/'.$p->get('img_url') ?>" alt="" />
	<!-- source: http://www.wherever.com -->
	<!--<h3><?= $p->get('title') ?></h3>
	<p><?= $p->get('description') ?></p>
	<p>Available size(s): <?= $p->get('sizes') ?></p>
	<p class="price"><?= $p->get('price') ?></p>
	<button>Add to Cart</button>

	<?php if( !isset($_SESSION['user']) || $_SESSION['user'] == '') { ?>


		<?php } else {?>

		<form action="<?= BASE_URL ?>/paintings/edit<?= $row['id'] ?>" method="POST">
   			 <input type="submit" value="Edit" />
		</form>

		<?php } ?>

</div>


</div>

<div id="sidebar">-->








		

			<img class="large-img" src="<?= BASE_URL ?>/public/img/<?= $p->get('img_url')?>" >
			
	
		
			
			    <ul class="product-checkout">
		    		<li><p class="checkout-title"><?= $p->get('title') ?></p></li>
	  		    	<li><p class="checkout-price"></p><?= $p->get('price') ?></li>
	  		    	<li><p class="checkout-descrip"><?= $p->get('description') ?></p></li>
	  		    	<li>QTY: <select>
						  <option value="0">0</option>
						  <option value="1">1</option>
						  <option value="2">2</option>
						  <option value="3">3</option>
						</select></li>
					<li><BUTTON class= "checkout-button">Add to Cart</BUTTON></li>

					 <?php if( !isset($_SESSION['user']) || $_SESSION['user'] == '') { ?>
	  		    
					<?php } else {?>
					<li>
						<form action="<?= BASE_URL ?>/paintings/edit<?= $p->get('id') ?>" method="POST">
		   					 <input type="submit" class = "edit-button" value="Edit" />
						</form>
					</li>

					<li>
	

				<button class="edit-button2" onclick = "deleteAppear(<?= $p->get('id')?>)">Delete</button>
				</li>

					<?php } ?>
	  		    </ul>



</div>


<div id="myDeletePopup" class="popup">

 		<div class="popup-content">
	  		    <span class="close" onclick="deleteClose()">×</span>
	  		
	  		  
	  		   <form  method="POST">	
	  		  		 
	  		   
					
				</form>

	  		    <form  action="<?= BASE_URL ?>/paintings/delete" method="POST">
	  		  	  <h2>Are you sure you want to delete this?</h2>
	  		   	

	  		   	 <input type="id_number" value="15" id="id_number" name= "id_number"/>

				  
				  <input class= "close1" type="submit" value="Delete" />
				
				</form>
				  <button class= "close" onclick="deleteClose()">Cancel</button>

	  		    
	  		   	
		</div>

</div>



