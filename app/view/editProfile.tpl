<div id="content">

<h2>Edit profile</h2>

<form id="edit-product" action="<?= BASE_URL ?>/profile/edit/<?= $_SESSION['user'] ?>/process" method="POST">

<label>First Name: <input type="text" name="first_name" value="<?= $u->get('first_name') ?>"></label>

<label>Last Name: <input type="text" name="lsat_name" value = "<?= $u->get('last_name') ?>"></label>

<label>Password: <input type="text" name="password" value="<?= $u->get('pw') ?>"></label>

<label>Email: <input type="text" name="email" value="<?= $u->get('email') ?>"></label>

<label>Bio: <input type="text" name="bio" value="<?= $u->get('bio') ?>"></label>

<label>Age: <input type="text" name="age" value="<?= $u->get('age') ?>"></label>

<label>Profile Picture: <input type="text" name="profpic" value="<?= $u->get('profpic') ?>"></label>

<input type="submit" name="submit" class="edit-button2" value="Save Changes">

</form>

</div>
