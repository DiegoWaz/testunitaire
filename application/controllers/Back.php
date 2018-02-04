<?php
defined('BASEPATH') OR exit('No direct script access allowed');


class Back extends CI_Controller {

	public function __construct() {
		
		parent::__construct();
		$this->load->library(array('session'));
		$this->load->helper(array('url'));
		$this->load->helper('form');
		$this->load->model('user_model');
		$this->load->model('news_model');
		$this->load->helper('url');
		$this->load->helper('date');
		$this->load->helper(array("url", "text"));
		$this->output->set_template('back');
		$this->dependenciesCSS = array(
			'plugins/font-awesome/css/font-awesome.css',
			'plugins/bootstrap-tag/bootstrap-tagsinput.css',
			'plugins/dropzone/css/dropzone.css',
			'plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.css',
			'plugins/bootstrap-datepicker/css/datepicker.css',
			'plugins/bootstrap-timepicker/css/bootstrap-timepicker.css',
			'plugins/bootstrap-colorpicker/css/bootstrap-colorpicker.css',
			'plugins/ios-switch/ios7-switch.css',
			'plugins/bootstrap-select2/select2.css',
			'plugins/boostrap-clockpicker/bootstrap-clockpicker.min.css',
			'plugins/ios-switch/ios7-switch.css',
			'webarch/css/webarch.css'
		);


		$this->dependenciesJS = array(
			'plugins/pace/pace.min.js',
			'plugins/jquery/jquery-1.11.3.min.js',
			'plugins/bootstrapv3/js/bootstrap.min.js',
			'plugins/jquery-block-ui/jqueryblockui.min.js',
			'plugins/jquery-unveil/jquery.unveil.min.js',
			'plugins/jquery-scrollbar/jquery.scrollbar.min.js',
			'plugins/jquery-numberAnimate/jquery.animateNumbers.js',
			'plugins/jquery-validation/js/jquery.validate.min.js',
			'plugins/bootstrap-select2/select2.min.js',
			'webarch/js/webarch.js',
			'js/chat.js',
			'js/script.js'
		);
	    $this->today = date("d-m-Y", time());
        $this->yesterday = date('d-m-Y', time() - 3600 * 24);
        $this->tommorow = date('d-m-Y', time() + 3600 * 24);
        
        $today = $this->today;
        $yesterday = $this->yesterday;
        $tommorow = $this->tommorow;
	}

	public function index()
	{

		$this->title = 'Le Meilleur du PSG - Liste des articles';
		$this->description = "Le site le plus complet sur l'actualité du Paris Saint-Germain. Pour tout savoir sur les résultats, l'équipe, les transferts, les joueurs, les matchs, les supporters, etc...";

		$data['dependenciesCSS'] = $this->dependenciesCSS;
		$data['dependenciesJS'] = $this->dependenciesJS;

		$data['requireCSS'] = $this->requireCSS = array(
			'plugins/jquery-slider/css/jquery.sidr.light.css',
			'plugins/jquery-ricksaw-chart/css/rickshaw.css',
			'plugins/Mapplic/mapplic/mapplic.css',
			'plugins/pace/pace-theme-flash.css',
			'plugins/bootstrapv3/css/bootstrap.min.css',
			'plugins/bootstrapv3/css/bootstrap-theme.min.css',
			'plugins/animate.min.css',
			'plugins/jquery-scrollbar/jquery.scrollbar.css',
			'plugins/ios-switch/ios7-switch.css',
			'webarch/css/webarch.css'
		);

		$data['requirejs'] = $this->requirejs = array(
			'js/support_ticket.js'
		);

		$data["list_news"] = $this->news_model->get_list_news(0);
		$data["list"] = $this->news_model->get_ListRubrique();
		
		$this->load->view('back/listnews', $data);
	}

