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
            <p>Article</p>
        </li>
        <li><a href="#" class="active">Liste des articles à rédiger</a></li>
    </ul>
    <div class="page-title"> <i class="icon-custom-left"></i>
        <h3>Support</h3>
        <div class="pull-right actions">
            <button class="btn btn-primary btn-cons" type="button" id="btn-new-ticket">Ajouter un article</button>
        </div>
    </div>
    <div class="clearfix"></div>
    <div class="row">
        <div class="col-md-12">
            <div class="grid simple transparent" id="new-ticket-wrapper" style="display: none;">
                <div class="grid-title no-border">
                    <h4 class="semi-bold">Formulaire</h4>
                </div>
                <div class="grid-body">
                    <?php 
                    echo form_open('back/formValidTodoList', 'id="new-ticket-form"');
                    ?>
                    <div class="row form-row">
                        <div class="col-md-12">
                            <?php echo form_input($title); ?>
                        </div>
                    </div>                    
                    <div class="row form-row">
                        <div class="col-md-12">
                            <?php echo form_input($link); ?>
                        </div>
                    </div>
                    <div class="row form-row">
                        <div class="col-md-12">
                            <?php echo form_textarea($comment); ?>
                        </div>
                    </div>
                    <div class="row form-row">
                        <div class="col-md-12">
                            <div class="slide-primary">
                                <label>Important ?</label>
                                Oui : <?php echo form_radio($oui); ?><br>
                                Non : <?php echo form_radio($non); ?>
                            </div>
                        </div>
                    </div>
                    <div class="row form-row">
                        <div class="col-md-12 margin-top-10">
                            <div class="pull-right">
                                <button class="btn btn-primary btn-cons" type="submit">Envoyer</button>
                                <?php echo form_hidden('id_pseudo', '2'); ?>
                            </div>
                        </div>
                    </div>
                    <?php echo form_close(); ?>
                </div>
            </div>
        </div>
    </div>

    <?php foreach ($status as $st):?>
        <h4>Article <span class="semi-bold">
            <?php
            if ($st == "wip"){
                echo 'en cours';
            } elseif ($st == "todo") {
                echo 'à faire';
            } elseif ($st == "close") {
                echo 'déjà fait';
            }
            ?>
        </span></h4>
        <br>
        <div class="row">
            <?php
            foreach (${$st} as $todolist):
                ?>
                <div class="col-md-12">
                    <div class="grid simple no-border">
                        <div class="grid-title no-border descriptive clickable">
                            <h4 class="semi-bold">
                                <?php
                                $id_pseudo = 2;

                                $dateCreate = new DateTime($todolist["created_at"]);
                                $timeCreate = $dateCreate->getTimestamp();                                

                                $dateUpdated = new DateTime($todolist["updated_at"]);
                                $timeUpdated = $dateUpdated->getTimestamp();

                                $now = 'Europe/Paris';
                                $units = 2;

                                if ($st == "todo" && $todolist["important"] == 1):
                                    echo '<span class="label label-important">IMPORTANT</span> '.$todolist["title"];

                                elseif($st == "wip" or $st == "close"):
                                    echo '<span class="label label-info">'.$this->user_model->get_user_pseudo_from_id($todolist["id_pseudo_write"]).'</span> '.$todolist["title"].' ('.timespan($timeUpdated, $now, $units).')';
                                else:
                                    echo $todolist["title"];
                                endif; 
                                ?>
                            </h4>
                            <h4>
                                <a href="<?php echo $todolist["link"]; ?>" target="_blank">
                                    <?php echo $todolist["link"]; ?>
                                </a>
                            </h4>
                            <p>
                                <span class="text-success bold">Ticket #<?php echo $todolist["id"]; ?></span> - Crée il y a 
                                <?php echo timespan($timeCreate, $now, $units); ?> par <?php echo $this->user_model->get_user_pseudo_from_id($todolist["id_pseudo"]);
                                ?>
                            </p>
                            <div class="actions">
                                <?php 
                                if ($st == "todo") {

                                    echo form_open('back/news', 'id="form'.$todolist["id"].'"');
                                    echo form_hidden('id_pseudo', $id_pseudo);
                                    echo form_hidden('id_comment', $todolist["id"]);
                                    echo '<a class="check" type="submit" data-comment="'.$todolist["id"].' "href="#"><i class="fa fa-check"></i></a></form>';

                                    echo form_open('back/formDelete', 'id="formDelete'.$todolist["id"].'"');
                                    echo form_hidden('id_pseudo', $id_pseudo);
                                    echo form_hidden('id_comment', $todolist["id"]);
                                    echo '<a type="submit" class="close" data-comment="'.$todolist["id"].'" href="#"><i class="fa fa-times"></i></a></form>';

                                } elseif($st == "wip" && $todolist["id_pseudo_write"] == 2) {

                                    echo form_open('back/formClose', 'id="formClose'.$todolist["id"].'"');
                                    echo form_hidden('id_pseudo', $id_pseudo);
                                    echo form_hidden('id_comment', $todolist["id"]);
                                    echo '<a type="submit" href="news"><i class="fa fa-edit"></i></a>
                                    <a type="submit" class="remove" data-comment="'.$todolist["id"].'" href="#"><i class="fa fa-times"></i></a></form>';
                                }
                                ?>
                            </div>
                        </div>
                        <div class="grid-body no-border" style="display: none;">
                            <div class="post">
                                <div class="user-profile-pic-wrapper">
                                    <div class="user-profile-pic-normal">
                                        <img width="35" height="35" data-src-retina="<?php echo base_url(); ?>assets/back/img/profiles/avatar_small2x.jpg" data-src="<?php echo base_url(); ?>assets/back/img/profiles/avatar_small.jpg" src="<?php echo base_url(); ?>assets/back/img/profiles/avatar_small.jpg" alt="">
                                    </div>
                                </div>
                                <div class="info-wrapper">
                                    <div class="info"><?php echo htmlspecialchars($todolist["comment"]); ?></div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                            <br>
                            <div class="form-actions">
                                <?php
                                $listReplyComments = $this->news_model->get_replytodolist($todolist["id"]);

                                foreach ($listReplyComments as $comment):
                                    ?>
                                    <div class="post col-md-12">
                                        <div class="user-profile-pic-wrapper">
                                            <div class="user-profile-pic-normal"> <img width="35" height="35" data-src-retina="<?php echo base_url(); ?>assets/back/img/profiles/c2x.jpg" data-src="<?php echo base_url(); ?>assets/back/img/profiles/c.jpg" src="<?php echo base_url(); ?>assets/back/img/profiles/c.jpg" alt=""> </div>
                                        </div>
                                        <div class="info-wrapper">
                                            <div class="info"><?php echo htmlspecialchars($comment["replycomment"]); ?>
                                                <p class="small-text">Posté à <?php echo date("d/m/Y à H:i", $comment["date"]); ?></p>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                <?php endforeach; ?>
                                <div class="form-group">
                                    <div class="controls">
                                        <?php 
                                        echo form_open('back/formValidReplyTodoList');
                                        echo form_input($replyComments);
                                        echo form_hidden('id_pseudo', $id_pseudo);
                                        echo form_hidden('id_comment', $todolist["id"]);
                                        echo form_close();
                                        ?>
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </div>
                </div>      
                <?php 
            endforeach;
            ?>
        </div>
        <?php
    endforeach;
    ?>
</div>
