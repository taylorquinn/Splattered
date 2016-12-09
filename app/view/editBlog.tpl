<div id="content">

<h2>Edit Blog <?= $b->get('title') ?></h2>

<!-- allow the user to edit their name, password, email, bio and age -->

<form id="edit-product" action="<?= BASE_URL ?>/blogs/edit/<?= $b->get('id') ?>/process" method="POST">

<label>Title: <input type="text" name="title" value="<?= $b->get('title') ?>"></label>

<label>Brief Description: <textarea rows="3" name="description" value= "<?= $b->get('description') ?>"></textarea></label>

<label>Image URL: <input type="text" name="image_url" value="<?= $b->get('image_url') ?>"></label>

<label>Full Post: <textarea rows="10" name="full_post" value="<?= $b->get('full_post') ?>"></textarea></label>

<input type="submit" name="submit" class="edit-button2" value="Save Changes">

</form>

</div>
