

		<img class="head-image" src="<?= BASE_URL ?>/public/img/checkout12.jpg" alt="Header image" />
		<!--edited from the image found here: http://65.media.tumblr.com/61e836107d470bccfdd94b649af51e1c/tumblr_n2ppvtiBIL1r46cs4o1_1280.jpg-->



			<div id="content">

				<h2>Check Out</h2>

				<form id="checkout" action="" method="POST">

				<label>First name: <input type="text" name="first_name"></label>
				<label>Last name: <input type="text" name="last_name"></label>
				<label>Address: <input type="text" name="address"></label>
				<label>City: <input type="text" name="city"></label>
				<label>State:
					<select name="state">
						<option value="AK">Alaska</option>
						<option value="NY">New York</option>
						<option value="VA" selected="selected">Virginia</option>
					</select>
				</label>
				<label>ZIP Code: <input type="text" name="zip"></label>

			<!--	<input type="submit" name="submit" value="Submit" class="checkout-button">-->
				</form>

        <form action="/cs3744/Splattered/app/controller/paypal_ec_redirect.php" method="POST">
          <input type="hidden" name="PAYMENTREQUEST_0_AMT" value="10.00"></input>
          <input type="hidden" name="currencyCodeType" value="USD"></input>
          <input type="hidden" name="paymentType" value="Sale"></input>
          <!--Pass additional input parameters based on your shopping cart. For complete list of all the parameters click here -->
          <input type="image" src="https://www.paypalobjects.com/webstatic/en_US/i/buttons/checkout-logo-large.png" alt="Check out with PayPal"></input>
        </form>


			</div>

<div id="sidebar">



</div>
