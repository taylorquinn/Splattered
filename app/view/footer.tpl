<div id="footer">


		<ul id="footerelements">
			<li><a href="https://www.instagram.com"><img class="icon" src="<?= BASE_URL ?>/public/img/instagram.png" alt="INSTA" /></a>  <a href="https://www.pinterest.com"><img class="icon" src="<?= BASE_URL ?>/public/img/pinterest.png" alt="PINTEREST" /></a> <a href="https://www.facebook.com"><img class="icon" src="<?= BASE_URL ?>/public/img/facebook.png" alt="FACEBOOK" /></a>  <a href="https://www.twitter.com"><img class="icon" src="<?= BASE_URL ?>/public/img/twitter.png" alt="TWITTER" /></a> </li>

			<!--Facebook logo: https://lh3.googleusercontent.com/jDhF56HdcROR2DOBcxL_yTwWU1SUz-Xlb7BLZ6cjzYftSxN-uzIdHosDdPeVL1grUy9piA=s85-->
			<!--Twitter logo: https://lh3.googleusercontent.com/-EtGHtc8v9V5jC5Gf4N3XPA4PEf6WmjW11XzBaOHNTwRQc9Cbb09oXmfJj-c9_VN02LoCRY=s105-->
			<!--Instagram logo: https://lh3.googleusercontent.com/-q1QAZFDTm6cTLfoI8prYuSryvmZZ-RK32gMFvMu4q3rhaAw-i44yYD2oL8HX0jUslww=s85-->
			<!--Pinterest logo: https://lh3.googleusercontent.com/TtM5NxnMFGPYvJq5z-Zjy4T6bbck9TuPDbGPWbokYR9q7ypADiFk_LufgEtgR8WSMrMa=s85-->
			<!-- <li><input type="text2" placeholder="Enter your email address" /> <button>Sign Up!</button></li> -->


      <!-- If the user is logged in -->
			<?php if( !isset($_SESSION['user']) || $_SESSION['user'] == '') {


			?>


			<li id="footer_list"><a href='<?= BASE_URL ?>/'>Home</a> | <a href='<?= BASE_URL ?>/working'>About Us</a> | <a href='<?= BASE_URL ?>/working'>Shipping & Returns</a> | <a href='<?= BASE_URL ?>/working'>Terms & Conditions</a> | <a onclick="signupAppear()"><u name = "sign_up">Sign up</u></a> | <a onclick="loginAppear()"><u name = "log_in">Log in </u></a> </li>

      <!-- If the user is an admin -->
			<?php }

			else {
        $p = User::loadByUsername($_SESSION['user']);

        if($p->get('status') == 2) {


			?>


			<li id="footer_list"><a href='<?= BASE_URL ?>/'>Home</a> | <a href='<?= BASE_URL ?>/working'>About Us</a> | <a href='<?= BASE_URL ?>/working'>Shipping & Returns</a> | <a href='<?= BASE_URL ?>/working'>Terms & Conditions</a> | <a onclick="location.href='<?= BASE_URL ?>/add'"><u name = "add_item">Add Item</u></a> | <a onclick="logoutAppear()"><u name = "log_in">Log out</u></a> </li>

      <!-- Default footer -->
			<?php }

			else {?>


			<li id="footer_list"><a href='<?= BASE_URL ?>/'>Home</a> | <a href='<?= BASE_URL ?>/working'>About Us</a> | <a href='<?= BASE_URL ?>/working'>Shipping & Returns</a> | <a href='<?= BASE_URL ?>/working'>Terms & Conditions</a> | <a onclick="logoutAppear()"><u name = "log_in">Log out</u></a> </li>

			<?php }} ?>

		</ul>
		</div>

    <!-- Popup for user to login -->
		<div id="myLoginPopup" class="popup">

 			<div class="popup-content">
	  		    <span class="close" onclick="loginClose()">×</span>
	  		    <form  action="<?= BASE_URL ?>/footer/login" method="POST">
	  		    <h2>Log in:</h2>
				  Username:<br>
				  <input type="text" name="un" placeholder="username" required>

				  <br>
				  Password:<br>
				  <input type="password" name="pw" placeholder="********" required>
				  <br><br>
				  <input type="submit" value="Submit" >
				</form>


			</div>

		</div>


    <!-- Popup for user to sign up -->
    <div id="mySignupPopup" class="popup">
 			<div class="popup-content">
  		    <span class="close" onclick="signupClose()">×</span>
  		    <form  action="<?= BASE_URL ?>/footer/signup" method="POST">
    		    <h2>Sign up:</h2>
            First Name:<br>
  				      <input type="text" name="fname" placeholder="Bobby" required>
  				  <br>
            Last Name:<br>
  				      <input type="text" name="lname" placeholder="Kins" required>
  				  <br>
            Username:<br>
  				      <input type="text" name="un" placeholder="username" required>
  				  <br>
  				  Password:<br>
  				      <input type="password" name="pw" placeholder="********" required> 
  				  <br>
            Confirm Password:<br>
  				      <input type="password" name="confirmpw" placeholder="********" required>
  				  <br>
            Email Address:<br>
  				      <input type="email" name="email" placeholder="test@gmail.com" required>

						<br>
						Age:<br>
						<select name="age">
							<?php for ($i = 5; $i <= 99; $i++) : ?>
									<option value="<?php echo $i; ?>"><?php echo $i; ?></option>
							<?php endfor; ?>
					</select>
  				  <br><br>
  				  <input type="submit" value="Submit" >
				</form>


			</div>

		</div>

    <!-- Popup to logout -->
		<div id="myLogoutPopup" class="popup">

 			<div class="popup-content">
	  		    <span  class= "close" onclick="logoutClose()">×</span>

	  		    <form  action="<?= BASE_URL ?>/footer/logout" method="POST">
	  		    <h2>Are you sure you want to log out?</h2>

				  <input class = "close" type="submit" value="Log me out" >

				</form>

 				 <button class="close" onclick="logoutClose()">Cancel</button>


			</div>

		</div>

	</div>

</body>
</html>
