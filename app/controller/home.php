<?php

namespace Controller;


class Home extends Base {

    protected
        $response;

    /**
     * init the View
     */
    public function beforeroute($f3) {
        $this->response = new \View\Frontend();
    }
    
    /**
     * Home / frontend controller
     */
    public function index() {
       
        $this->response->setTemplate('templates/layout.html');
    }
    

} 