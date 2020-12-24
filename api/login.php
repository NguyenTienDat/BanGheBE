<?php 
  require_once(__DIR__ . "/../Db.class.php");
  require_once(__DIR__ . "/../helper/utility.php");
  require_once(__DIR__ . "/../helper/http-request.php");
  $http_request = new http_request();
  $utility = new Utility();
  $db = new DB();
  $body = json_decode($http_request->body);

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
        unset($select->token);
        $token = $utility->JWT_encode($select);

        //Update last_time, token
        $paramsUpdate = array("last_time"=>$time_now, "token"=>$token, "username"=>$select->username);
        $updateUser = $db->query("UPDATE user SET last_time = :last_time, token = :token WHERE username = :username", $paramsUpdate);

        // Send token
        $http_request->sendJsonResponse('success', 200, $select);
      } else {
        $http_request->sendJsonResponse('Tài khoản không tồn tại (Login_3)', 400);
      }
    }
  } else {
    $http_request->sendJsonResponse('Login_2', 400);
  }
?>