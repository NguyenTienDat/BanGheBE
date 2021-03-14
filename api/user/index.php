<?php 
// Require the person class file
  require_once("user.dao.php");
  require_once(__DIR__ . "/../../helper/http-request.php");
  require_once(__DIR__ . "/../../helper/utility.php");
	
// Instantiate the person class
  $userDAO  = new UserDAO();
  $http_request = new http_request();
  $utility = new Utility();

  // switch ($_SERVER['REQUEST_METHOD']) {
  //   case 'POST':
  //     $http_request->sendJsonResponse('POST', 200, $_SERVER['REQUEST_METHOD']);
  //     die();
  //     break;
  //   case 'GET':
  //     $http_request->sendJsonResponse('GET', 200, $_SERVER['REQUEST_METHOD']);
  //     die();
  //   break;
  $body = json_decode($http_request->body());
  $db = new DB();

  switch ($_SERVER['REQUEST_METHOD']) {
    case 'POST': // add
      if (isset($_REQUEST['id_ref'])) {
        $userDAO->id_ref = $_REQUEST['id_ref'];
        $userDAO->username  = $body->username ;
        // $userDAO->password = $body->password;
        $userDAO->name = $body->name;
        $userDAO->address = $body->address;
        $userDAO->sdt = $body->sdt;
        $userDAO->mail = $body->mail;
        $userDAO->type = $body->type; 
        $userDAO->last_time = $body->last_time;
        // $userDAO->token = $body->token;
        $save = $userDAO->save();
        $http_request->sendJsonResponse('success', 200, $save);
        die();
      } else {
        $userDAO->username  = $body->username ;
        $userDAO->password = $body->password;
        $userDAO->name = $body->name;
        $userDAO->address = $body->address;
        $userDAO->sdt = $body->sdt;
        $userDAO->mail = $body->mail;
        $userDAO->type = $body->type;
        $userDAO->last_time = $body->last_time;
        // $userDAO->token = $body->token;
        $create = $userDAO->create();
        $http_request->sendJsonResponse('success', 200, $create);
        die();
      }
      break;
    case 'GET': // id_ref - all
      if (isset($_REQUEST['username'])) {
        $userDAO->username = $_REQUEST['username'];
        $getid_ref = $userDAO->find();
        $http_request->sendJsonResponse('success', 200, $userDAO->variables);
        die();
      } else {
        $queryGetString = 'SELECT user.* FROM user';
        $getAll = $db->query($queryGetString);
        $http_request->sendJsonResponse('success', 200, $getAll);
        die();
      }
      $http_request->sendJsonResponse('get error', 400);
      die();
      break;
    case 'PUT': // edit
      if (isset($_REQUEST['id_ref'])) {
        $userDAO->id_ref = $_REQUEST['id_ref'];
        $userDAO->username  = $body->username ;
        // $userDAO->password = $body->password;
        $userDAO->name = $body->name;
        $userDAO->address = $body->address;
        $userDAO->sdt = $body->sdt;
        $userDAO->mail = $body->mail;
        $userDAO->type = $body->type;
        // $userDAO->last_time = $body->last_time;
        // $userDAO->token = $body->token;
        $save = $userDAO->save();
        $http_request->sendJsonResponse('success', 200, $save);
        die();
      }
      $http_request->sendJsonResponse('save error id_ref null', 400);
      die();
      break;
    case 'DELETE': // delete
      if (isset($_REQUEST['username'])) {
        $userDAO->username = $_REQUEST['username'];
        $delete = $userDAO->delete();
        $http_request->sendJsonResponse('success', 200, $delete);
        die();
      }
      $http_request->sendJsonResponse('delete error username null', 400);
      die();
      break;
  }
?>
   