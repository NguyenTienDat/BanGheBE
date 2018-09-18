<?php
// Require the person class file
  require_once("student.dao.php");
  require_once(__DIR__ . "/../../helper/http-request.php");
  require_once(__DIR__ . "/../../Db.class.php");
	
// Instantiate the person class
  $tableDAO  = new StudentDAO();
  $http_request = new http_request();
  $body = json_decode($http_request->body());
  $db = new DB();
  $arrayTableFields = array('name', 'birthday', 'phone', 'email', 'start_date', 'new_month_date', 'payment_date', 'description');
  /**
   * Bind data from body -> tableDao
   */
  function bindingData($arrayField, $tableDAO, $body) {
    foreach ($arrayField as $field) {
      if (isset($body->$field)) {
        $tableDAO->$field = $body->$field;
      }
    }
    return $tableDAO;
  }

  switch ($_SERVER['REQUEST_METHOD']) {
    case 'POST': // add
      if (isset($_REQUEST['id'])) {
        $tableDAO->id = $_REQUEST['id'];
        bindingData($arrayTableFields, $tableDAO, $body);
        $save = $tableDAO->save();
        $http_request->sendJsonResponse('success', 200, $save);
        die();
      } else {
        bindingData($arrayTableFields, $tableDAO, $body);
        $create = $tableDAO->create();
        $http_request->sendJsonResponse('success', 200, $create);
        die();
      }
      break;
    case 'GET': // id - all
      // get by class id
      if (isset($_REQUEST['class_id'])) {
        $class_id = $_REQUEST['class_id'];
        $students = $db->query("select student.* from student_class
          INNER JOIN student ON student.id = student_class.student_id
          WHERE class_id = :class_id", array("class_id"=>$class_id));
        $http_request->sendJsonResponse('success', 200, $students);
      }
      if (isset($_REQUEST['id'])) {
        $tableDAO->id = $_REQUEST['id'];
        if (isset($_REQUEST['type']) && $_REQUEST['type'] == 'delete') {
            $delete = $tableDAO->delete();
            $http_request->sendJsonResponse('success', 200, $delete);
            die();
          $http_request->sendJsonResponse('delete error id null', 400);
          die();
          break;
        }
        $getID = $tableDAO->find();
        $http_request->sendJsonResponse('success', 200, $tableDAO->variables);
        die();
      } else {
        // $queryGetString = 'SELECT class.*, course.name as "course_name", course.description as "course_des", course.cost as "course_cost" FROM class LEFT JOIN course ON class.course_id_ref = course.id';
        // $getAll = $db->query($queryGetString);
        $getAll = $tableDAO->all();
        $http_request->sendJsonResponse('success', 200, $getAll);
        die();
      }
      $http_request->sendJsonResponse('get error', 400);
      die();
      break;
    case 'PUT': // edit
      if (isset($_REQUEST['id'])) {
        $tableDAO->id = $_REQUEST['id'];
        bindingData($arrayTableFields, $tableDAO, $body);
        $save = $tableDAO->save();
        $http_request->sendJsonResponse('success', 200, $save);
        die();
      }
      $http_request->sendJsonResponse('save error id null', 400);
      die();
      break;
    case 'DELETE': // delete
      if (isset($_REQUEST['id'])) {
        $tableDAO->id = $_REQUEST['id'];
        $delete = $tableDAO->delete();
        $http_request->sendJsonResponse('success', 200, $delete);
        die();
      }
      $http_request->sendJsonResponse('delete error id null', 400);
      die();
      break;
  }
?>