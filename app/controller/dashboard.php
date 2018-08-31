<?php

namespace Controller;


class Dashboard extends Base {

    protected
        $response;

    /**
     * init the View
     */
    public function beforeroute($f3) {
        $this->response = new \View\Backend();
    }
    
    /**
     * Home / frontend controller
     */
    public function index() {
        $this->response->setTemplate('templates/index.html');
    }   
    
   

} 