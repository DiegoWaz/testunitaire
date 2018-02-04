<div class="content sm-gutter">
    <ul class="breadcrumb">
        <li>
            <p>YOU ARE HERE</p>
        </li>
        <li><a href="#" class="active">Liste des articles</a> </li>
    </ul>
    <div class="page-title"> <i class="icon-custom-left"></i>
        <h3>Liste des <span class="semi-bold">articles <?php if (isset($this->slug)): echo "(".$this->slug.")"; endif; ?>
        </span></h3>
        <div class="pull-right actions">
            <a href="<?php echo base_url() ?>back/news" class="btn btn-primary btn-cons">Ajouter un article</a>
        </div>
    </div>
     <?php $this->view('back/notifications'); ?>

    <div class="row hidden-xlg">
                <?php 
                foreach ($list_news as $article):

                    foreach ($list as $rubrique):
                        if($rubrique["id"] == $article['rubrique']):
                            $nameRubrique = $rubrique["name"];
                        endif;
                    endforeach;
               
                ?>
        <div class="col-md-4 col-sm-6">
            <div class="row ">
                <div class="col-md-12 m-b-10">
                    <div class="widget-item ">
                        <div class="tiles green " style="height:320px">
                            <img src="<?php echo base_url().$article["image"]; ?>" alt="">
                            <div class="tiles-body">
                                <h4 class="m-b-30 m-r-20"><a class="text-white" href="editNews/<?php echo $article["id"]; ?>"><?php echo $nameRubrique." : ".$article["title"]; ?></a></h4>
                            </div>
                        </div>
                        <div class="tiles white">
                            <div class="tiles-body">
                                <div class="row">
                                    <div class="user-comment-wrapper pull-left">
                                        <div class="profile-wrapper"> <img src="<?php echo base_url(); ?>assets/back/img/profiles/avatar_small.jpg" alt="" data-src="<?php echo base_url(); ?>assets/back/img/profiles/avatar_small.jpg" data-src-retina="<?php echo base_url(); ?>assets/back/img/profiles/avatar_small2x.jpg" width="35" height="35"> </div>
                                        <div class="comment">
                                            <div class="user-name text-black bold"> Diego <span class="semi-bold">Waziri</span> </div>
                                            <div class="preview-wrapper">@diegowaz75 </div>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="pull-right m-r-20">Date de publication : <span class="bold text-black small-text">
                                        <?php

                                        $datenews = date("d-m-Y", $article["date"]);

                                        if($datenews == $this->today):
                                            echo "Aujourd'hui";
                                        elseif($datenews == $this->yesterday):
                                            echo "Hier";
                                        elseif($datenews == $this->tommorow):
                                            echo "Demain";
                                        else:
                                            echo date("d/m/Y", $article["date"]);
                                        endif;
                                            echo date(" à h:i", $article["date"]);
                                        ?>
                                            
                                        </span></div>
                                    <div class="clearfix"></div>
                                    <div class="p-l-15 p-t-10 p-r-20">
                                        <div class="post p-t-10 p-b-10">
                                            <ul class="action-bar no-margin p-b-20 ">
                                                <li>
                                                    <a href="#" class="<?php if($article["notification"] == 1):
                                                        echo "text-success";
                                                    endif;
                                                    ?> muted bold"><?php echo $article["status"]; ?>
                                                    <i data-toggle='tooltip' title="Statut de l'article" class="fa fa-check-circle-o"></i></a>
                                                </li>
                                                <?php 
                                                if($article["une"] == 1):
                                                    echo "<li><i data-toggle='tooltip' data-placement='right' title='Article en une' class='fa fa-star text-warning'></i></li>";
                                                endif;
                                                ?>
                                                <li>
                                                    <a href="#" class="muted bold">
                                                        <i data-toggle='tooltip' title="Nombre de vues de l'article" class="fa fa-eye"></i>
                                                        <?php echo $article["views"]; ?>
                                                    </a>
                                                </li>
                                                <li>
                                                    <a target="_blank" href="<?php echo base_url()."news/".$article["slug"]; ?>" class="muted bold">
                                                        <i data-toggle='tooltip' title="Lien de l'article" class="fa fa fa-external-link"></i>
                                                    </a>
                                                </li>
                                                <li>
                                                    <a href="javascript:;" onclick='Confirm("<?php echo $article["id"]; ?>", "<?php echo "posts"; ?>", "<?php echo "".$article["title"]."" ?>");' >
                                                        <i data-toggle='tooltip' title='Supprimer' class="fa fa-trash"></i>
                                                    </a>
                                                </li>
                                            </ul>
                                            <div class="clearfix"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <?php 
            endforeach;
        ?>
    </div>
</div>
</div>
