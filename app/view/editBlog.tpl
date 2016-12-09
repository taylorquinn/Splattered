<div id="content">

<h2>Edit Blog <?= $b->get('title') ?></h2>

<!-- allow the user to edit their name, password, email, bio and age -->

<form id="edit-product" action="<?= BASE_URL ?>/blogs/edit/<?= $b->get('id') ?>/process" method="POST">

<label>First Name: <input type="text" name="title" value="<?= $b->get('title') ?>"></label>

<label>Last Name: <input type="text" name="description" value = "<?= $b->get('description') ?>"></label>

<label>Password: <input type="text" name="image_url" value="<?= $b->get('image_url') ?>"></label>

<label>Email: <input type="text" name="full_post" value="<?= $b->get('full_post') ?>"></label>

</form>

</div>
