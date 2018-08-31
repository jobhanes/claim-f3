<?php

namespace View;

class Test extends Base {

	protected
		$template;

	public function __construct() {
		/** @var \Base $f3 */
		//$f3 = \Base::instance();
		// change UI path to backend layout dir
		//$f3->copy('BACKEND_UI','UI');

		//$f3->set('ASSETS.filter.js','combine');

		// save last visited URL
		//if ($f3->exists('SESSION.CurrentPageURL')) {
		//	if ($f3->get('SESSION.CurrentPageURL') != $f3->get('PARAMS.0'))
		//		$f3->copy('SESSION.CurrentPageURL', 'SESSION.LastPageURL');
		//} else
		//	$f3->set('SESSION.LastPageURL', '');
		//$f3->set('SESSION.CurrentPageURL', $f3->get('PARAMS.0'));
	}

	public function setTemplate($filepath) {
		$this->template = $filepath;
	}

	 public function render() {
        /** @var \Base $f3 */
        $f3 = \Base::instance();
        if($this->data)
            $f3->mset($this->data);
        return \Template::instance()->render('templates/test_layout.html');
    }

}