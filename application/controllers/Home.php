<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Home extends CI_Controller {

	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see https://codeigniter.com/user_guide/general/urls.html
	 */

	public function __construct() {
		
		parent::__construct();
		$this->load->library(array('session'));
		$this->load->helper(array('url'));
		$this->load->model('user_model');
		$this->load->model('news_model');
		$this->load->model('conf_model');
		$this->load->helper('url');
        $this->today = date("d-m-Y", time());
        $this->yesterday = date('d-m-Y', time() - 3600 * 24);
        $this->tommorow = date('d-m-Y', time() + 3600 * 24);
        $today = $this->today;
        $yesterday = $this->yesterday;
        $tommorow = $this->tommorow;

		$title = $this->conf_model->get_conf("site_name");
		$description = $this->conf_model->get_conf("site_desc");
		$this->section = $this->conf_model->get_section();

		$this->title = $title[0]["value"];
		$this->description = $description[0]["value"];

		$this->output->set_template('front');
		$this->lastNews = $this->news_model->get_list_news(3);
        $this->list = $this->news_model->get_ListRubrique();

        $this->image = "http://v10.lemeilleurdupsg.com/ckfinder/userfiles/files/newdefault.jpg";

    }

	public function index()
	{
		$data["type"] = "index";
		$data["list_news"] = $this->news_model->get_list_news(19);

		$data["image"] = $this->image;

		$data["allnews"] = $this->news_model->get_list_allnews();
		$data["list_contenue"] = $this->news_model->get_list_contenue(3);
		$data["une"] = $this->news_model->get_une_news(3);

		$data['listeRubrique'] = $this->rubrique = array(
			"33" => 'Transferts', 
			"50" => 'Dossiers', 
			"31" => 'Actu', 
			"38" => 'Vidéos'
		);

		$idPSG = 1;

		$data['countNews'] = count($data["allnews"]);
		$data["limit"] = 3;
		
		$this->load->view('front/index', $data);
	}

	public function section($section) {

		$data["image"] = $this->image;

		$data["type"] = "section";

		$data["section"] = $this->conf_model->get_section();

		$theSection = $this->news_model->get_section_slug($section);

		$idSection = $theSection[0]["id"];

		$data["list_news"] = $this->news_model->get_list_news_section($idSection, 10);
		$data["une"] = $this->news_model->get_une_news_section($idSection, 3);
		$data["list_contenue"] = $this->news_model->get_list_contenue(3);
		
		$data["sections"] = $section;

		$data["lastNews"] = $this->news_model->get_list_news_section($idSection, 3);
		$data['listeRubrique'] = $this->rubrique = array(
			"33" => 'Transferts', 
			"50" => 'Dossiers', 
			"31" => 'Actu', 
			"38" => 'Vidéos'
		);

		$idPSG = 1;

		$data["limit"] = 3;
		$this->load->view('front/index', $data);
	}
}
