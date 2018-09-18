<?php

namespace Controller;


class Claims extends Base {

    protected
        $response;

    /*public function __construct(\Base $f3)
    {
		
	} */
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
    	//from the database 
    	$claim_details 	= new \Model\Claim();
    	$claim_details->load();
    	if(!$claim_details->dry())
    	{
			$historyclaims = $claim_details->afind(NULL);		
		}
    	$data['claim_data'] = $historyclaims;  
    	$data['CONTENT']= 'templates/claim-content.html';
    	$f3->set('page',$data);	    	
        $this->response;
    }    
    
    public function pending(\Base $f3, $params) {
    	$data = array();
    	$data['name']	= 'Pending Claims';
    	$data['status']	= 'warning';
    	$data['icon']	= 'exclamation';
    	//from the database 
    	$claim_details 	= new \Model\Claim();
    	//$claim_details->load();
    	$claim_details->load();
    	if(!$claim_details->dry())
    	{
			$pendingclaims = $claim_details->afind(array('action = ?','Pending'));
			//post the data in the table 
			//echo "<pre>";
			//print_r($pendingclaims);
			//echo "</pre>";
			//foreach($pendingclaims as $item)
			//echo $item['insuranceId']."<br>";
			//exit();
			
		}
		//print_r($pendingclaims);
		//exit();
    	$data['claim_data'] = $pendingclaims;
    	$data['CONTENT']	= 'templates/claim-content.html';
    	$f3->set('page',$data);
        $this->response;
    }     
    
    public function approved(\Base $f3, $params) {
    	$data = array();
    	$data['name']	= 'Approved Claims';
    	$data['status']	= 'success';
    	$data['icon']	= 'check'; 
    	//from the database 
    	$claim_details 	= new \Model\Claim();
    	$claim_details->load();
    	if(!$claim_details->dry())
    	{
			$solvedclaims = $claim_details->afind(array('action = ?','Solved'));		
		}
    	$data['claim_data'] = $solvedclaims;    	
    	$data['CONTENT']= 'templates/claim-content.html';   	
    	$f3->set('page',$data);
        $this->response;
    }    
    
    public function rejected(\Base $f3, $params) {
    	$data = array();
    	$data['name']	= 'Rejected Claims';
    	$data['status']	= 'danger';
    	$data['icon']	= 'ban';
    	//from the database 
    	$claim_details 	= new \Model\Claim();
    	$claim_details->load();
    	if(!$claim_details->dry())
    	{
			$rejectedclaims = $claim_details->afind(array('action = ?','Rejected'));		
		}
    	$data['claim_data'] = $rejectedclaims;
    	$data['CONTENT']= 'templates/claim-content.html';
    	$f3->set('page',$data);
        $this->response;
    }    
    
    public function processing(\Base $f3, $params) {
    	$data = array();
    	$data['name']	= 'Processing Claims';
    	$data['status']	= 'info';
    	$data['icon']	= 'spinner';
    	//from the database 
    	$claim_details 	= new \Model\Claim();
    	$claim_details->load();
    	if(!$claim_details->dry())
    	{
			$processingclaims = $claim_details->afind(array('action = ?','Processing'));		
		}
    	$data['claim_data'] = $processingclaims;
    	$data['CONTENT']= 'templates/claim-content.html';
    	$f3->set('page',$data);
        $this->response;
    }   
    
    public function fileClaim(\Base $f3, $params){
		//create the claim number right here
		$claim			= new \Model\Claim();
		$claimNo		= $claim->claim_gen('New');
		$f3->set('SESSION.claimNo',$claimNo);
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
				$this->driverFill($f3, $params);
			}
			
			//fill the Damage details
	    	if($f3->exists('POST.btn_damage'))
	    	{
				$this->damageFill($f3, $params);
			}
			
			//fill the upload details
	    	if($f3->exists('POST.btn_upload'))
	    	{
				$this->uploadFill($f3, $params);
			}
			
			//fill the Incidence details
	    	if($f3->exists('POST.btn_incidence'))
	    	{
				$this->IncidenceFill($f3, $params);
				
			}
			if($f3->exists('POST.btn_vehicle') && $f3->exists('POST.btn_driver') && $f3->exists('POST.btn_damage') && $f3->exists('POST.btn_upload') && $f3->exists('POST.btn_incidence'))
			{
				$this->claimFill($f3, $params);
			}
		}
    	
		//$f3->reroute('/auth/register'); 
    	$f3->set('page',$data);
        $this->response;
	}
	
	//Claim
	public function claimFill(\Base $f3, $params)
	{
		//file
		//if ($f3->get('VERB') == 'POST')
		//{ 
			$claim = new \Model\Claim();
			$claim->claimNo		 	= $f3->get('SESSION.claimNo');
			$claim->insuranceId 	= $f3->get('SESSION.insurance');
            $claim->userId 			= $f3->get('SESSION.user_id');
            $claim->claimTypeId 	= $f3->get('SESSION.claimTypeId');
            $claim->vehicleId 		= $f3->get('SESSION.vehicleId');
            $claim->ownerId 		= $f3->get('SESSION.ownerId');
            $claim->stageId 		= '1';
            $claim->action 			= 'Pending';
            $claim->save();
			
		//}
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
                $vehicle->copyfrom('POST','registrationNo','claimId','policyNo','exp_date','make','model','color','year_of_manufacture','claim_type','ownerName','ownerEmail','claimNo','insurance');
                $vehicle->registrationNo 	= trim($f3->get('POST.registrationNo'));
                //set vehicle sessions 
 				$f3->set('SESSION.insurance',trim($f3->get('POST.insurance')));
 				$f3->set('SESSION.claimNo',trim($f3->get('POST.claimNo')));
 				$f3->set('SESSION.claimId',trim($f3->get('POST.claimId')));
                $vehicle->make 				= trim($f3->get('POST.make'));
                $vehicle->model 			= trim($f3->get('POST.model'));
                $vehicle->yearOfManufacture = trim($f3->get('POST.year_of_manufacture'));
                $vehicle->category 			= trim($f3->get('POST.vehicleCategory'));           
                $vehicle->policyNo 			= trim($f3->get('POST.policyNo'));
                $vehicle->expiryDate 		= trim($f3->get('POST.exp_date'));
                $vehicle->save();
                //store the inserted id
                $vehicle->load();
                $vehicle->loaded();
                $vehicle->last();
                $lastVehicleId				= $vehicle->_id;
                $f3->set('SESSION.vehicleId',$lastVehicleId);
                
                //owner details
                $owner = new \Model\Owner();
                $owner->load(array('emailAddress = ?',$f3->get('POST.ownerEmail')));
                if($owner->dry())
                {
					$owner->reset();
					$owner->fullName 		= trim($f3->get('POST.ownerName'));
                	$owner->emailAddress 	= trim($f3->get('POST.ownerEmail'));
                	$owner->idNumber 		= trim($f3->get('POST.idNumber'));
                	$owner->physicalAddress = trim($f3->get('POST.address'));
                	$owner->save();
                	
                	//store the inserted id
                	$owner->load();
                	$owner->loaded();
                	$ownerLast 				= $owner->last();
                	
                	$f3->set('SESSION.ownerId',$ownerLast->_id);
				}
                
                
				//\Flash::instance()->addMessage('Sucessfully inserted the vehicle details','success');
            }
            else
            //@todo: You can update this data or just leave it.
             \Flash::instance()->addMessage('This car details are already available','danger');
		} 
		       
	}
   
   
   //Fill the filing Driver's details
	public function driverFill(\Base $f3, $params)
	{	
		if ($f3->get('VERB') == 'POST')
		{
			$driver = new \Model\Driver();
        	$driver->load(array('lincenceNo = ?',$f3->get('POST.lincence')));
            if ($driver->dry()) {
                // the Driver doesnt exist
                $driver->reset();
                $driver->copyfrom('POST','claimId','firstName','lastName','phone','dob','lincence','expiry_date','experience','dl_category');
                $driver->claimId 		= trim($f3->get('POST.claimId'));
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
                
				//\Flash::instance()->addMessage('Sucessfully inserted the Driver\'s details','success');
            }
            else
            //@todo: You can update this data or just leave it.
             \Flash::instance()->addMessage('This Driver details are already available','danger');
		} 
		       
	}
   
	//Fill the filling Damage details
	public function damageFill(\Base $f3, $params)
	{	
		if ($f3->get('VERB') == 'POST')
		{
			$damage = new \Model\Damage();
        	$damage->load(array('claimId = ?',$f3->get('POST.claimId')));
            if ($damage->dry()) {
                // the damage doesnt exist
                $damage->reset();
                $damage->copyfrom('POST','claimId','damageDesc','still_in_use','repairDate','repairPlace','otherDamages','property_owner_name','property_owner_phone','damaged_car_reg_no','injured_name','injured_phone','kin_name','relationship_type');
                
                $damage->claimId 				= trim($f3->get('POST.claimId'));
                $damage->damageDesc 			= trim($f3->get('POST.damageDesc')); 
                //store options in Json 
                $damageoptions					= array();
                $damageoptions['stillInUse']	= trim($f3->get('POST.still_in_use'));
                $damageoptions['repairDate']	= trim($f3->get('POST.repairDate'));
                $damageoptions['repairPlace']	= trim($f3->get('POST.repairPlace'));
                $damage->optionCategory 		= json_encode($damageoptions);
                $damage->otherDamages 			= trim($f3->get('POST.otherDamages'));
                //store damaged owner details
                $ownerDetails					= array();
                $ownerDetails['pOwnerName']		= trim($f3->get('POST.property_owner_name'));
                $ownerDetails['pOwnerPhone']	= trim($f3->get('POST.property_owner_phone'));
                $ownerDetails['damagedCarNo']	= trim($f3->get('POST.damaged_car_reg_no'));
                $damage->ownerDetails 			= json_encode($ownerDetails);
                //store persons injured
                $personsInj						= array();
                $personsInj['injuredName']		= trim($f3->get('POST.injured_name'));
                $personsInj['injuredPhone']		= trim($f3->get('POST.injured_phone'));
                $personsInj['kinName']			= trim($f3->get('POST.kin_name'));
                $personsInj['relationship']		= trim($f3->get('POST.relationship_type'));
                $damage->personsInured 			= json_encode($personsInj);
                $damage->save();
                
				//\Flash::instance()->addMessage('Sucessfully inserted the Damage details','success');
            }
            else
            //@todo: You can update this data or just leave it.
             \Flash::instance()->addMessage('This Damage details are already available','danger');
		}
		       
	}
      
   //Fill the Upload files
	public function uploadFill(\Base $f3, $params)
	{	
		if ($f3->get('VERB') == 'POST')
		{
			$upload = new \Model\Document();
        	$upload->load(array('claimId = ?',$f3->get('POST.claimId')));
            if ($upload->dry()) {
                // the upload doesnt exist
                $upload->reset();
                $upload->copyfrom('POST','claimId','photos','licenceDoc','idDoc','video');
                $upload->claimId 			= trim($f3->get('POST.claimId'));
                $upload->licence 			= trim($f3->get('POST.licenceDoc'));
                $upload->identityDocument 	= trim($f3->get('POST.idDoc'));
                $upload->video 				= trim($f3->get('POST.video'));
                $upload->photo 				= trim($f3->get('POST.photos'));
                $upload->save();
                
				//\Flash::instance()->addMessage('Sucessfully uploaded the files','success');
            }
            else
            //@todo: You can update this data or just leave it.
             \Flash::instance()->addMessage('This upload documents are already available','danger');
		}  
	}
	
	//Incidence Filling 
    //Fill the Upload files
	public function IncidenceFill(\Base $f3, $params)
	{	
		if ($f3->get('VERB') == 'POST')
		{
			$incidence = new \Model\Incidence();
        	$incidence->load(array('claimId = ?',$f3->get('POST.claimId')));
            if ($incidence->dry()) {
                // the Incidence doesnt exist
                $incidence->reset();
                $incidence->copyfrom('POST','claimId','incidence_date','incidence_time','claimTypeId','incidence_location','incidence_desc','incidence_reported');
                $incidence->claimId 			= trim($f3->get('POST.claimId'));
                $incidence->date 				= trim($f3->get('POST.incidence_date'));
                $incidence->time 				= trim($f3->get('POST.incidence_time'));
                $incidence->location 			= trim($f3->get('POST.incidence_location'));
                $incidence->description 		= trim($f3->get('POST.incidence_desc'));
                $incidence->reported 			= trim($f3->get('POST.incidence_reported'));
                $incidence->claimtypeId 		= trim($f3->get('POST.claimTypeId'));
                //store session
                $f3->set('SESSION.claimTypeId',trim($f3->get('POST.claimTypeId')));
                $incidence->save();
                
                //check the claimType selected
                //if accident
                if($f3->get('POST.claimTypeId')==1){
					$accident = new \Model\Accident();
        			$accident->load(array('claimId = ?',$f3->get('POST.claimId')));
	        		if ($accident->dry()) {
	        			$accident->reset();
	        			$accident->copyfrom('POST','accident_speed','weather');
	        			$accident->claimId 			= trim($f3->get('POST.claimId'));
	        			//$accident->driving 			= trim($f3->get('POST.accident_driver'));
	        			$accident->speed 			= trim($f3->get('POST.accident_speed'));
	                	$accident->weather 			= trim($f3->get('POST.weather'));
	                	$accident->save();
	                	
					}
				}
                 
                 //if Theft
                 if($f3->get('POST.claimTypeId')==2){
					$theft = new \Model\Theft();
        			$theft->load(array('claimId = ?',$f3->get('POST.claimId')));
	        		if ($theft->dry()) {
	        			$theft->reset();
	        			$theft->copyfrom('POST','theft_type','stolen_parts');
	        			$theft->claimId 			= trim($f3->get('POST.claimId'));
	        			$theft->category 			= trim($f3->get('POST.theft_type'));
	                	$theft->parts 				= trim($f3->get('POST.stolen_parts'));
	                	$theft->save();
	                	
					}
				}
                
				//\Flash::instance()->addMessage('Sucessfully saved the Incidence details','success');
            }
            else
            //@todo: You can update this data or just leave it.
             \Flash::instance()->addMessage('This incidence details are already available','danger');
		}  
	}
	


} 