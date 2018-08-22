<?php 
// Require the person class file
  require_once("user.dao.php");
  require_once(__DIR__ . "/../../helper/http-request.php");
  require_once(__DIR__ . "/../../helper/utility.php");
	
// Instantiate the person class
  $userDAO  = new UserDAO();
  $http_request = new http_request();
  $utility = new Utility();

  switch ($_SERVER['REQUEST_METHOD']) {
    case 'POST':
      $http_request->sendJsonResponse('POST', 200, $_SERVER['REQUEST_METHOD']);
      die();
      break;
    case 'GET':
      $http_request->sendJsonResponse('GET', 200, $_SERVER['REQUEST_METHOD']);
      die();
    break;
  }
?>