	public function rubriqueList()
	{

		$this->title = 'Le Meilleur du PSG - Todo List';
		$this->description = "Le back-office du site Le Meilleur du PSG";

		$data['dependenciesCSS'] = $this->dependenciesCSS;
		$data['dependenciesJS'] = $this->dependenciesJS;

		$data['requireCSS'] = $this->requireCSS = array(
			'plugins/jquery-slider/css/jquery.sidr.light.css',
			'plugins/jquery-ricksaw-chart/css/rickshaw.css',
			'plugins/Mapplic/mapplic/mapplic.css',
			'plugins/pace/pace-theme-flash.css',
			'plugins/bootstrapv3/css/bootstrap.min.css',
			'plugins/bootstrapv3/css/bootstrap-theme.min.css',
			'plugins/animate.min.css',
			'plugins/jquery-scrollbar/jquery.scrollbar.css',
			'plugins/ios-switch/ios7-switch.css',
			'webarch/css/webarch.css'
		);

		$data['requirejs'] = $this->requirejs = array(
			'js/support_ticket.js'
		);

		$data["list_news"] = $this->news_model->get_list_news(10);
		$data["title"] = $this->form = array(
		        'name'          => 'title',
		        'id'            => 'title',
		        'placeholder'   => 'Titre',
		        'class'   		=> 'form-control',
		);		

		$data["type"] = "rubrique";
		$data["action"] = "add";
		$data["list"] = $this->news_model->get_ListRubrique();

		$this->load->view('back/list', $data);
	}		


	public function rubrique($id)
	{

		$this->title = 'Le Meilleur du PSG - Todo List';
		$this->description = "Le back-office du site Le Meilleur du PSG";

		$data['dependenciesCSS'] = $this->dependenciesCSS;
		$data['dependenciesJS'] = $this->dependenciesJS;

		$data['requireCSS'] = $this->requireCSS = array(
			'plugins/jquery-slider/css/jquery.sidr.light.css',
			'plugins/jquery-ricksaw-chart/css/rickshaw.css',
			'plugins/Mapplic/mapplic/mapplic.css',
			'plugins/pace/pace-theme-flash.css',
			'plugins/bootstrapv3/css/bootstrap.min.css',
			'plugins/bootstrapv3/css/bootstrap-theme.min.css',
			'plugins/animate.min.css',
			'plugins/jquery-scrollbar/jquery.scrollbar.css',
			'plugins/ios-switch/ios7-switch.css',
			'webarch/css/webarch.css'
		);

		$data['requirejs'] = $this->requirejs = array(
			'js/support_ticket.js'
		);

		$data["title"] = $this->form = array(
		        'name'          => 'title',
		        'id'            => 'title',
		        'placeholder'   => 'Titre',
		        'class'   		=> 'form-control',
		);		

		$data["type"] = "rubrique";
		$data["action"] = "add";

		$data["list"] = $this->news_model->get_ListRubrique();

		$data["list_news"] = $this->news_model->get_oneRubrique($id, 0);

		$this->load->view('back/index', $data);
	}

	public function editRubrique($id)
	{

		$this->title = 'Le Meilleur du PSG - Section';
		$this->description = "Le back-office du site Le Meilleur du PSG";

		$data['dependenciesCSS'] = $this->dependenciesCSS;
		$data['dependenciesJS'] = $this->dependenciesJS;

		$data['requireCSS'] = $this->requireCSS = array(
			'plugins/jquery-slider/css/jquery.sidr.light.css',
			'plugins/jquery-ricksaw-chart/css/rickshaw.css',
			'plugins/Mapplic/mapplic/mapplic.css',
			'plugins/pace/pace-theme-flash.css',
			'plugins/bootstrapv3/css/bootstrap.min.css',
			'plugins/bootstrapv3/css/bootstrap-theme.min.css',
			'plugins/animate.min.css',
			'plugins/jquery-scrollbar/jquery.scrollbar.css',
			'plugins/ios-switch/ios7-switch.css',
			'webarch/css/webarch.css'
		);

		$data['requirejs'] = $this->requirejs = array(
			'js/support_ticket.js'
		);

		$data["list_news"] = $this->news_model->get_list_news(0);
		$data["list"] = $this->news_model->get_ListRubrique();

		$data["rubrique"] = $this->news_model->get_oneRubrique($id);

		var_dump($data["rubrique"]);
		die;

		foreach ($data["rubrique"] as $value) {
			$id = $value["id"];
			$rubrique = $value["name"];
			$slug = $value["slug"];
		}

		$data["title"] = $this->form = array(
		        'name'          => 'title',
		        'id'            => 'title',
		        'placeholder'   => 'Titre',
		        'class'   		=> 'form-control',
		        'value'			=>  $rubrique,
		);

		$data["id"] = $id;

		$data["type"] = "rubrique";
		$data["action"] = "edit";
		$this->slug = $slug;

		$this->load->view('back/list', $data);
	}

