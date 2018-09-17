<?php

namespace Model;

class ClaimType extends Base {

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
    	'id' => array(
	    	'has-one' => '\Model\Claim','claimTypeId'
		),
        ),
        
        $table = 'claimtype',
        $db = 'DB';


   
}
