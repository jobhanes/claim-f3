<?php

namespace Model;

class Claim extends Base {

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
		    'belongs-to-one' => '\Model\Vehicle','id'
		),
	    	'ownerId' => array(
		    'belongs-to-one' => '\Model\Owner','id'
		),
			'claimTypeId' => array(
		    'belongs-to-one' => '\Model\ClaimType','id'
		),
		'userId' => array(
		    'belongs-to-one' => '\Model\User','id'
		),
		'insuranceId' => array(
		    'belongs-to-one' => '\Model\Insurance','id'
		),
		'stageId' => array(
		    'belongs-to-one' => '\Model\Stage','id'
		),
        ),
        
        $table = 'claim',
        $db = 'DB';


   
}
