<?php

namespace Controller;


class Claims extends Base {

    protected
        $response;

    /**
     * init the View
     */
    public function beforeroute($f3) {
        $this->response = new \View\Claims();
    }
    
    /**
     * Home / frontend controller
     */
    public function index(\Base $f3, $params) {
    	$data['name']	= 'History';
    	$data['status']	= 'info';
    	$data['icon']	= 'history';
    	$data['CONTENT']= 'templates/claim-content.html';
    	$f3->set('page',$data);	    	
        $this->response;
    }    
    
    public function pending(\Base $f3, $params) {
    	$data = array();
    	$data['name']	= 'Pending Claims';
    	$data['status']	= 'warning';
    	$data['icon']	= 'exclamation';
    	$data['CONTENT']= 'templates/claim-content.html';
    	$f3->set('page',$data);
        $this->response;
    }     
    
    public function approved(\Base $f3, $params) {
    	$data = array();
    	$data['name']	= 'Approved Claims';
    	$data['status']	= 'success';
    	$data['icon']	= 'check'; 
    	$data['CONTENT']= 'templates/claim-content.html';   	
    	$f3->set('page',$data);
        $this->response;
    }    
    
    public function rejected(\Base $f3, $params) {
    	$data = array();
    	$data['name']	= 'Rejected Claims';
    	$data['status']	= 'danger';
    	$data['icon']	= 'ban';
    	$data['CONTENT']= 'templates/claim-content.html';
    	$f3->set('page',$data);
        $this->response;
    }    
    
    public function processing(\Base $f3, $params) {
    	$data = array();
    	$data['name']	= 'Processing Claims';
    	$data['status']	= 'info';
    	$data['icon']	= 'spinner';
    	$data['CONTENT']= 'templates/claim-content.html';
    	$f3->set('page',$data);
        $this->response;
    }   
    
    public function fileClaim(\Base $f3, $params){
		$data = array();
    	$data['name']	= 'New Claim';
    	$data['status']	= 'info';
    	$data['icon']	= 'spinner';
    	$data['CONTENT']= 'templates/claim-content.html';
    	$f3->set('page',$data);
        $this->response;
	}
   

} 