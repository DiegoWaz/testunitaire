<div id="portlet-config" class="modal hide">
    <div class="modal-header">
        <button data-dismiss="modal" class="close" type="button"></button>
        <h3>Widget Settings</h3>
    </div>
    <div class="modal-body"> Widget settings form goes here </div>
</div>
<div class="clearfix"></div>
<div class="content">
    <ul class="breadcrumb">
        <li>
            <p><a href="<?php echo base_url().'back/listNews' ?>">Liste des articles</a></p>
        </li>
        <li><a href="#" class="active"><?php echo $type2; ?> un article</a></li>
    </ul>
    <?php $this->view('back/notifications'); ?>
    
    <div class="clearfix"></div>
    <div class="row">
        <div class="col-md-12">
            <div class="grid simple">
                <div class="grid-title no-border">
                    <h4><?php echo $type2; ?> un article</h4>
                </div>
                <div class="grid-body no-border">
                    <br>
                    <?php
                    echo form_open_multipart('back/formValid'.$type.'News');
                    ?>
                    <div class="row">
                        <div class="col-md-8 col-sm-8 col-xs-8">
                            <div class="col-md-6 col-sm-4 col-xs-12">
                                <div class="form-group">
                                    <label class="form-label">Statut</label>
                                    <div class="controls">
                                        <select name="status" id="status" style="width:100%">
                                            <option
                                                <?php $status = ($type == "edit" AND $news["status"] == "Publié") ? "selected='selected'" : ""; echo $status; ?>
                                                    value="Publié">Publié</option>
                                            <option <?php $status = ($type == "edit" AND $news["status"] == "Brouillon") ? "selected='selected'" : ""; echo $status; ?> value="Brouillon">Brouillon</option>
                                            <option <?php $status = ($type == "edit" AND $news["status"] == "Non Publié") ? "selected='selected'" : ""; echo $status; ?> value="Non publié">Non publié</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-4 col-xs-12">
                                <div class="form-group">
                                    <label class="form-label">Rubrique</label>
                                    <div class="controls">
                                        <select id="rubrique" name="rubrique" style="width:100%">
                                            <?php foreach ($rubrique as $rubriques):?>
                                                <option
                                                    <?php $rub = ($type == "edit" AND $news["rubrique"] == $rubriques['id']) ? "selected='selected'" : ""; echo $rub; ?>
                                                        value="<?php echo $rubriques['id']; ?>">
                                                    <?php echo $rubriques['name']; ?>
                                                </option>
                                            <?php endforeach;?>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="form-group">
                                    <label class="form-label">Titre</label>
                                    <span class="help">Titre de l'article</span>
                                    <div class="controls">
                                        <input name="title" type="text" class="form-control" value="<?php $title = ($type == "edit") ? $news["title"] : ""; echo $title; ?>">
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="form-group">
                                <label class="form-label">Image</label>
                                <div class="grid-body no-border">
                                  <div class="row-fluid">
                                      <div class="fallback">
                                        <?php $image = ($type == "edit") ? $news["image"] : "";?>

                                        <input type="hidden" name="image" id="image" value="<?php echo $image; ?>" />

                                        <div class="col-md-12">
                                            <fieldset>
                                                 <img width="100%" id="img" src="<?php echo $image; ?>" alt="<?php echo $title; ?>" />
                                            </fieldset>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="btn btn-primary" id="popup-1-button" value="<?php echo $image; ?>" />
                                            Upload image
                                            </div>
                                        </div>
                                      </div>
                                  </div>
                                </div>
                            </div>
                            </div>

                        </div>
                        <div class="col-md-4 col-sm-4 col-xs-4">
                            <div class="form-group">
                                <label class="form-label">Date de publication</label>
                                <div class="controls">
                                    <div class="input-append success date no-padding">
                                        <input type="text" name="date" class="form-control" data-date-format="dd/mm/yyyy" 
                                        value="<?php if(isset($news["date"])):
                                            echo date('m/d/Y', $news["date"]);
                                        else:
                                            echo date('m/d/Y', time());
                                        endif; ?>">
                                        <span class="add-on"><span class="arrow"></span><i class="fa fa-th"></i></span>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="form-label">Heure de publication</label>
                                <div class="controls">
                                    <div class="input-group transparent clockpicker">
                                        <input type="text" name="time" class="form-control" placeholder="Heure de publication" value="<?php if(isset($news["date"])):
                                            echo date('h:i', $news["date"]);
                                        else:
                                            echo date("h:i", time());
                                        endif; ?>">
                                        <span class="input-group-addon ">
                                            <i class="fa fa-clock-o"></i>
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="form-label">Auteur de publication</label>
                                <div class="controls">
                                    <select name="author_id[]" id="users" style="width:100%" multiple>
                                        <?php 
                                        foreach ($users as $user):
                                        ?>
                                            <option
                                                <?php
                                                if($type == "edit"):
                                                    foreach ($postUser as $value):
                                                        $us = ($user["id"] == $value) ? "selected='selected'" : ""; echo $us;
                                                    endforeach;
                                                endif;
                                                ?>
                                            value="<?php echo $user["id"]; ?>"><?php echo $user["username"]; ?></option>
                                        <?php
                                        endforeach;
                                        ?>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="form-label">Article en une</label>
                                <div class="row-fluid">
                                    <div class="slide-primary">
                                        <input type="checkbox" name="une" class="ios"
                                        <?php 
                                        if ($type == "edit"):
                                            if($news["une"] == 1):
                                                echo 'checked="checked"';
                                            endif;
                                        endif;
                                        ?>/>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            
                            <div class="form-group">
                                <label class="form-label">Résumé</label>
                                <div class="controls">
                                    <textarea name="resume" placeholder="Enter text ..." class="form-control" rows="3"><?php $resume = ($type == "edit") ? $news["resume"] : ""; echo $resume; ?></textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="form-label">Contenu</label>
                                <div class="controls">
                                    <div class="tools">
                                        <a href="javascript:;" class="collapse"></a>
                                        <a href="#grid-config" data-toggle="modal" class="config"></a>
                                        <a href="javascript:;" class="reload"></a>
                                        <a href="javascript:;" class="remove"></a>
                                    </div>
                                    <textarea name="content" id="content" placeholder="Enter text ..." class="form-control" rows="10"><?php $content = ($type == "edit") ? $news["content"] : ""; echo $content; ?></textarea>
                                </div>
                            </div>
                            <br>
                            <br>
                            <br>
                            <div class="form-group">
                                <div class="admin-bar" id="quick-access" style="bottom: 0px;">
                                    <div class="admin-bar-inner">
                                        <?php
                                        echo form_hidden('idcomment', $idcomment);
                                        echo form_hidden('type_page', "Article");
                                        if($type == "edit"):
                                            echo form_hidden('id', $id);
                                        endif;
                                        ?>
                                        <div class="form-horizontal"></div>
                                        <button class="btn btn-danger btn-cons btn-add"  type="submit"><i class="icon-envelope"></i> Envoyer</button>
                                        <!-- <button class="btn btn-white btn-cons btn-cancel" type="submit">Save</button> -->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <?php echo form_close(); ?>
                </div>
            </div>
        </div>
    </div>
</div>
