<div id="mainbanner">
	<div class="flexslider">
		<ul class="slides">
			<?php
			foreach ($une as $articleUne):
                ?>
				<li>
					<img src="<?php echo $articleUne["image"]; ?>" alt="<?php echo $articleUne["title"]; ?>" />
					<div class="container">
						<div class="kode-caption">       
							<h1>
								<a href="news/<?php echo $articleUne["slug"]; ?>">
									<?php echo $articleUne["title"]; ?>
								</a>	
							</h1>
							<div class="clearfix"></div>        
							<p class="resume"><?php echo $articleUne["resume"]; ?></p>
							<div class="clearfix"></div>
						</div>
					</div>
				</li>
				<?php
			endforeach;
			?>
		</ul>
	</div>
</div>

<div class="kode-content">
	<section class="pick-event padding-30-topbottom margin-top-minus-40">
		<div class="container">
			<div class="row">
				<div class="col-md-3">
					<?php $this->view('front/news/aside_news'); ?>
				</div>
				<div class="kode-pagecontent col-md-9">
					<div class="kode-blog-list kode-grid-blog">
						<ul class="row">
							<?php
							foreach ($listeRubrique as $key => $lRubrique):
							?>
							<div class="col-md-12 kode-section-title"> 
								<h2>Les <?php echo $lRubrique; ?></h2>
							</div>
							<?php
							
							$list_news_rubrique = $this->news_model->get_list_news_rubrique($key, 3);

							foreach ($list_news_rubrique as $news):
                                if($key == $news["rubrique"]):
                                    if($news["date"] < time()):
								?>
								<li class="col-md-4">
									<div class="kode-time-zoon"></div>
									<figure>
										<a href="<?php echo base_url(); ?>news/view/<?php echo $news["slug"]; ?>">
											<img src="<?php echo $news["image"]; ?>" alt="<?php echo $news["title"]; ?>">
										</a>
									</figure>
									<div class="kode-blog-info">
										<time datetime="<?php echo $news["updated_at"]; ?>">
                                            <span>
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
                                        </time>
										<h3><a href="<?php echo base_url(); ?>news/view/<?php echo $news["slug"]; ?>"><?php echo $news["title"]; ?></a></h3>

										<p><?php echo $news["resume"]; ?></p>

										<div class="clearfix"></div>
										<ul class="kode-team-network">
											<li>
												<a target="_blank" class="fa fa-facebook" href="http://www.facebook.com/sharer.php?u=<?php echo base_url(); ?>news/view/<?php echo $news["slug"]; ?>"></a>
											</li>
											<li>
												<a target="_blank" class="fa fa-twitter" href="https://twitter.com/intent/tweet?text=<?php echo utf8_decode($news["title"]); ?> @LMDPSG <?php echo base_url(); ?>news/view/<?php echo $news["slug"]; ?>"></a>
											</li>
										</ul>
									</div>
								</li>
								<?php
									endif;
                                endif;
							endforeach;
							?>
							<div class="kode-align-btn">
								<a href="#" class="kode-modren-btn thbg-colortwo">Tous les <?php echo $lRubrique; ?></a>
							</div>
							<?php
							endforeach;
							?>
						</ul>
					</div>
				</div>
			</div>
		</section>		


		<div class="pick-event kode-pagecontent col-md-12">
			<div class="container kode-blog-list kode-grid-blog">
				<ul class="row">
					<div class="col-md-4 kode-section-title"> 
						<h2>L'histoire du PSG</h2>
					</div>
					<?php
					foreach ($list_contenue as $contenue):
						?>
						<li class="col-md-4">
							<div class="kode-time-zoon"></div>
							<figure><a href="#"><img src="<?php echo $contenue["image"]; ?>" alt=""></a></figure>
							<div class="kode-blog-info">
								<time datetime="<?php echo $contenue["updated_at"]; ?>">
									<?php
                                        $datenews = date("d-m-Y", $contenue["date"]);

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
								</time>
								<h3><a href="#"><?php echo $contenue["title"]; ?></a></h3>

								<div class="clearfix"></div>
								<ul class="kode-team-network">
									<li>
										<a target="_blank" class="fa fa-facebook" href="http://www.facebook.com/sharer.php?u=<?php echo base_url(); ?>news/view/<?php echo $contenue["id"]; ?>"></a>
									</li>
									<li>
										<a target="_blank" class="fa fa-twitter" href="https://twitter.com/intent/tweet?text=<?php echo $contenue["title"]; ?> @LMDPSG <?php echo base_url(); ?>news/view/<?php echo $contenue["id"]; ?>"></a>
									</li>
								</ul>
							</div>
						</li>
					<?php
					endforeach;
					?>
					<li class="clearfix"></li>
				</ul>
			</div>
		</div>
	</div>