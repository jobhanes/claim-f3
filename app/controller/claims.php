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
    	$this->response->topscripts('templates/includes/forms-top-css.html');
    	$data['CONTENT']= 'templates/new-claim.html';
    	$this->response->bottomscripts('templates/includes/forms-bottom-scripts.html');
    	//$this->response->otherbottomscripts('templates/includes/forms-validation-script.html');
    	
    	if ($f3->get('VERB') == 'POST')
    	{
			//fill the car details
			if($f3->exists('POST.btn_vehicle'))
			{
				$this->vehicleFill($f3, $params);
			}
	    	
	    	//fill the Driver's details
	    	if($f3->exists('POST.btn_driver'))
	    	{
				$this->DriverFill($f3, $params);
			}
		}
    	
		//$f3->reroute('/auth/register'); 
    	$f3->set('page',$data);
        $this->response;
	}
	
	//Fill the filing vehicle details
	public function vehicleFill(\Base $f3, $params)
	{	
		if ($f3->get('VERB') == 'POST')
		{
			$vehicle = new \Model\Vehicle();
        	$vehicle->load(array('registrationNo = ?',$f3->get('POST.registrationNo')));
            if ($vehicle->dry()) {
                // the car doesnt exist
                $vehicle->reset();
                $vehicle->copyfrom('POST','registrationNo','policyNo','exp_date','make','model','color','year_of_manufacture','claim_type','ownerName','ownerEmail','claimNo');
                $vehicle->registrationNo 	= trim($f3->get('POST.registrationNo'));
                $vehicle->make 				= trim($f3->get('POST.make'));
                $vehicle->model 			= trim($f3->get('POST.model'));
                $vehicle->yearOfManufacture = trim($f3->get('POST.year_of_manufacture'));
                $vehicle->policyNo 			= trim($f3->get('POST.policyNo'));
                $vehicle->expiryDate 		= trim($f3->get('POST.exp_date'));
                $vehicle->save();
                
				\Flash::instance()->addMessage('Sucessfully inserted the vehicle details','success');
            }
            else
            //@todo: You can update this data or just leave it.
             \Flash::instance()->addMessage('This car details are already available','danger');
		} 
		       
	}
   
   
   //Fill the filing Driver's details
	public function DriverFill(\Base $f3, $params)
	{	
		if ($f3->get('VERB') == 'POST')
		{
			$driver = new \Model\Driver();
        	$driver->load(array('lincenceNo = ?',$f3->get('POST.lincence')));
            if ($driver->dry()) {
                // the Driver doesnt exist
                $driver->reset();
                $driver->copyfrom('POST','claimNo','firstName','lastName','phone','dob','lincence','expiry_date','experience','dl_category');
                $driver->claimId 		= trim($f3->get('POST.claimNo'));
                $driver->lincenceNo 	= trim($f3->get('POST.lincence'));
                $driver->firstName 		= trim($f3->get('POST.firstName'));
                $driver->lastName 		= trim($f3->get('POST.lastName'));
                $driver->phone 			= trim($f3->get('POST.phone'));
                $driver->idNumber 		= trim($f3->get('POST.idnumber'));
                $driver->dob 			= trim($f3->get('POST.dob'));
                $driver->expiryDate 	= trim($f3->get('POST.dl_expiry_date'));
                $driver->experience 	= trim($f3->get('POST.experience'));
                
                //categories are imploded
				if($f3->exists('POST.dl_category')){ 
					$category 			= $f3->get('POST.dl_category'); 
					$selectedOption 	= "";
					foreach ($category as $option => $value) {
						$selectedOption .= $value.','; // I am separating Values with a comma (,) so that I can extract data using explode()
					}
				$driver->category 		= rtrim($selectedOption,',');//remove the last comma
				}	
				
                $driver->save();
                
				\Flash::instance()->addMessage('Sucessfully inserted the Driver\'s details','success');
            }
            else
            //@todo: You can update this data or just leave it.
             \Flash::instance()->addMessage('This Driver details are already available','danger');
		} 
		       
	}
   
	//Fill the filling Damage details
	public function DamageFill(\Base $f3, $params)
	{	
		if ($f3->get('VERB') == 'POST')
		{
			$damage = new \Model\Damage();
        	$damage->load(array('claimId = ?',$f3->get('POST.claimNo')));
            if ($damage->dry()) {
                // the damage doesnt exist
                $damage->reset();
                $damage->copyfrom('POST','claimNo','damageDesc','still_in_use','repairDate','repairPlace','otherDamages','property_owner_name','property_owner_phone','damaged_car_reg_no','injured_name','injured_phone','kin_name','relationship_type');
                $damage->claimId 		= trim($f3->get('POST.claimNo'));
                $damage->damageDesc 	= trim($f3->get('POST.damageDesc'));
                //store
                $damage->optionCategory = ''; //trim($f3->get('POST.model'));
                $damage->otherDamages 	= ''; //trim($f3->get('POST.year_of_manufacture'));
                $damage->ownerDetails 	= ''; //trim($f3->get('POST.policyNo'));
                $damage->personsInured 	= ''; //trim($f3->get('POST.exp_date'));
                $damage->save();
                
				\Flash::instance()->addMessage('Sucessfully inserted the Damage details','success');
            }
            else
            //@todo: You can update this data or just leave it.
             \Flash::instance()->addMessage('This Damage details are already available','danger');
		}
		       
	}
      

} 