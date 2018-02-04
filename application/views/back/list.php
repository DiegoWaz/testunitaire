<div id="portlet-config" class="modal hide">
    <div class="modal-header">
        <button data-dismiss="modal" class="close" type="button"></button>
        <h3>Widget Settings</h3>
    </div>
    <div class="modal-body"> Widget settings form goes here </div>
</div>
<div class="clearfix"></div>
 <?php $this->view('back/notifications'); ?>
<div class="content">
    <ul class="breadcrumb">
        <li>
            <p><a href="<?php echo base_url(); ?>back/rubriqueList">Liste des <?php echo $type; ?>s</a></p>
        </li>
        <li class="active">
            <span class="active">
            <?php
                if ($action == "edit"): 
                    echo "Editer";
                elseif($action == "add"):
                    echo "Ajouter";
                endif;
                echo " une ".$type;
            ?>
            </span>
        </li>
    </ul>
    <div class="page-title">
        <div class="pull-right actions">
            <button class="btn btn-primary btn-cons" type="button" id="btn-new-ticket">
                <?php
                if ($action == "edit"): 
                    echo "Editer";
                elseif($action == "add"):
                    echo "Ajouter";
                endif;
                ?> une <?php echo $type; ?></button>
        </div>
    </div>
    <div class="clearfix"></div>
    <div class="row">
        <div class="col-md-12">
            <div class="grid simple transparent"
            <?php
                if ($action != "edit"): 
                    echo 'id="new-ticket-wrapper" style="display: none;"';
                endif;
                ?> >
                <div class="grid-title no-border">
                    <h4 class="semi-bold">Formulaire</h4>
                </div>
                <div class="grid-body">
                    <?php 
                    echo form_open('back/formList', 'id="new-ticket-form"');
                    ?>
                    <div class="row form-row">
                        <div class="col-md-12">
                            <?php echo form_input($title); ?>
                        </div>
                    </div>
                    <?php
                        if($type == "story"):
                    ?>
                    <div class="row form-row">
                        <div class="col-md-12">
                            <?php echo form_textarea($resume); ?>
                        </div>
                    </div>
                    <?php
                        endif;
                    ?>
                    <div class="row form-row">
                        <div class="col-md-12 margin-top-10">
                            <div class="pull-right">
                                <?php

                                echo form_hidden('type', $type);
                                echo form_hidden('action', $action);
                                
                                if ($action == "edit"): 
                                    echo form_hidden('id', $id);
                                endif;

                                ?>
                                <button class="btn btn-primary btn-cons" type="submit">Envoyer</button>
                            </div>
                        </div>
                    </div>
                    <?php echo form_close(); ?>
                </div>
            </div>
        </div>
    </div>
    <h4>
        <?php
            if ($action == "edit"): 
                echo "Editer";
            elseif($action == "add"):
                echo "Ajouter";
            endif;
            echo " une ".$type;
        ?> <span class="semi-bold"></span></h4>
    <br>
    <div class="row">
        <div class="col-md-12">
            <div class="grid simple ">
                <div class="grid-body no-border">
                    <h3></h3>
                    <table class="table no-more-tables">
                        <thead>
                            <tr class="">
                                <th style="width:9%">Nom</th>
                                <th style="width:22%">Slug</th>
                                <th style="width:6%">Supprimer</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php 
                            foreach ($list as $value):
                            ?>
                            <tr class="">
                                <td class="v-align-middle">
                                    <a href="<?php echo base_url().'back/'.$type.'/'.$value["id"]; ?>"><?php echo $value['name']; ?></a>
                                </td>
                                <td class="v-align-middle">
                                    <span class="muted"><?php echo $value['slug']; ?></span>
                                </td>
                                <td>
                                    <a href="javascript:;" onclick='Confirm("<?php echo $value["id"]; ?>", "<?php echo "".$type.""; ?>", "<?php echo "".$value["name"]."" ?>");' >
                                    <span class="muted"><i class="fa fa-trash"></i> Supprimer</span></a>
                                </td>
                            </tr>
                            <?php 
                            endforeach;
                            ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>