	public function formValidaddNews()
	{
        $this->load->helper(array("url", "text"));
		$this->load->library('form_validation');
		
		// set validation rules
		$this->form_validation->set_rules('title', 'Titre', 'is_unique[posts.title]', array('is_unique' => 'Le titre est déjà existant. Trouve un autre nom'));

		$title = $this->input->post("title");
		$resume = $this->input->post("resume");		
		$rubrique = $this->input->post("rubrique");
		$content = $this->input->post("content");
		$status = $this->input->post("status");
		$day = $this->input->post("date");
		$hour = $this->input->post("time");
        $date = strtotime($day.$hour);
		$idPseudo = 2;
		$important = 1;
		$image = "newsdefault.jpg";
		$slug = convert_accented_characters(url_title($title));
		$type = "Article";
		$id = $this->input->post("idcomment");

        $data["insert"] = $this->news_model->addNews($title, $image, $resume, $rubrique, $content, $status, $important, $type, $slug, $date);

        $this->session->set_flashdata('success', "L'article a bien été ajouté");
		$this->load->view('back/formNews', $data);

	}		

	public function formValideditNews()
	{
		$post = $_POST;

        $this->load->helper(array("url", "text"));

        foreach ($post as $key => $value) {
        	${$key} = $value;
        }

		if(!isset($image)){
			$image = "newsdefault.jpg";
		}

        $date = $date = strtotime($date.$time);

		$slug = convert_accented_characters(url_title($title)).'-'.$id;
		$st = 2;

        // Feuilleton mercato

		if(isset($une)): 
			$une = 1;
		else: 
			$une = 0;
		endif;

		$data["update"] = $this->news_model->editNews($id, $title, $image, $status, $resume, $rubrique, $content, $type_page, $slug, $une, $date);

        $this->session->set_flashdata('success', "L'article a bien été edité");

        $this->load->view('back/formValid', $data);
	}	


	public function news()
	{

		$this->title = 'Le Meilleur du PSG - Rédiger un article';
		$this->description = "Le back-office du site Le Meilleur du PSG";
		$this->type = "add";
		$data["type"] = $this->type;

		$this->type2 = "Ajouter";
		$data["type2"] = $this->type2;

		$data['dependenciesCSS'] = $this->dependenciesCSS;
		$data['dependenciesJS'] = $this->dependenciesJS;

		$data['requireCSS'] = $this->requireCSS = array(
			'plugins/pace/pace-theme-flash.css',
			'plugins/bootstrapv3/css/bootstrap.min.css',
			'plugins/bootstrapv3/css/bootstrap-theme.min.css',
			'plugins/animate.min.css',
			'plugins/jquery-scrollbar/jquery.scrollbar.css',
			'webarch/css/webarch.css'
		);

		$data['requirejs'] = $this->requirejs = array(
			'plugins/bootstrap-datepicker/js/bootstrap-datepicker.js',
			'plugins/bootstrap-timepicker/js/bootstrap-timepicker.min.js',
			'plugins/jquery-inputmask/jquery.inputmask.min.js',
			'plugins/jquery-autonumeric/autoNumeric.js',
			'plugins/ios-switch/ios7-switch.js',
			'plugins/bootstrap-select2/select2.min.js',
			'plugins/bootstrap-wysihtml5/wysihtml5-0.3.0.js',
			'plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.js',
			'plugins/bootstrap-tag/bootstrap-tagsinput.min.js',
			'plugins/boostrap-clockpicker/bootstrap-clockpicker.min.js',
			'plugins/dropzone/dropzone.min.js',
			'js/form_elements.js'
		);

        //$data['postUsers'] = $this->news_model->getListUsers();

		$id = $this->input->post("id_comment");
		$idpseudo = $this->input->post("id_pseudo");

		$data["classSelect"] = array(
	        'class'   		=> 'form-control'
		);

        $data['rubrique'] = $this->news_model->get_listRubrique();
		$data["users"] = $this->news_model->getListUsers();

		if(isset($id)) {
			$data["update"] = $this->news_model->updateValid($id, $idpseudo, 1);
		}

		$data["idcomment"] = $this->input->post("id_comment");

		
		$this->load->view('back/news', $data);
	}	
	
