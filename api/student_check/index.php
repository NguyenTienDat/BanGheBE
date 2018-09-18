<?php
  require_once(__DIR__ . "/../../helper/http-request.php");
  require_once(__DIR__ . "/../../Db.class.php");
	
  $http_request = new http_request();
  $body = json_decode($http_request->body());
  $db = new DB();

  switch ($_SERVER['REQUEST_METHOD']) {
    case 'POST': 
      if (isset($_REQUEST['type']) && $_REQUEST['type'] == 'description') {
        $id = $body->id;
        $description = $body->description;
        $upodate = $db->query("UPDATE student_check SET description = :description WHERE id = :id", array("id"=>$id, "description"=>$description));
        $http_request->sendJsonResponse('success', 200, $upodate);
      }
    
      if (isset($body->id) && isset($body->type)) {
        $id = $body->id;
        $type = $body->type;
        $updatetype = $db->query("UPDATE student_check SET type = :type WHERE id = :id", array("type"=>$type, "id"=>$id));
        $http_request->sendJsonResponse('success', 200, $updatetype);
      }

      // ids_check, ids_uncheck
      if (isset($body->ids_check) && isset($body->ids_uncheck)) {
        // uncheck
        if (!empty($body->ids_uncheck)) {
          $lsUncheck = '';
          foreach ($body->ids_uncheck as $key => $value) {
            $lsUncheck .= "$value,";
          }
          $lsUncheck = substr($lsUncheck, 0, -1);
          $db->query("UPDATE student_check SET type = 0 WHERE id IN ($lsUncheck)");
        }

         // check
        if (!empty($body->ids_check)) {
          $lsCheck = '';
          foreach ($body->ids_check as $key => $value) {
            $lsCheck .= "$value,";
          }
          $lsCheck = substr($lsCheck, 0, -1);
          $db->query("UPDATE student_check SET type = 1 WHERE id IN ($lsCheck)");
        }
        $http_request->sendJsonResponse('success', 200);
      }
      $http_request->sendJsonResponse('Post fail', 400);
      break;
    case 'GET': // id - all
      if (isset($_REQUEST['class_id']) && isset($_REQUEST['time'])) {
        $classID = $_REQUEST['class_id'];
        $time = $_REQUEST['time'];

        $count = $db->single("SELECT count(*) AS count FROM student_check WHERE class_id = :class_id AND time = :time", array("class_id"=>$classID, "time"=>$time));
        if ((int)$count == 0) { // Init

          $student_ids = $db->column("SELECT student_id FROM student_class WHERE class_id = :class_id", array("class_id"=>$classID));

          if (isset($student_ids)) {
            $insertStr = '';
            foreach ($student_ids as $key => $value) {
              $insertStr .= "($value, $classID, '$time'),";
            }
            $insertStr = substr($insertStr, 0, -1);
            $db->query("INSERT INTO student_check (student_id, class_id, time) VALUES $insertStr");
          }
        }
        $select = $db->query("SELECT student_check.*, student.name,	student.birthday, student.phone, student.email, student.start_date, student.new_month_date, student.payment_date
        FROM student_check LEFT JOIN student ON student.id = student_check.student_id WHERE class_id = :class_id AND time =:time", array("class_id"=>$classID, "time"=>$time));
        $http_request->sendJsonResponse('success', 200, $select);
      }
      $http_request->sendJsonResponse('get error', 400);
      break;
  }
?>