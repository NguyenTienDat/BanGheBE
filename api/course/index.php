<?php 
// Require the person class file
  require_once("course.dao.php");
  require_once(__DIR__ . "/../../helper/http-request.php");
  require_once(__DIR__ . "/../../Db.class.php");
	
// Instantiate the person class
  $tableDAO  = new CourseDAO();
  $http_request = new http_request();
  $body = json_decode($http_request->body());
  $db = new DB();

  $arrayTableFields = array('name', 'cost', 'description', 'course_id_ref', 'start_date');
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
    case 'POST':
      if (isset($_REQUEST['id'])) { // edit
        bindingData($arrayTableFields, $tableDAO, $body);
        $tableDAO->id = $_REQUEST['id'];
        $save = $tableDAO->save();
        $http_request->sendJsonResponse('success', 200, $save);
        die();
      } else { // create
        bindingData($arrayTableFields, $tableDAO, $body);
        $create = $tableDAO->create();
        $http_request->sendJsonResponse('success', 200, $create);
        die();
      }
      break;
    case 'GET': // id - all
      if (isset($_REQUEST['id'])) {
        $tableDAO->id = $_REQUEST['id'];
        if (isset($_REQUEST['type'])) {
          if ($_REQUEST['type'] == 'delete') {
            $delete = $tableDAO->delete();
            $http_request->sendJsonResponse('success', 200, $delete);
            die();
          }
          $http_request->sendJsonResponse('delete error id null', 400);
          die();
          break;
        }
        $queryFindID = "SELECT child.*,
          parents.name AS parents_name,
          parents.cost AS parents_cost,
          parents.description AS parents_description,
          parents.start_date AS parents_start_date
          FROM (SELECT * FROM (course) WHERE id = $tableDAO->id) AS child 
          LEFT JOIN (course AS parents)
          ON (child.course_id_ref = parents.id)";
        $findID = $db->query($queryFindID);
        $http_request->sendJsonResponse('success', 200, $findID);
        die();
      } else {
        if (isset($_REQUEST['type']) && $_REQUEST['type'] == 'parents') {
          $queryFindParents = "SELECT * FROM course WHERE course_id_ref = 0";
          $findParents = $db->query($queryFindParents);
          $http_request->sendJsonResponse('success', 200, $findParents);
          die();
        }
        $queryFindALL = "SELECT child.*,
          parents.name AS parents_name,
          parents.cost AS parents_cost,
          parents.description AS parents_description,
          parents.start_date AS parents_start_date
          FROM (SELECT * FROM (course)) AS child 
          LEFT JOIN (course AS parents)
          ON (child.course_id_ref = parents.id)";
        $getAll = $db->query($queryFindALL);
        $http_request->sendJsonResponse('success', 200, $getAll);
        die();
      }
      $http_request->sendJsonResponse('get error', 400);
      die();
      break;
  }
?>
