<?php 
// Require the person class file
  require_once("course.dao.php");
  require_once(__DIR__ . "/../../helper/http-request.php");
  require_once(__DIR__ . "/../../helper/utility.php");
	
// Instantiate the person class
  $courseDAO  = new CourseDAO();
  $http_request = new http_request();
  $body = json_decode($http_request->body());
  $utility = new Utility();

  switch ($_SERVER['REQUEST_METHOD']) {
    case 'POST': // add
      $courseDAO->name = $body->name;
      $courseDAO->cost = $body->cost;
      $courseDAO->description = $body->description;
      $create = $courseDAO->create();
      if ((int)$create == 1) {
        $http_request->sendJsonResponse('success', 200, $create);
      } else {
        $http_request->sendJsonResponse('create error', 400);
      }
      die();
      break;
    case 'GET': // id - all
      if (isset($_REQUEST['id'])) {
        $courseDAO->id = $_REQUEST['id'];
        $getID = $courseDAO->find();
        $http_request->sendJsonResponse('success', 200, $courseDAO->variables);
        die();
      } else {
        $getAll = $courseDAO->all();
        $http_request->sendJsonResponse('success', 200, $getAll);
        die();
      }
      $http_request->sendJsonResponse('get error', 400);
      die();
      break;
    case 'PUT': // edit
      if (isset($_REQUEST['id'])) {
        $courseDAO->id = $_REQUEST['id'];
        $courseDAO->name = $body->name;
        $courseDAO->cost = $body->cost;
        $courseDAO->description = $body->description;
        $save = $courseDAO->save();
        if ((int)$save == 1) {
          $http_request->sendJsonResponse('success', 200, $save);
        } else {
          $http_request->sendJsonResponse('save error', 400);
        }
        die();
      }
      $http_request->sendJsonResponse('save error id null', 400);
      die();
      break;
    case 'DELETE': // edit
      if (isset($_REQUEST['id'])) {
        $courseDAO->id = $_REQUEST['id'];
        $delete = $courseDAO->delete();
        $http_request->sendJsonResponse('success', 200, $delete);
        die();
      }
      $http_request->sendJsonResponse('delete error id null', 400);
      die();
      break;
  }
?>
