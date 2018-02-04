<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html;charset=UTF-8" />
    <meta charset="utf-8" />
    <title><?php echo $this->title; ?></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta content="<?php echo $this->description; ?>" name="description" />
    <meta content="" name="author" />
    <!-- BEGIN PLUGIN CSS -->
    <?php foreach ($dependenciesCSS as $depCSS): ?>
    <link href="<?php echo base_url(); ?>assets/back/<?php echo $depCSS; ?>" rel="stylesheet" type="text/css" />
    <?php endforeach; ?>

    <?php foreach ($requireCSS as $css): ?>
    <link href="<?php echo base_url(); ?>assets/back/<?php echo $css; ?>" rel="stylesheet" type="text/css" />
    <?php endforeach; ?>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">
</head>

<body class="">
    <?php $this->view('back/menu'); ?>
    <?php $this->view('back/sidebar'); ?>
    <div class="page-content">
        <?php echo $output; ?>
    </div>
</div>

<?php foreach ($dependenciesJS as $depJS): ?>
    <script src="<?php echo base_url(); ?>assets/back/<?php echo $depJS; ?>" type="text/javascript"></script>
<?php endforeach; ?>

<?php foreach ($requirejs as $js): ?>
    <script src="<?php echo base_url(); ?>assets/back/<?php echo $js; ?>" type="text/javascript"></script>
<?php endforeach; ?>
<script src="<?php echo base_url(); ?>assets/back/js/ckeditor/ckeditor.js"></script>
<script src="<?php echo base_url(); ?>assets/back/js/ckfinder/ckfinder.js"></script>
</body>
</html>