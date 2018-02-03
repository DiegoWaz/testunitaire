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

public function get_list_news_section($section, $limit)
{

	$this->db->where('isdelete', 0);
	$this->db->order_by("updated_at", "desc");
	$query = $this->db->get_where('posts', array(
		'section' => $section
	), $limit);
	return $query->result_array();

}

public function getPostTeam($id)
{
	$this->db->select('id_teams');
	$query = $this->db->get_where('posts',
		array(
			'id' => $id
		));
	return $query->result_array();
}

public function getPostMatch($id)
{
	$this->db->select('id_matchs');
	$query = $this->db->get_where('posts',
		array(
			'id' => $id
		));
	return $query->result_array();
}

public function getPostMatchLimit($id, $limit)
{
	$query = $this->db->get_where('posts',
		array(
			'id_matchs' => $id
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

public function get_une_news_section($section, $limit)
{

	$this->db->where('isdelete', 0);
	$query = $this->db->get_where('posts', array(
		'une' => 1,
		'section' => $section
	), $limit);

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

public function get_listNameSection()
{
	$this->db->select('name');
	$this->db->where('isdelete', 0);
	$query = $this->db->get('section');
	return $query->result_array();
}

public function addSection($section, $slug) {

	$data = array(
		'name'   => $section,
		'slug'   => $slug
	);
	return $this->db->insert('section', $data);
}	

public function editSection($id, $section, $slug) {

	$data = array(
		'name'   => $section,
		'slug'   => $slug
	);
	$this->db->where('id', $id);
	return $this->db->update('section', $data);
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

public function get_section($id)
{		
	$this->db->where('isdelete', 0);
	$query = $this->db->get_where('posts',
		array(
			'section' => $id,
		));
	return $query->result_array();
}		

public function get_section_slug($slug)
{		
	$this->db->where('isdelete', 0);
	$query = $this->db->get_where('section',
		array(
			'slug' => $slug,
		));
	return $query->result_array();
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

public function get_ListSection()
{
	$this->db->where('isdelete', 0);
	$query = $this->db->get('section');
	return $query->result_array();
}

public function addRubrique($rubrique, $slug) {

	$data = array(
		'name'   => $rubrique,
		'slug'   => $slug
	);
	return $this->db->insert('rubrique_news', $data);
}

public function get_news_match(/*$id,*/ $limit)
{
	$query = $this->db->get('posts', /*array('idmatch' => $id),*/ $limit);
	return $query->result_array();
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

public function players($team)
{
	$query = $this->db->get_where('players', array(
		'clubactuel' => $team
	));
	return $query->result_array();
}

public function addTodoListNews($idpseudo, $title, $status, $link, $comment, $important) {

	$data = array(
		'id_pseudo'   => $idpseudo,
		'title'   	 => $title,
		'status'   	 => $status,
		'link'      => $link,
		'comment'      => $comment,
		'important'      => $important,
		'created_at' => date('Y-m-j H:i:s'),
		'updated_at' => date('Y-m-j H:i:s')
	);
	return $this->db->insert('todoListNews', $data);
}	

public function getPostPlayer($id)
{
	$this->db->select('id_players');
	$this->db->where('isdelete', 0);

	$query = $this->db->get_where('posts',
		array(
			'id' => $id
		)
	);
	return $query->result_array();
}		

public function getPostMercato($id)
{
	$this->db->where('is_delete', 0);
	$query = $this->db->get_where('mercato',
		array(
			'id_news' => $id
		)
	);
	return $query->result_array();
}				

public function addNews($title, $image, $resume, $rubrique, $section, $content, $status, $important, $type, $slug, $player, $game, $story, $team, $date, $author, $idplayer, $idteam1, $idteam2, $contract) {


	$data = array(
		'title'   	 => $title,
		'image'   	 => $image,
		'status'   	 => $status,
		'resume'     => $resume,
		'rubrique'   => $rubrique,
		'section'  	 => $section,
		'content'    => $content,
		'type_page'  => $type,
		'slug'       => $slug,
		'une'        => $important,
		'story'        => $story,
		'id_players'  => $player,
		'id_matchs'   => $game,
		'id_teams'    => $team,
		'date'    	 => $date,
		'author_id'     => $author,
		'created_at' => date('Y-m-j H:i:s'),
		'updated_at' => date('Y-m-j H:i:s')
	);

	$this->db->insert('posts', $data);

    $id = $this->db->insert_id();

    $data2 = array(
        'id_news'  	 	=> $id,
        'type_contract' => $contract,
        'id_player'  	=> $idplayer,
        'id_team'    	=> $idteam1,
        'id_team2'    	=> $idteam2,
        'created_at' 	=> date('Y-m-j H:i:s'),
        'updated_at' 	=> date('Y-m-j H:i:s')
    );

    $this->db->insert('mercato', $data2);

   return $id;
}	


public function editNews($id, $title, $image, $status, $resume, $rubrique, $content, $section, $type_page, $slug, $une, $story, $id_players, $id_matchs, $id_teams, $date, $author_id) {
	$data = array(
		'id'   	     => $id,
		'title'   	 => $title,
		'image'   	 => $image,
		'status'   	 => $status,
		'resume'     => $resume,
		'rubrique'   => $rubrique,
		'section'  	 => $section,
		'content'    => $content,
		'type_page'  => $type_page,
		'slug'       => $slug,
		'une'        => $une,
		'story'        => $story,
		'id_players'  => $id_players,
		'id_matchs'   => $id_matchs,
		'id_teams'    => $id_teams,
		'date'    	 => $date,
		'author_id'    => $author_id,
        'updated_at' 	=> date('Y-m-j H:i:s')
	);

	$this->db->where('id', $id);
    return $this->db->update('posts', $data);
}
    public function addMercatoEditNews($id, $title, $image, $resume, $rubrique, $section, $content, $status, $important, $type, $slug, $player, $game, $story, $team, $date, $author, $idplayer, $idteam1, $idteam2, $contract)
    {
        $data = array(
            'id'   	     => $id,
            'title'   	 => $title,
            'image'   	 => $image,
            'status'   	 => $status,
            'resume'     => $resume,
            'rubrique'   => $rubrique,
            'section'  	 => $section,
            'content'    => $content,
            'type_page'  => $type,
            'slug'       => $slug,
            'une'        => $important,
            'story'        => $story,
            'id_players'  => $player,
            'id_matchs'   => $game,
            'id_teams'    => $team,
            'date'    	 => $date,
            'author_id'    => $author,
            'updated_at' 	=> date('Y-m-j H:i:s')
        );

        $data2 = array(
            'id_news'  	 	=> $id,
            'type_contract' => $contract,
            'id_player'  	=> $idplayer,
            'id_team'    	=> $idteam1,
            'id_team2'    	=> $idteam2,
            'created_at' 	=> date('Y-m-j H:i:s'),
            'updated_at' 	=> date('Y-m-j H:i:s')
        );


        $this->db->where('id', $id);
        $this->db->update('posts', $data);

        return $this->db->insert('mercato', $data2);
    }

public function editMercato($id, $type_contract, $id_player, $id_team, $id_team2) {

	$data = array(
		'id_news'  	 	=> $id,
		'type_contract' => $type_contract,
		'id_player'  	=> $id_player,
		'id_team'    	=> $id_team,
		'id_team2'    	=> $id_team2,
		'updated_at' 	=> date('Y-m-j H:i:s')
	);

	$this->db->where('id_news', $id);

	return $this->db->update('mercato', $data);
}


public function addReplyTodoListNews($idpseudo, $comment, $idcomment) {

	$data = array(
		'id_comment'   => $idcomment,
		'id_pseudo'    => $idpseudo,
		'replycomment'  => $comment,
		'date'          => time(),
		'created_at'    => date('Y-m-j H:i:s'),
		'updated_at'    => date('Y-m-j H:i:s')
	);
	return $this->db->insert('todoListNews_Reply', $data);
}

public function updateTodoListNews($id, $idpseudo, $title, $status, $link, $comment, $important) {

	$data = array(
		'id_pseudo_write' => $idpseudo,
		'title'   	 	  => $title,
		'status'   	 	  => $status,
		'link'      	  => $link,
		'comment'      	  => $comment,
		'important'       => $important,
        'date'            => time(),
        'updated_at'      => date('Y-m-j H:i:s')
	);

	$this->db->where('id', $id);
	return $this->db->update('todoListNews', $data);
}

public function updateValid($id, $idpseudo, $status) {

	$data = array(
		'id_pseudo_write' => $idpseudo,
		'status' 		  => $status,
		'updated_at'	  => date('Y-m-j H:i:s'),
	);

	$this->db->where('id', $id);
	return $this->db->update('todoListNews', $data);
}

public function get_todolist($status, $limit)
{
	$this->db->order_by("updated_at", "desc");
	$query = $this->db->get_where('todoListNews', array(
		'status' => $status
	), $limit);

	return $query->result_array();
}		

public function get_replytodolist($id)
{
	$query = $this->db->get_where('todoListNews_reply', array('id_comment' => $id));
	return $query->result_array();
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

public function addStory($story, $resume, $slug) {

	$data = array(
		'name'   => $story,
		'resume'   => $resume,
		'slug'   => $slug,
		'created_at' => time(),
		'updated_at' => time()
	);

	return $this->db->insert('stories', $data);
}

public function editStory($id, $story, $resume, $slug) {

	$data = array(
		'name'   => $story,
		'resume'   => $resume,
		'slug'   => $slug
	);

	$this->db->where('id', $id);
	return $this->db->update('stories', $data);
}

public function getStory($id)
{
	$this->db->where('isdelete', 0);
	$query = $this->db->get_where('stories',
		array(
			'id' => $id,
		));
	return $query->result_array();
}

public function getListStory()
{
	$this->db->where('isdelete', 0);
	$query = $this->db->get('stories');
	return $query->result_array();
}

public function get_list_news_story($story, $limit)
{

	$this->db->order_by("updated_at", "desc");
	$query = $this->db->get_where('posts', array(
		'story' => $story
	), $limit);

	return $query->result_array();
}

public function getListUsers()
{
	$this->db->where('is_deleted', 0);
	$query = $this->db->get('lmd_users');

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
