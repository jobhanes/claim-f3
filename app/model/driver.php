<?php

namespace Model;

class Driver extends Base {

    protected
        $fieldConf = array(

    	'status' => array(
	        'type' => \DB\SQL\Schema::DT_TINYINT,
	        'default' => 1,
    	),
        ),
        
        $table = 'driver',
        $db = 'DB';


   
}
