<?php

namespace Controller;


class Test extends Base {

    protected
        $response;

    /**
     * init the View
     */
    public function beforeroute($f3) {
        $this->response = new \View\Test();
    }
    
    /**
     * Home / frontend controller
     */
 //testing Unit
    public function test() {
       
        $this->response->setTemplate('templates/test_layout.html');
    }
    
    

} 