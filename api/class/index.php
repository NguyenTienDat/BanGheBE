<?php 
// Require the person class file
  require_once("class.dao.php");
  require_once(__DIR__ . "/../../helper/http-request.php");
  require_once(__DIR__ . "/../../helper/utility.php");
	
// Instantiate the person class
  $classDAO  = new ClassDAO();
  $http_request = new http_request();
  $body = json_decode($http_request->body());
  $utility = new Utility();

  switch ($_SERVER['REQUEST_METHOD']) {
    case 'POST': // add
      if (isset($_REQUEST['id'])) {
        $classDAO->id = $_REQUEST['id'];
        $classDAO->name = $body->name;
        $classDAO->start_date = $body->start_date;
        $classDAO->end_date = $body->end_date;
        $classDAO->description = $body->description;
        $save = $classDAO->save();
        $http_request->sendJsonResponse('success', 200, $save);
        die();
      } else {
        $classDAO->name = $body->name;
        $classDAO->start_date = $body->start_date;
        $classDAO->end_date = $body->end_date;
        $classDAO->description = $body->description;
        $create = $classDAO->create();
        $http_request->sendJsonResponse('success', 200, $create);
        die();
      }
      break;
    case 'GET': // id - all
      if (isset($_REQUEST['id'])) {
        $classDAO->id = $_REQUEST['id'];
        if (isset($_REQUEST['type']) && $_REQUEST['type'] == 'delete') {
            $delete = $classDAO->delete();
            $http_request->sendJsonResponse('success', 200, $delete);
            die();
          $http_request->sendJsonResponse('delete error id null', 400);
          die();
          break;
        }
        $getID = $classDAO->find();
        $http_request->sendJsonResponse('success', 200, $classDAO->variables);
        die();
      } else {
        $getAll = $classDAO->all();
        $http_request->sendJsonResponse('success', 200, $getAll);
        die();
      }
      $http_request->sendJsonResponse('get error', 400);
      die();
      break;
    case 'PUT': // edit
      if (isset($_REQUEST['id'])) {
        $classDAO->id = $_REQUEST['id'];
        $classDAO->name = $body->name;
        $classDAO->start_date = $body->start_date;
        $classDAO->end_date = $body->end_date;
        $classDAO->description = $body->description;
        $save = $classDAO->save();
        $http_request->sendJsonResponse('success', 200, $save);
        die();
      }
      $http_request->sendJsonResponse('save error id null', 400);
      die();
      break;
    case 'DELETE': // delete
      if (isset($_REQUEST['id'])) {
        $classDAO->id = $_REQUEST['id'];
        $delete = $classDAO->delete();
        $http_request->sendJsonResponse('success', 200, $delete);
        die();
      }
      $http_request->sendJsonResponse('delete error id null', 400);
      die();
      break;
  }
?>
