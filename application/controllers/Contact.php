<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Contact extends CI_Controller {

    public function __construct()
    {
        parent::__construct();
        session_start();
        $this->load->model('news_model');
        $this->load->model('conf_model');
        $this->load->model('games_model');
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

        $title = $this->conf_model->get_conf("site_name");
        $description = $this->conf_model->get_conf("site_desc");

        $this->title = $title[0]["value"];
        $this->description = $description[0]["value"];

        $this->output->set_template('front');
    }

    public function index($slug = NULL)
    {
        $this->load->view('front/contacts/index');
    }
}