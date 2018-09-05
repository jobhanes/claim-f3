<?php

namespace View;

class Claims extends Base {

	protected
		$respond;

	public function __construct() {
		
		$this->respond = new \View\Backend();
		/** @var \Base $f3 */
		$f3 = \Base::instance();
		//$f3->set('CONTENT','templates/claim-content.html');
		$f3->set('TOPSCRIPTS','templates/includes/tables-top-scripts.html');
		$f3->set('BOTTOMSCRIPTS','templates/includes/tables-bottom-scripts.html');

	}
	 public function render() {
        /** inherit from the backend template */
        return  $this->respond->render();
    }

}