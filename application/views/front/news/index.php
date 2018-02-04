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
                                            <img src="<?php echo base_url().$image; ?>" alt="<?php echo $title; ?>">
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
                </div>
                <div class="col-md-1"></div>
            </div>
        </div>
        <a href="<?php echo $previous['slug']; ?>" id="next"><?php echo $previous['title']; ?></a>
    </section>
</div>