
<img class="head-image" src="<?= BASE_URL ?>/public/img/painting_header1.jpg" alt="Header image" /> 
<div id="content">



<?php while($row = mysql_fetch_assoc($result)): ?>
<!--<form action="<?= BASE_URL ?>/paintings/edit/<?= $row['id'] ?>" method="POST">-->


<?php
$str = $row['sizes'];
$newStr = "";
for( $i = 0; $i <= strlen( $str ); $i++ ) {
    $char = substr( $str, $i, 1 );
  	
    if ($char!=","){
     
    $newStr .= $char;
    
    }


    // $char contains the current character, so do your processing here
}
?>




<div class="product-cell product <?= $newStr?>"><!--.<?= $row['sizes'] ?>">-->

	<a href="<?= BASE_URL ?>/paintings/view/<?= $row['id'] ?>"><img class="product-img" src="<?= BASE_URL ?>/public/img/<?= $row['img_url'] ?>" alt="<?= $row['title'] ?>" /></a>
	<h3><a href="<?= BASE_URL ?>/paintings/view/<?= $row['id'] ?>"><?= $row['title'] ?></a></h3>
	<!--<p>
		<?= $row['description'] ?>
	</p>-->
	<div class="product2">
		<!--<p>Available size(s): <?= $row['sizes'] ?></p>-->
		<p class="product-p">$<?= $row['price'] ?></p>
		 <a><input type="image" src="<?= BASE_URL ?>/public/img/zoomIn.jpg" name="saveForm" class="product-icon" id="popupButt" action="" onclick="popupAppear()"/>


		 	<form method="post" action="https://www.paypal.com/cgi-bin/webscr"  style=" display: inline-block; text-align:  left;">
							<input type="hidden" name="cmd" value="_cart">
							<input type="hidden" name="add" value="1">
							<input type="hidden" name="business" value="ktquinn13@gmail.com">
							<input type="hidden" name="item_name" value=<?= $row['title'] ?>>
							<input type="hidden" name="item_number" value=<?= $row['id'] ?>>
							<input type="hidden" name="amount" value=<?= $row['price'] ?>>
							<input type="hidden" name="shipping" value="1.00">
							<input type="hidden" name="shipping2" value="0.50">
							<input type="hidden" name="handling" value="2.00 ">
							<input type="hidden" name="currency_code" value="USD">
							<input type="hidden" name="return" value="">
							<input type="hidden" name="undefined_quantity" value="1">
							<input type="image" src="<?= BASE_URL ?>/public/img/addToCart.png"  style=" width: 25px;" border="0" name="submit" width="87" height="23" alt="+cart">
						</form> 

		<!--<a href="#"> <img class = "product-icon2" src="<?= BASE_URL ?>/public/img/addToCart.png"></a>-->

		<!--<button type="submit" action="<?= BASE_URL ?>/paintings/edit/<?= $row['id'] ?>" method="POST">Edit</button>-->

		<?php if( !isset($_SESSION['user']) || $_SESSION['user'] == '') { ?>


		<?php } else {?>

		   

		<ul class="editbuttons"><li>
		<form action="<?= BASE_URL ?>/paintings/edit<?= $row['id'] ?>" method="POST">
	
   			 <input type="submit" class= "edit-button2" value="Edit" />
		</form></li>
		<li>
	

		<button class="edit-button2" onclick = "deleteAppear(<?=$row['id']?>)">Delete</button>
		</li>


		
		</ul>

		<?php } ?>

	</div>

</div>


</form>
<?php endwhile; ?>


</div>


<div> 

<div id="myDeletePopup" class="popup">

 		<div class="popup-content">
	  		    <span class="close" onclick="deleteClose()">×</span>
	  		
	  		  
	  		   <form  method="POST">	
	  		  		 
	  		   
					
				</form>

	  		    <form  action="<?= BASE_URL ?>/paintings/delete" method="POST">
	  		  	  <h2>Are you sure you want to delete this?</h2>
	  		   	

	  		   	 <input type="id_number" value="15" id="id_number" name= "id_number"/>

				  
				  <input class= "close1"  type="submit" value="Delete" />
				
				</form>
				  <button class= "close" onclick="deleteClose()">Cancel</button>

	  		    
	  		   	
		</div>

</div>


<div id="myItemPopup" class="popup">

 			<div class="popup-content">
	  		    <span class="close" onclick="popupClose()">×</span>
	  		    <p class="popup-text">Panda Watercolor</p>
	  		    <img class="popup-img" src="<?= BASE_URL ?>/public/img/hands1.jpg">
	  		    <ul class="popup-list">
	  		    	<li><p class="popup-price">$7.00</p></li>
	  		    	<li><p class="popup-descrip">This watercolor painting would be absolutely perfect in any setting: your wall, your desk or your office. The colors are soothing and it will match the most creative of aesthetics. Each painting is completely handmade by our artists wil care for you! </p></li>
	  		    	<li><select>
						  <option value="0">0</option>
						  <option value="1">1</option>
						  <option value="2">2</option>
						  <option value="3">3</option>
						</select></li>
					<li><BUTTON class= "popup-button">Add to Cart</BUTTON>
	  		    </ul>
			</div>

		</div>



<div id="sidebar" >

			<h3>Filter:</h3>

			<h4>Medium</h4>
			<label><input type="checkbox" name="color" value="watercolor" /> Watercolor</label>
			<label><input type="checkbox" name="color" value="acrylic" checked="checked" /> Acrylic</label>
			<label><input type="checkbox" name="color" value="oil" checked="checked" /> Oil</label>
			

			<h4>Size (in.)</h4>
			<label><input type="checkbox" name="size" value="s" checked="checked" /> 4x6</label>
			<label><input type="checkbox" name="size" value="m" /> 5x9</label>
			<label><input type="checkbox" name="size" value="l" /> 12x18</label>
			<label><input type="checkbox" name="size" value="xl" /> 20x24</label>

			<h4>Color</h4>
			<label><input type="checkbox" name="size" value="blue" checked="checked" /> Blue</label>
			<label><input type="checkbox" name="size" value="red" /> Red</label>
			<label><input type="checkbox" name="size" value="purple" /> Purple</label>
			<label><input type="checkbox" name="size" value="bw" /> Black & White</label>


			<button class= "sidebar-button" onclick="clearFilters()" >Clear filters</button>
			<button class= "sidebar-button" onclick="sidebarDisappear()">Hide Sidebar</button>
		</div>

		<div id="sidebarButton" >
		<button class="sidebarButt" onclick="sidebarAppear()">View Sidebar</button>
		</div>

