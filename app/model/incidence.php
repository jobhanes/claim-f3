<?php

namespace Model;

class Incidence extends Base {

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
        ),
        
        $table = 'incidence',
        $db = 'DB';


   
}
