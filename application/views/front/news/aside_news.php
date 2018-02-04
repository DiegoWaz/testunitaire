<div class="widget kode-recent-blog">
    <div class="kode-widget-title">
        <h2>Toute l'actualité</h2>
    </div>
    <ul>
        <?php
        foreach ($list_news as $article):
            if($article["date"] < time()):
                foreach ($this->list as $rubrique):
                    if($rubrique["id"] == $article['rubrique']):
                        $nameRubrique = $rubrique["name"];
                    endif;
                endforeach;
        ?>
        <li>
            <figure>
                <a class="kode-recent-thumb" href="<?php echo base_url(); ?>news/view/<?php echo $article["slug"]; ?>">
                    <img src="<?php echo base_url().$article["image"]; ?>" alt="<?php echo $article["title"]; ?>">
                </a>
                <figcaption>
                <h3> 
                    <a class="news_une" href="<?php echo base_url(); ?>news/view/<?php echo $article["slug"]; ?>">
                        <span><?php echo $nameRubrique; ?> : </span><?php echo $article["title"]; ?> 
                    </a>
                </h3>
                <p><?php echo $article["resume"]; ?></p>
                <span class="time-news">
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
                ?></span>
                </figcaption>
            </figure>
        </li>
        <?php
        endif;
        endforeach;
        ?>
    </ul>
</div>