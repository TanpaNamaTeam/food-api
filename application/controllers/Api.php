<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Api extends CI_Controller {

	public function __construct() {
		// Call the CI_Model constructor
		parent::__construct();
		
                $theapikey = '123456789';
	}
        
	public function index()
	{
		$this->load->view('welcome_message');
	}
        public function get_food(){
            
            $this->output->set_header("Access-Control-Allow-Origin: *");
            
            $apikey = $this->input->post('apikey');
            
            $table = 'food';
            
            $filter = array (
              'food_id' => 1  
            );
            
            if ( $apikey = $theapikey) {
                echo json_encode($this->datasistem->listdata($filter,$table,null,null)->row());
            }
            else {
                echo "wrong API KEY";    
            }
        }
        public function  save_food(){
            
            $this->output->set_header("Access-Control-Allow-Origin: *");
            
            $apikey = $this->input->post('apikey');
            
            $data = (array)json_decode(file_get_contents('php://input'));
	    
            $table = 'food';            
            
            if ( $apikey = $theapikey) {
            
            $this->datasistem->save($data,$table);
	
	      	 $response = array(
	         'Success' => true,
	         'Info' => 'Save');
	
	      	$this->output
	        	->set_status_header(201)
	        	->set_content_type('application/json', 'utf-8')
	        	->set_output(json_encode($response, JSON_PRETTY_PRINT))
	        	->_display();
	        exit;
            }
            else {
                echo "wrong API KEY";    
            }
            
        }
}
