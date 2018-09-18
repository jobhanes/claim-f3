<?php

namespace Model;

class Claim extends Base {
	
	//static claimClass;
	const claimClass = __CLASS__;
    protected
        $fieldConf = array(

		'dateCreated' => array(
	        'type' => \DB\SQL\Schema::DT_TIMESTAMP,
	        'default' => \DB\SQL\Schema::DF_CURRENT_TIMESTAMP,
    	),
    	'lastUpdate' => array(
	        'type' => \DB\SQL\Schema::DT_TIMESTAMP,
	        'default' => \DB\SQL\Schema::DF_CURRENT_TIMESTAMP,
    	),
    	'status' => array(
	        'type' => \DB\SQL\Schema::DT_TINYINT,
	        'default' => 1,
    	),
	    	'vehicleId' => array(
		    'belongs-to-one' => '\Model\Vehicle','_id'
		),
	    	'ownerId' => array(
		    'belongs-to-one' => '\Model\Owner','_id'
		),
			'claimTypeId' => array(
		    'belongs-to-one' => '\Model\ClaimType','_id'
		),
			'userId' => array(
		    'belongs-to-one' => '\Model\User','_id'
		),
		'insuranceId' => array(
		    'belongs-to-one' => '\Model\Insurance','_id'
		),
		'stageId' => array(
		    'belongs-to-one' => '\Model\Stage','_id'
		),
        ),
        
        $table = 'claim',
        $db = 'DB';

		/* Claim autoogeneration Algorithm
	     * @param $cat the category of the car
	     * @return string e.g C/CAT/000001/018
	     */
	    public function claim_gen($cat) {
	        if(!empty($cat))
	        {
				//all params suplied let's proceed
				$cat	= strtoupper($cat);
				//check the id format and format it
				$claim = new Claim();
				$claim->load();
    			$claim->loaded();
    			$claim->_id;
    			$id = $claim->last();
    			$id			= $id->_id;
    			//echo $claim->_id;
				$id			= $id+1; //increament 
				$id 		= sprintf('%06d', $id);
				$yr			= sprintf('%03d',date('y'));
				$claimNo	= 'C/'.$cat.'/'.$id.'/'.$yr;
				return 		$claimNo;
			}
			
	    }
   
}
