<?php
defined('BASEPATH') OR exit('No direct script access allowed');
?>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title><?php echo $this->title; ?></title>
    <meta name="description" content="<?php echo $this->description; ?>">
    <link rel="icon" type="image/png" href="<?php echo base_url(); ?>assets/front/images/favicon.png" />
    <?php foreach (glob("assets/front/css/*.css") as $css): ?>
<link href="<?php echo base_url().$css; ?>" rel="stylesheet">
    <?php endforeach; ?>
    <?php $this->view('front/widget/meta'); ?>
    <!-- Rich snippet -->
    <?php $this->view('front/widget/richsnippet'); ?>
</head>
<body>
    <header id="mainheader" class="kode-header-absolute">
        <div class="kode-topbar">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 kode_bg_white">
                        <ul class="top_slider_bxslider">
                            <?php
                            foreach ($this->lastNews as $news):
                                foreach ($this->list as $rubrique): 
                                    if($rubrique["id"] == $news["rubrique"]):
                                        $nameRubrique = $rubrique["name"];
                                    endif;
                                endforeach;
                                ?>
                                <li>
                                    <span class="kode-barinfo">
                                        <strong><?php echo $nameRubrique; ?> : </strong> <?php echo $news["title"]; ?>
                                    </span>
                                </li>
                                <?php
                            endforeach;
                            ?>
                        </ul>
                    </div>
                    <div class="col-md-6">
                        <ul class="kode-userinfo">
                            <?php if (!isset($_SESSION['logged_in'])) : ?>
                                <li><a href="<?= base_url('register') ?>">S'inscrire</a></li>
                                <li><a href="<?= base_url('login') ?>">Se connecter</a></li>
                            <?php else: ?>

                                <li class="dropdown">
                                    <?php if (isset($_SESSION['username']) && $_SESSION['logged_in'] === true) : ?>
                                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
                                            <?php echo $_SESSION['username']; ?> <span class="caret"></span>
                                        </a>
                                    <?php endif; ?>
                                    <ul class="dropdown-menu" role="menu">
                                        <li>
                                            <a href="#" onclick="event.preventDefault(); document.getElementById('logout-form').submit();">
                                                Déconnexion
                                            </a>

                                            <form id="logout-form" action="<?= base_url('logout') ?>" method="POST" style="display: none;">
                                            </form>
                                        </li>
                                    </ul>
                                </li>
                            <?php endif; ?>
                            <li><a href="#"><i class="fa fa-question"></i> Suggestions</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <?php $this->view('front/menu'); ?>
    </header>

    <div id="app">
       <?php echo $output; ?>
    </div>

    <footer>
        <div class="kode-bottom-footer">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <p>© <?php echo date("Y"); ?> LMDNews</p>
                    </div>
                    <div class="col-md-6">
                        <a href="#" id="kode-topbtn" class="thbg-colortwo"><i class="fa fa-angle-up"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </footer>

    <div class="clearfix clear"></div>
    <script src="<?php echo base_url(); ?>assets/front/js/jquery/jquery.js"></script>
        <?php foreach (glob("assets/front/js/*.js") as $js): ?>
        <script src="<?php echo base_url().$js; ?>"></script>
    <?php endforeach; ?>
    <script>
        // When you use default selectors
        // $('#contentsWrapper').cleverInfiteScroll();

        // When you use custom selectors
        $('#contentsWrapper').cleverInfiniteScroll({
            contentsWrapperSelector: '#contentsWrapper',
            contentSelector: '.kode-pagesection',
            nextSelector: '#next',
            loadImage: '<?php echo base_url(); ?>/assets/front/images/ajax-loader.gif'
        });
    </script>
</body>
</html>