<?php if($this->session->flashdata('success')): ?>
<div class="alert alert-success fade in">
    <a href="#" class="close" data-dismiss="alert"></a>
    <?php echo $this->session->flashdata('success'); ?>
</div>
<?php elseif($this->session->flashdata('error')):  ?>
<div class="alert alert-error fade in">
    <a href="#" class="close" data-dismiss="alert"></a>
    <?php echo $this->session->flashdata('error'); ?>
</div>
<?php elseif($this->session->flashdata('warning')):  ?>

<div class="alert alert-warning fade in">
    <a href="#" class="close" data-dismiss="alert"></a>
    <?php echo $this->session->flashdata('warning'); ?>
</div>
<?php elseif($this->session->flashdata('info')):  ?>

<div class="alert alert-info fade in">
    <a href="#" class="close" data-dismiss="alert"></a>
    <?php echo $this->session->flashdata('info'); ?>
</div>
<?php endif; ?>