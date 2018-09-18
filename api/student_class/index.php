<?php
// Require the person class file
  require_once(__DIR__ . "/../../helper/http-request.php");
  require_once(__DIR__ . "/../../Db.class.php");
	
// Instantiate the person class
  $http_request = new http_request();
  $body = json_decode($http_request->body());
  $db = new DB();

  switch ($_SERVER['REQUEST_METHOD']) {
    case 'POST':
      if (isset($body->class_id)) {
        $classId = $body->class_id;
        if (isset($body->ids_uncheck) && !empty($body->ids_uncheck)) {
          $deleteStr = '';
          foreach ($body->ids_uncheck as $key => $value) {
            $deleteStr .= "$value ,";
          }
          $deleteStr = substr($deleteStr, 0, -1);
          $de = $db->query("DELETE FROM student_class WHERE class_id = $classId AND student_id IN ($deleteStr)");
        }

        if (isset($body->ids_check) && !empty($body->ids_check)) {
          $insertStr = '';
          foreach ($body->ids_check as $key => $value) {
            $insertStr .= "($value, $classId),";
          }
          $insertStr = substr($insertStr, 0, -1);
          $db->query("INSERT INTO student_class (student_id, class_id) VALUES $insertStr");
        }

        $http_request->sendJsonResponse('success', 200);
        die();
      }
      $http_request->sendJsonResponse('Not class id', 400);
      die();
      break;
    case 'GET': // id - all
      if (isset($_REQUEST['class_id'])) {
        $class_id = $_REQUEST['class_id'];
        $select = $db->query('SELECT * FROM student_class WHERE class_id = :class_id', array('class_id'=>$class_id));
        $http_request->sendJsonResponse('success', 200, $select);
        die();
      }
      $http_request->sendJsonResponse('get error', 400);
      die();
      break;
  }
?>