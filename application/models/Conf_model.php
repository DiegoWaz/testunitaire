<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * User_model class.
 * 
 * @extends CI_Model
 */
class Conf_model extends CI_Model {

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

	public function get_conf($value)
	{
		$this->db->where('isdelete', 0);
		$query = $this->db->get_where('conf', array('wording' => $value));
		return $query->result_array();
	}
	
}
