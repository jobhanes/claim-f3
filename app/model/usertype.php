<?php

namespace Model;

class UserType extends Base {

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
    	'_id' => array(
	    'has-many' => '\Model\User','userTypeId'
		),          
        ),
        $table = 'usertype',
        $db = 'DB';



}
