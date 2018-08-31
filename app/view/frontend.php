<?php

namespace View;

class Frontend extends Base {
	protected
		$template;

	public function setTemplate($filepath) {
		$this->template = $filepath;
	}
	
    public function render() {
        /** @var \Base $f3 */
        $f3 = \Base::instance();
        if($this->data)
            $f3->mset($this->data);
        return \Template::instance()->render('templates/front_layout.html');
    }

}