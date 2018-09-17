<?php

namespace Controller;


class Dashboard extends Base {

    protected
        $response;

	public function __construct(\Base $f3) {
		$f3 = \Base::instance();
		$f3->set('CONTENT','templates/dash-content.html');
		$f3->set('TOPSCRIPTS','templates/includes/dash-top-scripts.html');
		$f3->set('BOTTOMSCRIPTS','templates/includes/dash-bottom-scripts.html');
		
	}

    /**
     * init the View
     */
    public function beforeroute($f3) {
        $this->response = new \View\Backend();
    }
    
    /**
     * Home / frontend controller
     */
    public function index(\Base $f3, $params) {
    	$data = array();
    	$data['name']			= 'Dashboard';
    	$data['icon']			= 'dashboard';
    	//let us count the loaded records
    	$claims 				= new \Model\Claim();
    	
    	//total claims
    	$data['totalCount'] 	= (!$claims->load()->dry) ? $claims->loaded() : 0;
    	
    	//pending Counts
    	$data['pendingCount'] 	= (!$claims->load(array('action = ?','Pending'))->dry) ? $claims->loaded() : 0;
    	
    	//Approved
    	$data['approvedCount'] 	= (!$claims->load(array('action = ?','Solved'))->dry) ? $claims->loaded() : 0;
    	
    	//Rejected
    	$data['rejectedCount'] 	= (!$claims->load(array('action = ?','Rejected'))->dry) ? $claims->loaded() : 0;
    	
    	//recent claims 
    	$recentClaims 			= $claims->afind(NULL)->orderBy('_id DESC');;
    	//$recentClaims			= $recentClaims->orderBy('name DESC');
    	$data['recentClaims']	= $recentClaims;

    	$data['CONTENT']		= 'templates/dash-content.html';
    	$f3->set('page',$data);
        $this->response;
    }   
    
   

} 