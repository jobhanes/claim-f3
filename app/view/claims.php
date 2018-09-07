<?php

namespace View;

class Claims extends Base {

	protected $respond;
	protected $top_scripts;
	protected $bottom_scripts;
	protected $other_bottom_scripts;

	public function __construct() {
		
		$this->respond = new \View\Backend();
		/** @var \Base $f3 */
		$f3 = \Base::instance();
		//$f3->set('CONTENT','templates/claim-content.html');
		$f3->set('TOPSCRIPTS','templates/includes/tables-top-scripts.html');
		$f3->set('BOTTOMSCRIPTS','templates/includes/tables-bottom-scripts.html');
		//$f3->set('OTHERBOTTOMSCRIPTS','templates/includes/forms-validation-script.html');

	}
	/* top scripts */
	public function topscripts($template)
	{
		$f3 = \Base::instance();
		$this->top_scripts= $f3->set('TOPSCRIPTS',$template);
		return $this->top_scripts;
		
	}
	
	/* bottom scripts */
	public function bottomscripts($template)
	{
		$f3 = \Base::instance();
		$this->bottom_scripts= $f3->set('BOTTOMSCRIPTS',$template);
		return $this->bottom_scripts;
		
	}		
	
	/* bottom scripts */
	public function otherbottomscripts($template)
	{
		$f3 = \Base::instance();
		$this->other_bottom_scripts	= $f3->set('OTHERBOTTOMSCRIPTS',$template);
		return $this->other_bottom_scripts;
		
	}
	
	public function render() {
        /** inherit from the backend template */
        return  $this->respond->render();
    }

}