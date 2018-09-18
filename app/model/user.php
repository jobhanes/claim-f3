<?php

namespace Model;

class User extends Base {

    protected
        $fieldConf = array(
        
        
        'emailAddess' => array(
	         'type' => \DB\SQL\Schema::DT_VARCHAR128,
	        'index' => true,
	        'unique' => true,
	        ),
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
	    	'has-many' => '\Model\Claim','userId'
		),	    
		'userTypeId' => array(
	    	'belongs-to-one' => '\Model\UserType','_id'
		),	        
        ),
        
        $table = 'user',
        $db = 'DB';


    /**
     * crypt password
     * @param $val
     * @return string
     */
    public function set_password($val) {
        // only change password when a value was given
        if (!$val)
            return $this->password;
        $f3 = \Base::instance();
        $hash_engine = $f3->get('password_hash_engine');
        switch($hash_engine) {
            case 'bcrypt':
                $crypt = \Bcrypt::instance();
                $val = $crypt->hash($val);
                break;
            case 'md5':
                // fall-through
            default:
                $val = md5($val.$f3->get('password_md5_salt'));
                break;
        }
        return $val;
    }

    /**
     * validate email address
     * @param $val
     * @return null
     */
    public function set_mail($val) {
        return \Validation::instance()->email($val)
            ? $val : null;
    }

}
