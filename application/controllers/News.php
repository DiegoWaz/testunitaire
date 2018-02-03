<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class News extends CI_Controller {

    public function __construct()
    {
        parent::__construct();
        session_start();
        $this->load->model('news_model');
        $this->load->model('conf_model');
        $this->load->helper('url_helper');
        $this->load->helper('url');
        $this->load->helper('date');
        $this->lastNews = $this->news_model->get_list_news(3);
        $this->section = $this->conf_model->get_section();
        $this->today = date("d-m-Y", time());
        $this->yesterday = date('d-m-Y', time() - 3600 * 24);
        $this->tommorow = date('d-m-Y', time() + 3600 * 24);
        $today = $this->today;
        $yesterday = $this->yesterday;
        $tommorow = $this->tommorow;
        $this->list = $this->news_model->get_ListRubrique();

        $this->output->set_template('front');
    }

    public function index()
    {
        $data["lastNews"] = $this->news_model->get_list_news(3);
        $data["news"] = $this->news_model->get_list_news(10);
        $this->load->view('front/news/index', $data);
    }

    public function view($slug = NULL)
    {

        $data["lastNews"] = $this->news_model->get_list_news(3);
        $data['news'] = $this->news_model->get_news($slug);
        $data['une'] = $this->news_model->get_une_news($slug);

        $data["list_sections"] = $this->news_model->get_ListSection();
        $data["list"] = $this->news_model->get_ListRubrique();

        foreach ($data["news"] as $article):
            foreach ($article as $key => $value):
                $data[$key] = $value;
            endforeach;
        endforeach;

        foreach ($data["list"] as $rubs):
            foreach ($rubs as $rub):
                if($rubs["id"] == $data["rubrique"]):
                    $data["rubrique"] = $rubs["name"];
                endif;
            endforeach;
        endforeach;
        
        $this->title = $data["rubrique"]." : ".$data['title'];
        $this->description = $data['resume'];

        $data['title'] = $this->title;
        $data['description'] = $this->description;

        $id = $data["id"];

        //Compteur de visite
        $this->add_count($slug);

        $data["previous"] = $this->news_model->get_news_previous($id);
        $data["next"] = $this->news_model->get_news_next($id);

        $data["list_news"] = $this->news_model->get_list_news(10);

        $this->load->view('front/news/index', $data);
    }

    public function poll($name) {

        $data["post"] = $this->input->post("meneur");
        $this->load->view('front/formValid', $data);
    }

    function add_count($slug)
    {

        $this->load->helper('cookie');

        $check_visitor = $this->input->cookie(urldecode($slug), FALSE);

        $ip = $this->input->ip_address();

        if ($check_visitor == false) {
            $cookie = array(
                "name"   => urldecode($slug),
                "value"  => "$ip",
                "expire" =>  time() + 7200,
                "secure" => false
            );
            $this->input->set_cookie($cookie);
            $this->news_model->update_counter(urldecode($slug));
        }
    }
}