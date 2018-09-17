<?php

namespace Model;

class Vehicle extends Base {

    protected
        $fieldConf = array(

    	'lastUpdate' => array(
	        'type' => \DB\SQL\Schema::DT_TIMESTAMP,
	        'default' => \DB\SQL\Schema::DF_CURRENT_TIMESTAMP,
    	),
    	'status' => array(
	        'type' => \DB\SQL\Schema::DT_TINYINT,
	        'default' => 1,
    	),
    	'id' => array(
	    'has-one' => '\Model\Claim','vehicleId'
		),
        ),
        
        $table = 'vehicle',
        $db = 'DB';

}
