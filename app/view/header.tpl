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
	<title>Splattered</title>


	<link rel="stylesheet" type="text/css" href="<?= BASE_URL ?>/public/css/styles.css">
  <link rel="stylesheet" type="text/css" href="<?= BASE_URL ?>/public/css/bubble.css">
  <script type="text/javascript">
		var baseURL = '<?= BASE_URL ?>';
	</script>
  <script type="text/javascript" src="<?= BASE_URL ?>/public/js/jquery-3.1.0.min.js"></script>
  <script type="text/javascript" src="<?= BASE_URL ?>/public/js/d3.v4.min.js"></script>
  <script type="text/javascript" src="<?= BASE_URL ?>/public/js/bubble.js"></script>
  <script type="text/javascript" src="<?= BASE_URL ?>/public/js/scripts.js"></script>
	<link rel="icon" type="image/vnd.microsoft.icon" href="<?= BASE_URL ?>/public/img/favicon.ico" />
</head>
<body>
<div id="wrapper">

		<div id="header" style="margin-top:-15px">
			<div id = "menubar">

			<h1><a href="<?= BASE_URL ?>/"> <img src = "<?= BASE_URL ?>/public/img/logov2.png" alt="SPLATTERED"> </a></img></h1>

				<div id="search">
				<ul id="primary-nav" style= "font-size: 15px;">

					<li><a href="<?= BASE_URL ?>/paintings">Paintings</a></li>
					<li><a href="<?= BASE_URL ?>/photographs">Photographs</a></li>
					<!--<li><a href="<?= BASE_URL ?>/working">Clothing & Accessories</a></li>-->
					<!--<li><a href="<?= BASE_URL ?>/working">Home & Decor</a></li>-->
					<li><a href="<?= BASE_URL ?>/blogs">Blog</a></li>

					<?php if(isset($_SESSION['user']) && $_SESSION['user'] != '') { ?>
					<li><a href="<?= BASE_URL ?>/profile/<?= $_SESSION['user'] ?>">Profile</a></li>
					<?php } ?>


					<li>	<!--  Start of View Cart Button Code  -->
						<form target="_self" action="https://www.paypal.com/cgi-bin/webscr" style="width: 20px; display: inline; padding-top: 20px;" method="post">
						<!-- If using a Business or Company Logo Graphic, include the "cpp_header_image" variable in your View Cart code. -->
							<input type="hidden" name="cpp_header_image" value="https://yourwebsite.com/logo.jpg">
							<input type="hidden" name="cmd" value="_cart">
							<input type="hidden" name="display" value="1">
							<!-- Replace "business" value with your PayPal Email Address or Account ID -->
							<input type="hidden" name="business" value="ktquinn13@gmail.com">
							<!-- Replace value with the web page you want the customer to return to -->
							<input type="hidden" name="shopping_url" value="http://www.splattered.me/Splattered">
							<input type="image"  src="<?= BASE_URL ?>/public/img/cart.jpg" border="0" style="width: 20px;" name="submit" alt="View Cart">
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


<div id="citations">
	<!--IMAGE CITATIONS!!!-->

	<!--ALL IMAGES ARE EITHER MY OWN, OR FREE STOCK IMAGES FOUND ON PEXEL.XCOM-->


	<!--CHECKOUT HEADER: edited from the image found here: http://65.media.tumblr.com/61e836107d470bccfdd94b649af51e1c/tumblr_n2ppvtiBIL1r46cs4o1_1280.jpg-->


	<!--HOME PAGE IMAGES-->
	


	<!--FOOTER IMAGES-->
	<!--Facebook logo: https://lh3.googleusercontent.com/jDhF56HdcROR2DOBcxL_yTwWU1SUz-Xlb7BLZ6cjzYftSxN-uzIdHosDdPeVL1grUy9piA=s85-->
	<!--Twitter logo: https://lh3.googleusercontent.com/-EtGHtc8v9V5jC5Gf4N3XPA4PEf6WmjW11XzBaOHNTwRQc9Cbb09oXmfJj-c9_VN02LoCRY=s105-->
	<!--Instagram logo: https://lh3.googleusercontent.com/-q1QAZFDTm6cTLfoI8prYuSryvmZZ-RK32gMFvMu4q3rhaAw-i44yYD2oL8HX0jUslww=s85-->
	<!--Pinterest logo: https://lh3.googleusercontent.com/TtM5NxnMFGPYvJq5z-Zjy4T6bbck9TuPDbGPWbokYR9q7ypADiFk_LufgEtgR8WSMrMa=s85-->


	<!--PAINTINGS IMAGES-->
	<!--HEADER: edited from the image found here : https://www.google.com/search?sa=G&hl=en&q=artist&tbm=isch&tbs=simg:CAQSlQEJSsxSEGfzGFkaiQELEKjU2AQaAggJDAsQsIynCBpiCmAIAxIo2R7PHqgenRGxHtoemxirGOIX5he6MKg5rTqzOa464i64K8Ustyv2IxowRaiO3cGgZwBmpQTEHTrNUqIFrkX1EZn8o34eFEPhc9X9Kji-uZOU47uqfZdoB_1DDIAQMCxCOrv4IGgoKCAgBEgQToChmDA&ved=0ahUKEwiohYfXia7PAhXDPz4KHUQ0DH8Qwg4IGygA -->
	<!--ALL FOR SALE IMAGES ARE MY OWN PICTURES/ ARTWORK-->

	<!--people profpics-->
	<!--JohnnyDepp- https://www.google.com/url?sa=i&rct=j&q=&esrc=s&source=images&cd=&cad=rja&uact=8&ved=0ahUKEwjp5LCH_6vQAhXCzFQKHfqnC7wQjRwIBw&url=%2Furl%3Fsa%3Di%26rct%3Dj%26q%3D%26esrc%3Ds%26source%3Dimages%26cd%3D%26cad%3Drja%26uact%3D8%26ved%3D0ahUKEwjp5LCH_6vQAhXCzFQKHfqnC7wQjRwIBw%26url%3Dhttp%253A%252F%252Fwww.mirror.co.uk%252F3am%252Fcelebrity-news%252Fjohnny-depp-rolling-stone-interview-1969098%26bvm%3Dbv.138493631%2Cd.ZGg%26psig%3DAFQjCNGq0Ss7eChjKWGS3ibxCO-mRnR_vw%26ust%3D1479341586024173&bvm=bv.138493631,d.ZGg&psig=AFQjCNGq0Ss7eChjKWGS3ibxCO-mRnR_vw&ust=1479341586024173-->


</div>
