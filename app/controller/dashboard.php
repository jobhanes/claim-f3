<?php

namespace Controller;


class Dashboard extends Base {

    protected $response;
    protected $userId;

	public function __construct(\Base $f3) {
		$f3 = \Base::instance();
		$this->userId 	= $f3->get('SESSION.user_id');
		//check id 
		if(!empty($this->userId))
		{
			$f3->set('CONTENT','templates/dash-content.html');
			$f3->set('TOPSCRIPTS','templates/includes/dash-top-scripts.html');
			$f3->set('BOTTOMSCRIPTS','templates/includes/dash-bottom-scripts.html');
		}
		else
		{
			$f3->reroute('/auth');
		}	
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
    	
    	//dashboard tests
    	//$claim	= new \Model\Claim();
    	
    	//$lastClaim = $claim->claim_gen('PSV',2);
    	//echo "<pre>";
		//print_r($lastClaim);
		//echo "</pre>";
    	//exit();
    	//let us count the loaded records
    	$claims 				= new \Model\Claim();
    	
    	//total claims
    	$data['totalCount'] 	= (!$claims->load(array('userId = ?',$this->userId))->dry) ? $claims->loaded() : 0;
    	
    	//pending Counts
    	$data['pendingCount'] 	= (!$claims->load(array('userId = ? AND action = ?',$this->userId,'Pending'))->dry) ? $claims->loaded() : 0;
    	
    	//Approved
    	$data['approvedCount'] 	= (!$claims->load(array('userId = ? AND action = ?',$this->userId,'Solved'))->dry) ? $claims->loaded() : 0;
    	
    	//Rejected
    	$data['rejectedCount'] 	= (!$claims->load(array('userId = ? AND action = ?',$this->userId,'Rejected'))->dry) ? $claims->loaded() : 0;
    	
    	//recent claims 
    	$claims					= $claims->load();
    	$recentClaims 			= $claims->find(array('userId = ?',$this->userId), array('limit'=>5, 'order'=>'id DESC'));
    	//$recentClaims			= $recentClaims->orderBy('name DESC');
    	$data['recentClaims']	= $recentClaims;

    	$data['CONTENT']		= 'templates/dash-content.html';
    	$f3->set('page',$data);
        $this->response;
    }   
    
   

} 