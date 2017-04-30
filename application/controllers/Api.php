<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Api extends CI_Controller {

	public function __construct() {
		// Call the CI_Model constructor
		parent::__construct();
		
                
	}
        
	public function index()
	{
		$this->load->view('welcome_message');
	}
        public function get_food(){
            
            $theapikey = '123456789';
            $this->output->set_header("Access-Control-Allow-Origin: *");
            
            $apikey = $this->input->post('apikey');
            //$apikey = '123456789';
            $table = 'food';
            
            
            
            //if ( $apikey == $theapikey) {
                
                $foodid = $this->input->post('food_id');
                
                //$foodid = 1;
                
                if ($foodid == null){
                    echo "food: ",echo json_encode($this->datasistem->listdata(null,$table,null,null)->result());
                    echo "staleness",json_encode($this->datasistem->listdata($filter,'staleness',null,null)->result());

                }
                else{
                    
                    $filter = array (
                    'food_id' => $foodid
                    );
                    echo "food: ",json_encode($this->datasistem->listdata($filter,$table,null,null)->result());
                    echo "status: ",json_encode($this->datasistem->listdata($filter,'status',null,null)->result());
                    echo "expiry: ",json_encode($this->datasistem->listdata($filter,'expiry',null,null)->result());
                    echo "staleness",json_encode($this->datasistem->listdata($filter,'staleness',null,null)->result());
                }
            //}
            //else {
                //echo "wrong API KEY";    
            //}
        }
        public function  save_food(){
            
            $theapikey = '123456789';
            $this->output->set_header("Access-Control-Allow-Origin: *");
            
            $apikey = $this->input->post('apikey');
            
            $data = (array)json_decode(file_get_contents('php://input'));
	    
            $table = 'food';            
            
            //if ( $apikey == $theapikey) {
            
            $uploaddir = './uploads/';
            $file_name = sha1($_FILES['file']['image']);
            $uploadfile = $uploaddir.$file_name;

            if (move_uploaded_file($_FILES['file']['tmp_name'], $uploadfile)) {
                $data['image'] = $file_name;
            } 
     
                
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
            //}
            //else {
                //echo "wrong API KEY";    
            //}
            
        }
        public function search_food(){
            
            $this->output->set_header("Access-Control-Allow-Origin: *");
            
            $theapikey = '123456789';
            
            //if ( $apikey == $theapikey) {
                echo $this->datasistem->search($this->input->post('search'))->result();
            //}
            //else {
                //echo "wrong API KEY";    
            //}
        }
}
