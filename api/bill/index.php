<?php
// Require the person class file
  require_once("bill.dao.php");
  require_once(__DIR__ . "/../../helper/http-request.php");
  require_once(__DIR__ . "/../../Db.class.php");
	
// Instantiate the person class
  $billDAO  = new BillDAO();
  $http_request = new http_request();
  $body = json_decode($http_request->body());
  $db = new DB();

  switch ($_SERVER['REQUEST_METHOD']) {
    case 'POST': // add
        $billDAO->username = $body->username;
        $billDAO->Ngay = $body->Ngay;
        $billDAO->Tongtien = $body->Tongtien;
        $create = $billDAO->create();
        $http_request->sendJsonResponse('success', 200, $create);
        die();
      break;
    case 'GET': // id - all
      if (isset($_REQUEST['from']) && isset($_REQUEST['to'])) {
        $queryGetString = "
        SELECT bill.id, bill.Tongtien, bill.Ngay, user.sdt, user.name, user.username 
        FROM bill, user
        WHERE user.username = bill.username and bill.Ngay >= '". $_REQUEST['from'] ."' and bill.Ngay <= '".$_REQUEST['to']."'";

        $getByUser = $db->query($queryGetString);
        $http_request->sendJsonResponse('success', 200, $getByUser);
        die();
      } else if (isset($_REQUEST['username'])) {
        $queryGetString = "
        SELECT bill.*, product.name, product.price, product.image
        FROM bill
        INNER JOIN product ON bill.product_id = product.id
        WHERE bill.username = '". $_REQUEST['username'] ."'";
        $getByUser = $db->query($queryGetString);
        $http_request->sendJsonResponse('success', 200, $getByUser);
        die();
        
        $billDAO->id = $_REQUEST['id'];
        $getID = $billDAO->find();
        $http_request->sendJsonResponse('success', 200, $billDAO->variables);
        die();
      } else { // get all
        $queryGetString = "
        SELECT bill.id, bill.Tongtien, bill.Ngay, user.sdt, user.name, user.username 
        FROM bill, user
        WHERE user.username = bill.username";
        $getAll = $db->query($queryGetString);
        $http_request->sendJsonResponse('success', 200, $getAll);
        die();
      }
      $http_request->sendJsonResponse('get error', 400);
      die();
      break;
    case 'PUT': // edit
      if (isset($_REQUEST['id'])) {
        $billDAO->id = $_REQUEST['id'];
        // $billDAO->product_id = $body->product_id;
        $billDAO->username = $body->username;
        // $billDAO->quantity = $body->quantity;
        $billDAO->Ngay = $body->Ngay;
        $save = $billDAO->save();
        $http_request->sendJsonResponse('success', 200, $save);
        die();
      }
      $http_request->sendJsonResponse('save error id null', 400);
      die();
      break;
    case 'DELETE': // delete
      if (isset($_REQUEST['id'])) {
        $billDAO->id = $_REQUEST['id'];
        $delete = $billDAO->delete();
        $http_request->sendJsonResponse('success', 200, $delete);
        die();
      }
      $http_request->sendJsonResponse('delete error id null', 400);
      die();
      break;
  }
?>