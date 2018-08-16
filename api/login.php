<?php 
  require_once("/../Db.class.php");
  require_once("/../helper/utility.php");
  require_once("/../helper/http-request.php");
  $http_request = new http_request();
  $utility = new Utility();
  $db = new DB();
  $body = json_decode($http_request->body);
  $TIME_OUT = 36000;
  if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    if ($utility->IsNullOrEmptyString($body->username) || $utility->IsNullOrEmptyString($body->password)) {
      $http_request->sendJsonResponse('Login_1', 400);
    } else {
      $params = $db->bindMore(array("username"=>$body->username, "password"=>$body->password));		
      $select = $db->row("SELECT * FROM user WHERE username = :username AND password = :password", $params);
      if ($select) {
        $select = json_decode(json_encode($select));
        $time_now = microtime(true);
        $select->last_time = $time_now;
        $paramsUpdate = array("last_time"=>$time_now, "id"=>$select->id);
        $updateUser = $db->query("UPDATE user SET last_time = :last_time WHERE id = :id", $paramsUpdate);
        if ((int)$updateUser > 0) {
          $token = $utility->JWT_encode($select);
          $http_request->sendJsonResponse('success', 200, $token);
        } else {
          $http_request->sendJsonResponse('Update fail (Login_4)', 400, $updateUser);
        }
      } else {
        $http_request->sendJsonResponse('Tài khoản không tồn tại (Login_3)', 400);
      }
    }
  } else {
    $http_request->sendJsonResponse('Login_2', 400);
  }
?>