<div class="kode-subheader subheader-height">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <h1>Article</h1>
            </div>
            <div class="col-md-6">
                <ul class="kode-breadcrumb">
                    <li><a href="#">Accueil</a></li>
                    <li><a href="#"><?php echo $rubrique; ?></a></li>
                    <li><a href="#"><?php echo $title; ?></a></li>
                </ul>
            </div>
        </div>
    </div>
</div>
<!--// SubHeader //-->
<div class="kode-content">
    <section class="kode-pagesection" id="contentsWrapper">
        <div class="container">
            <div class="row kcontent">
                <div class="col-md-1"></div>
                <div class="kode-pagecontent col-md-10">
                    <div class="kcontent">
                        <div class="kode-blog-list kode-fullwidth-blog">
                                <ul class="row">
                                    <li class="col-md-12">
                                        <div class="kode-time-zoon">
                                            <h1><?php echo $title; ?></h1>
                                        </div>
                                        <figure>
                                            <img src="<?php echo $image; ?>" alt="<?php echo $title; ?>">
                                        </figure>
                                        <div class="kode-blog-info">
                                            <ul class="kode-blog-options">
                                                <li>
                                                    <time datetime="<?php echo date("Y-m-d h:i:s", $date); ?>">
                                                        <?php echo date("d M Y à H:i", $date); ?>
                                                    </time>
                                                </li>
                                                <li>
                                                    <a href="#"><i class="fa fa-heart"></i>5 j'aime</a>
                                                </li>
                                                <li>
                                                    <i class="fa fa-eye"></i> <?php echo $views; ?> vues
                                                </li>
                                                <li>
                                                    <a href="#"><i class="fa fa-warning"></i>Signaler une erreur</a>
                                                </li>
                                            </ul>
                                            <ul class="kode-team-network">
                                                <li>
                                                    <a target="_blank" class="fa fa-facebook" href="http://www.facebook.com/sharer.php?u=<?php echo base_url(); ?>news/view/<?php echo $slug; ?>"></a>
                                                </li>
                                                <li>
                                                    <a target="_blank" class="fa fa-twitter" href="https://twitter.com/intent/tweet?text=<?php echo $title; ?> @LMDPSG <?php echo base_url(); ?>news/view/<?php echo $slug; ?>"></a>
                                                </li>
                                                <li>
                                                    <a target="_blank" class="fa fa-google-plus" href="https://plus.google.com/share?url=<?php echo base_url(); ?>news/view/<?php echo $slug; ?>"></a>
                                                </li>
                                                <li>
                                                    <a target="_blank" class="fa fa-linkedin" href="https://www.linkedin.com/shareArticle?mini=true&url=news/view/<?php echo $slug; ?>&title=<?php echo $title; ?>&summary=<?php echo $resume; ?>&source=LMDPSG"></a>
                                                </li>
                                            </ul>
                                        </div>
                                    </li>
                                </ul>
                        </div>
                        <div class="kode-editor">
                            <strong><?php echo $resume; ?></strong>
                            <p><?php echo $content; ?></p>
                        </div>
                        <div class="kode-admin-post">
                            <figure><a href="#"><img src="<?php echo base_url()."assets/images/users/neymar.jpg"; ?>" alt=""></a></figure>
                            <div class="admin-info">
                                <p>Etudiant développeur full-stack, Rédacteur et recruteur pour Le Meilleur du PSG</p>
                                <h4><a href="#" class="thcolor">Diego Waziri</a> <span class="thcolor">Administrateur</span></h4>
                            </div>
                        </div>
                    </div>

                    <div class="kode-postsection">
                        <h4 class="kode-prev"><a href="<?php echo $previous['slug']; ?>" class="thcolorhover"><i class="fa fa-long-arrow-left"></i> <?php echo $previous['title']; ?></a></h4>
                        <h4 class="kode-next"><a href="<?php echo $next['slug']; ?>" class="thcolorhover"><?php echo $next['title']; ?> <i class="fa fa-long-arrow-right"></i></a></h4>
                    </div>

                    <div id="kodecomments">
                        <div class="kode-section-title"> <h2>Commentaires</h2> </div>
                    </div>
                    <?php

                    foreach ($list_news as $news):
                        if($id == $news['id_news'] && $news['type_page'] == "Commentaire"):
                    ?>
                        <div class="comments">
                            <div class="sh-section">
                                <div class="sh-section__head">
                                    <a href="single_post.html" class="sh-section__avatar sh-avatar"><img src="<?php echo base_url()."assets/images/users/neymar.jpg"; ?>" alt=""></a>
                                    <div>
                                        <a href="#" class="sh-section__name">Diego</a>
                                        <span class="sh-section__passed">
                                            <?php
                                            $datenews = date("d-m-Y", $news["date"]);

                                            if($datenews == $this->today):
                                                echo "Aujourd'hui";
                                            elseif($datenews == $this->yesterday):
                                                echo "Hier";
                                            elseif($datenews == $this->tommorow):
                                                echo "Demain";
                                            else:
                                                echo date("d/m/Y", $news["date"]);
                                            endif;
                                            echo date(" à h:i", $news["date"]);
                                            ?>
                                        </span>
                                    </div>
                                    <a href="#" class="sh-section__link sh-btn-icon"><i class="icon-Link"></i></a>
                                </div>
                                <div class="sh-section__content">
                                    <p><?php echo $news["content"]; ?></p>
                                </div>
                                <div class="sh-section__footer">
                                    <a href="#" class="sh-section__btn-comment sh-btn-icon"> 
                                        <i class="fa fa-comment"></i>
                                        <span> 34</span>
                                    </a>
                                    <a href="#" class="sh-section__btn-like sh-btn-icon"> 
                                        <i class="fa fa-heart"></i>
                                        <span> 1 274</span>
                                    </a>
                                </div>
                            </div>

                            <?php       
                            foreach ($list_news as $news2):
                                if($news2['type_page'] == "Commentaire"):
                                    if($news['id'] == $news2['id_com']):
                                        ?>
                                        <div class="sh-comments__section">
                                            <a href="#" class="sh-comments__avatar sh-avatar">
                                                <img src="<?php echo base_url()."assets/images/users/neymar.jpg"; ?>" alt="">
                                            </a>
                                            <div class="sh-comments__content">
                                                <a href="#" class="sh-comments__name">DSVUI</a>
                                                <span class="sh-comments__passed">. 
                                                    <?php
                                                    $datenews = date("d-m-Y", $news2["date"]);

                                                    if($datenews == $this->today):
                                                        echo "Aujourd'hui";
                                                    elseif($datenews == $this->yesterday):
                                                        echo "Hier";
                                                    elseif($datenews == $this->tommorow):
                                                        echo "Demain";
                                                    else:
                                                        echo date("d/m/Y", $news2["date"]);
                                                    endif;
                                                    echo date(" à h:i", $news2["date"]);
                                                    ?>
                                                </span>
                                                <p><?php echo $news2["content"]; ?></p>
                                                <div class="sh-comments__info">
                                                    <a href="#" class="sh-section__btn-like sh-btn-icon"> 
                                                        <i class="fa fa-heart"></i>
                                                        <span> 1 274</span>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                        <?php 
                                    endif;
                                endif;
                            endforeach;
                            ?>

                            <div class="sh-add-comment">
                                <form action="#">
                                    <input type="text" class="form-control ttg-border-none" placeholder="Add a Comment">
                                </form>
                                <div class="sh-add-comment__content">
                                    <a href="#" class="sh-add-comment__btn-save sh-btn-icon"><span>180</span><i class="icon-Submit_Tick"></i></a>
                                </div>
                            </div>
                        </div>
                    <?php
                        endif;
                    endforeach;
                    ?>
                    <div id="koderespond">
                        <div class="comments">
                                <div class="sh-add-comment">
                                    <form action="#"><input type="text" class="form-control ttg-border-none" placeholder="Add a Comment"></form>
                                    <div class="sh-add-comment__content">
                                        <a href="#" class="sh-add-comment__btn-save sh-btn-icon"><span>180</span><i class="icon-Submit_Tick"></i></a>
                                    </div>
                                </div>
                            </div>
                    </div>
                </div>
                <div class="col-md-1"></div>
            </div>
        </div>
        <a href="<?php echo $previous['slug']; ?>" id="next"><?php echo $previous['title']; ?></a>
    </section>
</div>