	public function editNews($id)
	{

		$this->title = 'Le Meilleur du PSG - Rédiger un article';
		$this->description = "Le back-office du site Le Meilleur du PSG";
		$this->type = "edit";
		$this->type2 = "Modifier";

		$data["id"] = $id;

		$data["type"] = $this->type;
		$data["type2"] = $this->type2;

		$data['dependenciesCSS'] = $this->dependenciesCSS;
		$data['dependenciesJS'] = $this->dependenciesJS;

		$data['requireCSS'] = $this->requireCSS = array(
			'plugins/pace/pace-theme-flash.css',
			'plugins/bootstrapv3/css/bootstrap.min.css',
			'plugins/bootstrapv3/css/bootstrap-theme.min.css',
			'plugins/animate.min.css',
			'plugins/jquery-scrollbar/jquery.scrollbar.css',
			'webarch/css/webarch.css'
		);

		$data['requirejs'] = $this->requirejs = array(
			'plugins/bootstrap-datepicker/js/bootstrap-datepicker.js',
			'plugins/bootstrap-timepicker/js/bootstrap-timepicker.min.js',
			'plugins/jquery-inputmask/jquery.inputmask.min.js',
			'plugins/jquery-autonumeric/autoNumeric.js',
			'plugins/ios-switch/ios7-switch.js',
			'plugins/bootstrap-select2/select2.min.js',
			'plugins/bootstrap-wysihtml5/wysihtml5-0.3.0.js',
			'plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.js',
			'plugins/bootstrap-tag/bootstrap-tagsinput.min.js',
			'plugins/boostrap-clockpicker/bootstrap-clockpicker.min.js',
			'plugins/dropzone/dropzone.min.js',
			'js/form_elements.js'
		);

		$idcomment = $this->input->post("id_comment");
		$idpseudo = $this->input->post("id_pseudo");

		$data["classSelect"] = array(
	        'class'   		=> 'form-control dropzone'
		);

		$data["news"] = $this->news_model->get_news_id($id);
		$data['rubrique'] = $this->news_model->get_listRubrique();
		$data["users"] = $this->news_model->getListUsers();
        $data['postUsers'] = $this->news_model->getPostUser($id);

		$data["idcomment"] = $this->input->post("id_comment");

        $this->load->view('back/news', $data);
	}	

	public function formClose()
	{

		$id = $this->input->post("id_comment");
		$idpseudo = $this->input->post("id_pseudo");

		if(isset($id)) {
			$data["update"] = $this->news_model->updateValid($id, $idpseudo, 0);
		}

		$this->load->view('back/formValid');
	}		

	public function formList()
	{

		$type = $this->input->post("type");
		$title = $this->input->post("title");
		$resume = $this->input->post("resume");
		$action = $this->input->post("action");
		$id = $this->input->post("id");

		$slug = $this->news_model->slug($title);

		if(isset($title)) {
			if ($action == "add"):
				if($type == "rubrique"):
					$data["update"] = $this->news_model->addRubrique($title, $slug);
				endif;

			$this->session->set_flashdata('success', $title." a bien été ajouté");
			
			elseif($action == "edit"):
				if($type == "rubrique"):
					$data["update"] = $this->news_model->editRubrique($id, $title, $slug);
				endif;
			endif;

			$this->session->set_flashdata('success', $title." a bien été modifié");
		}

		$this->load->view('back/formValid');
	}	

	public function formDelete()
	{

		$id = $this->input->post("id_comment");
		$idpseudo = $this->input->post("id_pseudo");

		if(isset($id)) {
			$data["update"] = $this->news_model->updateValid($id, $idpseudo, 4);
		}

		$this->load->view('back/formValid');
	}

    public function success()
    {
        $this->title = 'Le Meilleur du PSG - Rédiger un article';
        $this->description = "Le back-office du site Le Meilleur du PSG";

        $data['dependenciesCSS'] = $this->dependenciesCSS;
        $data['dependenciesJS'] = $this->dependenciesJS;

        $data['requireCSS'] = $this->requireCSS = array(
            'plugins/jquery-slider/css/jquery.sidr.light.css',
            'plugins/jquery-ricksaw-chart/css/rickshaw.css',
            'plugins/Mapplic/mapplic/mapplic.css',
            'plugins/pace/pace-theme-flash.css',
            'plugins/bootstrapv3/css/bootstrap.min.css',
            'plugins/bootstrapv3/css/bootstrap-theme.min.css',
            'plugins/animate.min.css',
            'plugins/jquery-scrollbar/jquery.scrollbar.css',
            'plugins/ios-switch/ios7-switch.css',
            'webarch/css/webarch.css'
        );

        $data['requirejs'] = $this->requirejs = array(
            'js/support_ticket.js'
        );


        return $this->load->view('back/formtest', $data);
    }

	public function deleteForm($table, $id) {

		$data["update"] = $this->news_model->deleteForm($id, $table);

        $this->session->set_flashdata('success', "L'article a bien été supprimé");
		$this->load->view('back/formValid', $data);
	}

}
