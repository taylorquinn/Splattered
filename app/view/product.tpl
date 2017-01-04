<div id="content-product">

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
					<!--<li><BUTTON class= "checkout-button">Add to Cart</BUTTON></li>-->

<!--
					<li>	<form method="post" action="https://www.paypal.com/cgi-bin/webscr">
							<input type="hidden" name="cmd" value="_cart">
							<input type="hidden" name="add" value="1">
							<input type="hidden" name="business" value="ktquinn13@gmail.com">
							<input type="hidden" name="item_name" value=<?= $p->get('title') ?>>
							<input type="hidden" name="item_number" value=<?= $p->get('id') ?>>
							<input type="hidden" name="amount" value=<?= $p->get('price') ?>>
							<input type="hidden" name="shipping" value="1.00">
							<input type="hidden" name="shipping2" value="0.50">
							<input type="hidden" name="handling" value="2.00 ">
							<input type="hidden" name="currency_code" value="USD">
							<input type="hidden" name="return" value="">
							<input type="hidden" name="undefined_quantity" value="1">
							<input type="image" src="http://www.paypalobjects.com/en_US/i/btn/x-click-but22.gif" border="0" name="submit" width="87" height="23" alt="Make payments with PayPal - it's fast, free and secure!">
						</form> </li>

-->
					 <?php if(isset($_SESSION['user']) && $_SESSION['user'] != '') { 
             $p = User::loadByUsername($_SESSION['user']);

             if($p->get('status') == 2) {
             
           ?>
	  		    		<li>
						<form action="<?= BASE_URL ?>/paintings/edit<?= $p->get('id') ?>" method="POST">
		   					 <input type="submit" class = "edit-button" value="Edit" />
						</form>
						</li>

						<li>


						<button class="edit-button2" onclick = "deleteAppear(<?= $p->get('id')?>)">Delete</button>
						</li>
					<?php } else {?>

					


					<?php } }?>
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
