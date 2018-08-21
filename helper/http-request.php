<?php
require_once('utility.php');
require_once('/../Db.class.php');
require_once('/../api/user/user.dao.php');
/**
 * Access the HTTP Request
 * 
 * Found on http://www.daniweb.com/web-development/php/code/216846/get-http-request-headers-and-body
 */
class http_request
{

    /** additional HTTP headers not prefixed with HTTP_ in $_SERVER superglobal */
    public $add_headers = array('CONTENT_TYPE', 'CONTENT_LENGTH');
    private $utility;
    private $db;
    private $userDAO;
    private $TIME_OUT = 60 * 30; // second to time out token

    /**
     * Construtor
     * Retrieve HTTP Body
     * @param Array Additional Headers to retrieve
     */
    function http_request($add_headers = false)
    {
        $this->utility = new Utility();
        $this->db = new DB();
        $this->userDAO = new UserDAO();

        $this->retrieve_headers($add_headers);
        $this->body = @file_get_contents('php://input');

        $caseAuth = $this->checkAuth();
        switch ($caseAuth) {
            case 2:
            case 3:
                $timeNow = microtime(true);
                $this->userDAO->last_time = $timeNow;
                $update = $this->userDAO->save();
            break;
        }
    }

    function checkAuth()
    {
        if (strpos($_SERVER['REQUEST_URI'], 'login')) {
            // Login
            return 1;
        }
        if ($this->utility->IsNullOrEmptyString($this->headers['TOKEN'])) {
            $this->sendJsonResponse('You have not TOKEN', 401);
            die();
        }
        $tokenDecode = $this->utility->JWT_decode($this->headers['TOKEN']);
        // Lay Username, pass dang nhap lai
        $this->userDAO = new UserDAO();
        $this->userDAO->username = $tokenDecode->username;
        $this->userDAO->password = $tokenDecode->password;
        $this->userDAO->find();

        if (!$this->userDAO || !$this->userDAO->username) {
            $this->sendJsonResponse('TOKEN not correct _null', 401);
            die();
        }
        if ($this->utility->IsNullOrEmptyString($this->userDAO->token)) {
            // First time login
            $this->userDAO->token = $this->headers['TOKEN'];
            return 2;
        }
        if ($this->userDAO->token != $this->headers['TOKEN']) {
            $this->sendJsonResponse('TOKEN not correct', 401);
            die();
        }

        $timeNow = microtime(true);
        if ($timeNow - $this->userDAO->last_time > $this->TIME_OUT) {
            $this->sendJsonResponse('TOKEN expired', 401, $timeNow - $this->userDAO->last_time);
            die();
        }
        return 3;
    }

    /**
     * Retrieve the HTTP request headers from the $_SERVER superglobal
     * @param Array Additional Headers to retrieve
     */
    function retrieve_headers($add_headers = false)
    {

        if ($add_headers) {
            $this->add_headers = array_merge($this->add_headers, $add_headers);
        }

        if (isset($_SERVER['HTTP_METHOD'])) {
            $this->method = $_SERVER['HTTP_METHOD'];
            unset($_SERVER['HTTP_METHOD']);
        } else {
            $this->method = isset($_SERVER['REQUEST_METHOD']) ? $_SERVER['REQUEST_METHOD'] : false;
        }
        $this->protocol = isset($_SERVER['SERVER_PROTOCOL']) ? $_SERVER['SERVER_PROTOCOL'] : false;
        $this->request_method = isset($_SERVER['REQUEST_METHOD']) ? $_SERVER['REQUEST_METHOD'] : false;

        $this->headers = array();
        foreach ($_SERVER as $i => $val) {
            if (strpos($i, 'HTTP_') === 0 || in_array($i, $this->add_headers)) {
                $name = str_replace(array('HTTP_', '_'), array('', '-'), $i);
                $this->headers[$name] = $val;
            }
        }
    }

    /** 
     * Retrieve HTTP Method
     */
    function method()
    {
        return $this->method;
    }

    /** 
     * Retrieve HTTP Body
     */
    function body()
    {
        return $this->body;
    }

    /** 
     * Retrieve an HTTP Header
     * @param string Case-Insensitive HTTP Header Name (eg: "User-Agent")
     */
    function header($name)
    {
        $name = strtoupper($name);
        return isset($this->headers[$name]) ? $this->headers[$name] : false;
    }

    /**
     * Retrieve all HTTP Headers 
     * @return array HTTP Headers
     */
    function headers()
    {
        return $this->headers;
    }

    /**
     * Return Raw HTTP Request (note: This is incomplete)
     * @param bool ReBuild the Raw HTTP Request
     */
    function raw($refresh = false)
    {
        if (isset($this->raw) && !$refresh) {
            return $this->raw; // return cached
        }
        $headers = $this->headers();
        $this->raw = "{$this->method} {$_SERVER['REQUEST_URI']} {$this->protocol}\r\n";

        foreach ($headers as $i => $header) {
            $this->raw .= "$i: $header\r\n";
        }
        $this->raw .= "\r\n{$this->body}";
        return $this->raw;
    }

    function sendJsonResponse($message = null, $code = 200, $data = null)
    {
    // clear the old headers
        header_remove();
    // set the actual code
        http_response_code($code);
    // set the header to make sure cache is forced
        // header("Cache-Control: no-transform,public,max-age=300,s-maxage=900");
        header("Access-Control-Allow-Origin: *");
        header("Content-Type: application/json");
        header("Accept: application/json");
        header("Access-Control-Allow-Methods: POST,GET,OPTIONS,DELETE,PUT");
        header("Access-Control-Allow-Headers: X-Requested-With,Content-Type,Origin,Authorization,Accept,Client-Security-Token,Accept-Encoding");
        header("Access-Control-Allow-Credentials: true");
    // treat this as json
        header('Content-Type: application/json');
        $status = array(
            200 => '200 OK',
            400 => '400 Bad Request',
            401 => '401 Unauthorized',
            422 => 'Unprocessable Entity',
            500 => '500 Internal Server Error'
        );
    // ok, validation error, or failure
        header('Status: ' . $status[$code]);
    // return the encoded json
        echo json_encode(array(
            'status' => $code < 300, // success or not?
            'message' => $message,
            'data' => $data
        ));
    }

    function getRequest()
    {
        return explode("/", substr(@$_SERVER['PATH_INFO'], 1));
    }
}

/**
 * Example Usage
 * Echos the HTTP Request back to the client/browser
 */
// $http_request = new http_request();

// $resp = $http_request->raw();

// echo nl2br($resp);
/* Result (less <br> tags)
    GET / HTTP/1.1
    HOST: localhost:8080
    USER-AGENT: Mozilla/5.0 ...
    ACCEPT: text/html,application/xhtml+xml,application/xml;...
    ACCEPT-LANGUAGE: en-US,en;q=0.5
    ACCEPT-ENCODING: gzip, deflate
    DNT: 1
    COOKIE: PHPSESSID=...
    CONNECTION: keep-alive
 */
?>