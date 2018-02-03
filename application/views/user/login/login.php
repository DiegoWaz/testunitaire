<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>
<div class="kode-subheader subheader-height">
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<h1>Connexion</h1>
			</div>
			<div class="col-md-6">
				<ul class="kode-breadcrumb">
					<li><a href="#">Accueil</a></li>
					<li><a href="#">Connexion</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>
    
<div class="container">
	<div class="row">
		<?php if (validation_errors()) : ?>
			<div class="col-md-12">
				<div class="alert alert-danger" role="alert">
					<?= validation_errors() ?>
				</div>
			</div>
		<?php endif; ?>
		<?php if (isset($error)) : ?>
			<div class="col-md-12">
				<div class="alert alert-danger" role="alert">
					<?= $error ?>
				</div>
			</div>
		<?php endif; ?>
		<div class="col-md-12">
			<?php if (!isset($_SESSION['logged_in'])) : ?> 
			<div class="page-header">
				<h1>Se connecter</h1>
			</div>
			<?= form_open() ?>
				<div class="form-group">
					<label for="username">Pseudo</label>
					<input type="text" class="form-control" id="username" name="username" placeholder="Ton pseudo">
				</div>
				<div class="form-group">
					<label for="password">Mot de passe</label>
					<input type="password" class="form-control" id="password" name="password" placeholder="Ton mot de passe">
				</div>
				<div class="form-group">
					<input type="submit" class="btn btn-default" value="Login">
				</div>
			</form>

		<?php else: ?>
			<div class="page-header">
				<h1>Déjà connecté !</h1>
			</div>
			<p>Vous êtes déjà connecté</p>
		<?php endif; ?>
		</div>
	</div><!-- .row -->
</div><!-- .container -->


