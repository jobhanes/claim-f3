<?php

namespace View;

class Backend extends Base {

	protected
		$template;

	public function __construct() {
		/** @var \Base $f3 */
		$f3 = \Base::instance();
		$auth	= new \Controller\Auth();
		if($auth->isLoggedIn()===true)
		{
			// change UI path to backend layout dir
			$f3->copy('BACKEND_UI','UI');
			$f3->set('FOOTER','templates/includes/footer.html');
			$f3->set('THEMESETTINGS','templates/includes/theme-settings.html');
			$f3->set('HEADER','templates/includes/header.html');
			$f3->set('SIDEBAR','templates/includes/sidebar.html');
			//$f3->set('CONTENT','templates/includes/content.html');
			$f3->set('CHATBAR','templates/includes/chatbar.html');
			
			//$f3->set('ASSETS.filter.js','combine');

			// save last visited URL
			if ($f3->exists('SESSION.CurrentPageURL')) {
			if ($f3->get('SESSION.CurrentPageURL') != $f3->get('PARAMS.0'))
					$f3->copy('SESSION.CurrentPageURL', 'SESSION.LastPageURL');
			} else
				$f3->set('SESSION.LastPageURL', '');
			$f3->set('SESSION.CurrentPageURL', $f3->get('PARAMS.0'));
		}
		else
		{
			$f3->reroute('/auth/login');
		}
		
	}

	public function setTemplate($filepath) {
		$this->template = $filepath;
	}

	 public function render() {
        /** @var \Base $f3 */
        $f3 = \Base::instance();
        if($this->data)
            $f3->mset($this->data);
        return \Template::instance()->render('templates/admin_layout.html');
    }

}