<?php

function isSelected($pn, $link) {
	if($pn == $link) {
		return ' id="selected-nav" ';
	}
}

?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
   <meta name="description" content="Splattered is a site manifesting creativity and aesthetics into a visual commercial interaction between seller and buyer.">
	<title>Splattered | Paintings</title>


	<link rel="stylesheet" type="text/css" href="<?= BASE_URL ?>/public/css/styles.css">
  <script type="text/javascript" src="<?= BASE_URL ?>/public/js/jquery-3.1.0.min.js"></script>
  <script type="text/javascript" src="<?= BASE_URL ?>/public/js/scripts.js"></script>

</head>
<body>
<div id="wrapper">

		<div id="header">
			<div id = "menubar">

			<h1><a href="<?= BASE_URL ?>/"> <img src = "<?= BASE_URL ?>/public/img/logov2.png" alt="SPLATTERED"> </a></img></h1>

				<div id="search">
				<ul id="primary-nav">

					<li><a id="selected-nav" href="<?= BASE_URL ?>/paintings">Paintings</a></li>
					<li><a href="<?= BASE_URL ?>/working">Photographs</a></li>
					<li><a href="<?= BASE_URL ?>/working">Clothing & Accessories</a></li>
					<li><a href="<?= BASE_URL ?>/working">Home & Decor</a></li>
					<li><a href="<?= BASE_URL ?>/blogs">Blog</a></li>
					<li>	<!--  Start of View Cart Button Code  -->
						<form target="_self" action="https://www.paypal.com/cgi-bin/webscr" method="post">
						<!-- If using a Business or Company Logo Graphic, include the "cpp_header_image" variable in your View Cart code. -->
						<input type="hidden" name="cpp_header_image" value="https://yourwebsite.com/logo.jpg"> 
						<input type="hidden" name="cmd" value="_cart">
						<input type="hidden" name="display" value="1">
						<!-- Replace "business" value with your PayPal Email Address or Account ID -->
						<input type="hidden" name="business" value="ktquinn13@gmail.com">
						<!-- Replace value with the web page you want the customer to return to -->
						<input type="hidden" name="shopping_url" value="http://www.splattered.me/Splattered">
						<input type="image"  src="<?= BASE_URL ?>/public/img/cart.jpg" border="0" name="submit" style="width:15px" alt="View Cart">
						<img alt="" border="0" src="https://www.paypalobjects.com/en_US/i/scr/pixel.gif" width="1" height="1">
						</form> 
						<!--  End of View Cart Button Code  -->
					</li>
					<!--<li><a href="<?= BASE_URL ?>/checkout"> <img class = "cart_icon" src="<?= BASE_URL ?>/public/img/cart.jpg"></a></li>-->
					<li><input type="text" placeholder="Search products" /> <button>Go</button></li>
				</ul>

				</div>
			</div>



		</div>



</div>



<!--IMAGE CITATIONS!!!-->
<!--CHECKOUT HEADER: edited from the image found here: http://65.media.tumblr.com/61e836107d470bccfdd94b649af51e1c/tumblr_n2ppvtiBIL1r46cs4o1_1280.jpg-->


<!--HOME PAGE IMAGES-->
<!--Accessories tile: edited from the image found here: https://www.google.com/search?sa=G&hl=en&q=side+braid&tbm=isch&tbs=simg:CAQSlQEJoIMPJccrmF0aiQELEKjU2AQaAggDDAsQsIynCBpiCmAIAxIo6RmGD7cPyhnJELQPoQ_1UEIoP1w_1eMNkw3zDgMOEwyCXiMPM71S7bMBowfjlhgnYthk6MjBxNqmzMtdnOX039F_18vRhoU7RcO-UtPcjMMStEtTzbhNEEa_1j24IAQMCxCOrv4IGgoKCAgBEgQ_1pMqMDA&ved=0ahUKEwjt1MnGia7PAhXEez4KHQD9CHgQwg4IGygA-->
<!--Paintings tile: edited from the image found here: https://lh3.googleusercontent.com/OCWLteVrjHjzDUVIRRIbIrbYZuYXXzTSz0a0akUn0V1u4WPICt3dmR8X28sen953deeSTFQ=s85-->
<!--Home Decor tile: edited from the image found here: https://lh3.googleusercontent.com/7S9F_10_tSqAwFJNUV3a0KJ0e8c-XZxTp_hxWP-DBHmocVRL7yXbwzIrLPCJjm-zgLdRmA=s85-->

 <!--Shop Favorites banner- edited from the image found here:  https://www.google.com/imgres?imgurl=http%3A%2F%2F67.media.tumblr.com%2Fac1a5aee391576c9bb410bd93d57550e%2Ftumblr_ndx3yvFet41qc91i1o1_1280.jpg&imgrefurl=http%3A%2F%2Fartistandstudio.tumblr.com%2Fpage%2F3&docid=Eun42Gye6mFtzM&tbnid=CmwQOamtM-yBFM%3A&w=1000&h=667&hl=en&bih=475&biw=1262&ved=0ahUKEwj__fKDia7PAhXEFj4KHZODDX0QMwgfKAEwAQ&iact=mrc&uact=8 -->



<!--FOOTER IMAGES-->
<!--Facebook logo: https://lh3.googleusercontent.com/jDhF56HdcROR2DOBcxL_yTwWU1SUz-Xlb7BLZ6cjzYftSxN-uzIdHosDdPeVL1grUy9piA=s85-->
<!--Twitter logo: https://lh3.googleusercontent.com/-EtGHtc8v9V5jC5Gf4N3XPA4PEf6WmjW11XzBaOHNTwRQc9Cbb09oXmfJj-c9_VN02LoCRY=s105-->
<!--Instagram logo: https://lh3.googleusercontent.com/-q1QAZFDTm6cTLfoI8prYuSryvmZZ-RK32gMFvMu4q3rhaAw-i44yYD2oL8HX0jUslww=s85-->
<!--Pinterest logo: https://lh3.googleusercontent.com/TtM5NxnMFGPYvJq5z-Zjy4T6bbck9TuPDbGPWbokYR9q7ypADiFk_LufgEtgR8WSMrMa=s85-->


<!--PAINTINGS IMAGES-->
<!--HEADER: edited from the image found here : https://www.google.com/search?sa=G&hl=en&q=artist&tbm=isch&tbs=simg:CAQSlQEJSsxSEGfzGFkaiQELEKjU2AQaAggJDAsQsIynCBpiCmAIAxIo2R7PHqgenRGxHtoemxirGOIX5he6MKg5rTqzOa464i64K8Ustyv2IxowRaiO3cGgZwBmpQTEHTrNUqIFrkX1EZn8o34eFEPhc9X9Kji-uZOU47uqfZdoB_1DDIAQMCxCOrv4IGgoKCAgBEgQToChmDA&ved=0ahUKEwiohYfXia7PAhXDPz4KHUQ0DH8Qwg4IGygA -->
<!--ALL FOR SALE IMAGES ARE MY OWN PICTURES/ ARTWORK-->
