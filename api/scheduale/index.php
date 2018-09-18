<?php
// Require the person class file
  require_once(__DIR__ . "/../../helper/http-request.php");
  require_once(__DIR__ . "/../../Db.class.php");
  require_once("scheduale.dao.php");
	
// Instantiate the person class
  $http_request = new http_request();
  $body = json_decode($http_request->body());
  $db = new DB();
  $tableDAO = new SchedualeDAO();
  $arrayTableFields = array('id_ref', 'allDay', 'startDate', 'endDate', 'text', 'description', 'recurrenceRule');
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
      $tableDAO = bindingData($arrayTableFields, $tableDAO, $body);
      if (isset($_REQUEST['id'])) { // edit
        $tableDAO->id = $_REQUEST['id'];
        $save = $tableDAO->save();
      } else { // create
        $save = $tableDAO->create();
      }
      $http_request->sendJsonResponse('success', 200, $save);
      $http_request->sendJsonResponse('add faile', 400);
      break;
    case 'GET':
      if (isset($_REQUEST['id_ref'])) {
        $id_ref = $_REQUEST['id_ref'];

         /**
         * Delete by id ref
         */
        if (isset($_REQUEST['type']) && $_REQUEST['type'] == 'delete') {
            $delete = $db->query("DELETE FROM scheduale WHERE id_ref = :id_ref", array("id_ref"=>$id_ref));
            $http_request->sendJsonResponse('success', 200, $delete);
            die();
          $http_request->sendJsonResponse('delete error id null', 400);
          die();
          break;
        }

        /**
         * Get by id ref
         */
        $getID = $db->query("SELECT scheduale.*, class.name as class_name FROM scheduale INNER JOIN class ON class.id = scheduale.id_ref WHERE id_ref = :id_ref", array("id_ref"=>$id_ref));
        $http_request->sendJsonResponse('success', 200, $getID);
      } else if (isset($_REQUEST['id'])) {
        $id = $_REQUEST['id'];

         /**
         * Delete by id
         */
        if (isset($_REQUEST['type']) && $_REQUEST['type'] == 'delete') {
            $delete = $db->query("DELETE FROM scheduale WHERE id = :id", array("id"=>$id));
            $http_request->sendJsonResponse('success', 200, $delete);
            die();
          $http_request->sendJsonResponse('delete error id null', 400);
          die();
          break;
        }

        /**
         * Get by id
         */
        $getID = $db->query("SELECT sche.*, class.name as class_name, class.color FROM (SELECT scheduale.* FROM scheduale WHERE id = :id ) as sche LEFT JOIN class ON class.id = sche.id_ref", array("id"=>$id));
        $http_request->sendJsonResponse('success', 200, $getID);
      } else {

        /**
         * Get ALL
         */
        $getAll = $db->query("SELECT scheduale.*, class.name as class_name, class.color FROM scheduale LEFT JOIN class ON class.id = scheduale.id_ref");
        $http_request->sendJsonResponse('success', 200, $getAll);
        die();
      }
      $http_request->sendJsonResponse('get error', 400);
      die();
      break;
  }
?>