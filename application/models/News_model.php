<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
* User_model class.
* 
* @extends CI_Model
*/
class News_model extends CI_Model {

/**
* __construct function.
* 
* @access public
* @return void
*/
public function __construct() {
	parent::__construct();
	$this->load->database();
}

public function get_list_news($limit)
{

	$this->db->where('isdelete', 0);
	$this->db->order_by("date", "desc");
	$query = $this->db->get_where('posts', array(
		'type_page' => "Article"
	), $limit);
	return $query->result_array();

}

public function get_com($limit)
{

	$this->db->where('isdelete', 0);
	$this->db->order_by("date", "desc");
	$query = $this->db->get_where('posts', array(
		'status' => "Publié"
	), $limit);
	return $query->result_array();

}

public function get_list_news_rubrique($idrubrique, $limit)
{

	$this->db->where('isdelete', 0);
	$this->db->order_by("date", "desc");
	$query = $this->db->get_where('posts', array(
		'rubrique' => $idrubrique
	), $limit);
	return $query->result_array();
}

public function get_list_allnews()
{

	$this->db->where('isdelete', 0);
	$this->db->order_by("date", "desc");
	$this->db->where('date <', time());
	$query = $this->db->get_where('posts', array(
		'type_page' => "Article"
	));
	return $query->result_array();

}

public function get_list_contenue($limit)
{

	$this->db->where('isdelete', 0);
	$this->db->order_by("updated_at", "desc");
	$query = $this->db->get_where('posts', array(
		'type_page' => "Contenu"
	), $limit);
	return $query->result_array();
}	


public function get_une_news($limit)
{

	$this->db->where('isdelete', 0);
	$this->db->order_by("updated_at", "desc");
	$query = $this->db->get_where('posts', array('une' => 1), $limit);
	return $query->result_array();

}					

public function get_news($slug)
{

	$this->db->order_by("updated_at", "desc");
	$this->db->where('isdelete', 0);
	$query = $this->db->get_where('posts', array('slug' => $slug));
	return $query->result_array();
}		

public function get_news_id($id)
{
	$this->db->where('isdelete', 0);
	$query = $this->db->get_where('posts', array('id' => $id));
	return $query->row_array();
}	

public function get_listRubrique()
{
	$this->db->where('isdelete', 0);
	$query = $this->db->get('rubrique_news');
	return $query->result_array();
}	

public function get_listNameRubrique()
{
	$this->db->select('name');
	$this->db->where('isdelete', 0);
	$query = $this->db->get('rubrique_news');
	return $query->result_array();
}

public function editRubrique($id, $rubrique, $slug) {

	$data = array(
		'name'   => $rubrique,
		'slug'   => $slug
	);
	$this->db->where('id', $id);
	return $this->db->update('rubrique_news', $data);
}		

public function deleteForm($id, $table) {

	$data = array(
		'isDelete'   => "1"
	);
	$this->db->where('id', $id);
	return $this->db->update($table, $data);
}

public function get_oneRubrique($id)
{		
	$this->db->where('isdelete', 0);
	$query = $this->db->get_where('posts',
		array(
			'rubrique' => $id,
		));
	return $query->result_array();
}


public function addRubrique($rubrique, $slug) {

	$data = array(
		'name'   => $rubrique,
		'slug'   => $slug
	);
	return $this->db->insert('rubrique_news', $data);
}

public function get_news_previous($id)
{
	$this->db->where('isdelete', 0);
	$query = $this->db->get_where('posts', array(
		'id >' => $id,
		'status' => 'Publié'
	));
	return $query->row_array();
}


public function get_news_next($id)
{
	$this->db->where('isdelete', 0);
	$query = $this->db->get_where('posts', array(
		'id <' => $id,
		'status' => 'Publié'
	));
	return $query->row_array();
}


public function decode_title($text)
{
	$text = htmlentities($text, ENT_NOQUOTES, "UTF-8");
	return $text;
}    

public function decode_post($text)
{
	$text = htmlentities($text, ENT_NOQUOTES, "UTF-8");
	$text = htmlspecialchars_decode($text);
	return $text;
}

		
public function addNews($title, $image, $resume, $rubrique, $content, $status, $important, $type, $slug, $date) {

	$data = array(
		'title'   	 => $title,
		'image'   	 => $image,
		'status'   	 => $status,
		'resume'     => $resume,
		'rubrique'   => $rubrique,
		'content'    => $content,
		'type_page'  => $type,
		'slug'       => $slug,
		'une'        => $important,
		'date'    	 => $date,
		'created_at' => date('Y-m-j H:i:s'),
		'updated_at' => date('Y-m-j H:i:s')
	);

	return $this->db->insert('posts', $data);
}	


public function editNews($id, $title, $image, $status, $resume, $rubrique, $content, $type_page, $slug, $une, $date) {

	$data = array(
		'id'   	     => $id,
		'title'   	 => $title,
		'image'   	 => $image,
		'status'   	 => $status,
		'resume'     => $resume,
		'rubrique'   => $rubrique,
		'content'    => $content,
		'type_page'  => $type_page,
		'slug'       => $slug,
		'une'        => $une,
		'date'    	 => $date,
        'updated_at' 	=> date('Y-m-j H:i:s')
	);

	$this->db->where('id', $id);
    return $this->db->update('posts', $data);
}

public function slug($slug)
{
	return strtolower(convert_accented_characters(url_title($slug)));
}

public function update_counter($slug) {
// return current article views 

	$this->db->where('slug', urldecode($slug));

	$this->db->select('views');
	$count = $this->db->get('posts')->row();

	$this->db->where('slug', urldecode($slug));
	$this->db->set('views', ($count->views + 1));

	return $this->db->update('posts');
}


public function getListUsers()
{
	$query = $this->db->get('users');

	return $query->result_array();
}

public function getPostUser($id)
{
	$this->db->select('author_id');
	$query = $this->db->get_where('posts',
		array(
			'id' => $id
		)
	);
	return $query->result_array();
}	
}
