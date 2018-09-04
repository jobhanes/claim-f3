<?php

namespace Controller;


class Auth extends Base
{

    protected
    $response;

    /**
    * init the View
    */
    public function index($f3)
    {
        $this->response->setTemplate('templates/login.html');
    }

    public function beforeroute($f3)
    {
        $this->response = new \View\Login();
    }

    /**
    * check login state
    * @return bool
    */
    static public function isLoggedIn()
    {
        /** @var Base $f3 */
        $f3 = \Base::instance();
        if ($f3->exists('SESSION.user_id')) {
            $user = new \Model\User();
            $user->load(array('id = ?',$f3->get('SESSION.user_id')));
            if (!$user->dry()) {
                $f3->set('BACKEND_USER',$user);
                return true;
            }
        }
        return false;
    }

    /**
    * login procedure
    */
    public function login($f3,$params)
    {
        if ($f3->exists('POST.username') && $f3->exists('POST.password')) {
            sleep(3); // login should take a while to kick - ass brute force attacks
            $user = new \Model\User();
            $user->load(array('username = ?',$f3->get('POST.username')));
            if (!$user->dry()) {
                // check hash engine
                $hash_engine = $f3->get('password_hash_engine');
                $valid       = false;
                if ($hash_engine == 'bcrypt') {
                    $valid = \Bcrypt::instance()->verify($f3->get('POST.password'),$user->password);
                } elseif ($hash_engine == 'md5') {
                    $valid = (md5($f3->get('POST.password').$f3->get('password_md5_salt')) == $user->password);
                }
                
                //$valid = $user->set_password($f3->get('POST.password'))
                if ($valid) {
                    @$f3->clear('SESSION'); //recreate session id
                    
                    //usertype details
                    $userType = new \Model\UserType();
                   	$userType->load(array('id = ?',$user->userTypeId));
                    
                    //store in the session
                    $f3->set('SESSION.user_id',$user->id);
                    $f3->set('SESSION.user_name',$user->username);
                    $f3->set('SESSION.userTypeId',$userType->category);
                    if ($f3->get('CONFIG.ssl_backend'))
                    $f3->reroute('https://'.$f3->get('HOST').$f3->get('BASE').'/admin');
                    else $f3->reroute('/dashboard');
                }
                
            }
            \Flash::instance()->addMessage('Wrong Username/Password ', 'danger');
        }
        $this->response->setTemplate('templates/login.html');
    }

    public function register($f3,$params)
    {
        $f3 = \Base::instance();
        //check the submited fields
        if ($f3->exists('POST.user_type') && $f3->exists('POST.username') && $f3->exists('POST.email') && $f3->exists('POST.password')) {

            $user = new \Model\User();
            $user->load(array('username = ?',$f3->get('POST.username')));
            $user->load(array('emailAddress = ?',$f3->get('POST.email')));
            if ($user->dry()) {
                $user->reset();
                $user->copyfrom('POST','username','password');
                $user->emailAddress = trim($f3->get('POST.email'));
                $user->userTypeId = trim($f3->get('POST.user_type'));
                $user->password = $f3->get('POST.password');
                $user->save();

                //@todo: Send a confirmation Email

                \Flash::instance()->addMessage('Account has been created, a confirmation email has been sent to your email','success');
                //reroute if you want
                $f3->reroute('/auth/register');
            }
            else {
                \Flash::instance()->addMessage('The username or password already taken, please try another one or login','danger');
            }
        }

        $this->response->setTemplate('templates/register.html');
    }

    public function forgot($f3,$params)
    {
        //$f3->clear('SESSION');
        $this->response->setTemplate('templates/forgot.html');
    }

    public function verification($f3,$params)
    {
        //$f3->clear('SESSION');
        $this->response->setTemplate('templates/account_verification.html');
    }

    public function logout($f3,$params)
    {
        $f3->clear('SESSION');
        $f3->reroute('http://'.$f3->get('HOST').$f3->get('BASE').'/');
    }

} 