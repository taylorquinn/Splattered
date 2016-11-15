<div id="content">

<h2>Edit profile</h2>

<form id="edit-product" action="<?= BASE_URL ?>/profile/edit/<?= $_SESSION['user'] ?>/process" method="POST">

<label>First Name: <input type="text" name="first_name" value="<?= $product['title'] ?>"></label>

<label>Last Name: <input type="text" name="lsat_name" value = "<?= $product['description'] ?"></label>

<label>Email: <input type="text" name="email" value="<?= $product['sizes'] ?>"></label>

<label>Bio: <input type="text" name="bio" value="<?= $product['price'] ?>"></label>

<label>Password: <input type="text" name="password" value="<?= $product['img_url'] ?>"></label>

<input type="submit" name="submit" class="edit-button2" value="Save Changes">

</form>

</div>
