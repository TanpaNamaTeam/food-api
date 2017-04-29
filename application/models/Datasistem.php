<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Datasistem extends CI_Model {



	function listdata($data=null,$table=null,$limit=null,$offset=null){
		
               
		return $this->db->get_where($table,$data,$limit,$offset);
		
	}
        function search($cari){
            
            $this->db->like('name',$cari);
            $this->db->get('food');
            
        }
	function save($data=null,$table=null){
			
		$this->db->insert($table,$data);
		
		return $this->db->insert_id();
	}
	function edit($id=null,$id_name=null,$data=null,$table=null){
		
		$this->db->where($id_name,$id);
			
		return $this->db->update($table,$data);
		
	}
	function remove($data=null,$table=null){
		
		//$this->db->where($id_nama,$id);		
		return $this->db->delete($table,$data);
		
	}

	
}