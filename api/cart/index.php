<?php
// Require the person class file
  require_once("cart.dao.php");
  require_once(__DIR__ . "/../../helper/http-request.php");
  require_once(__DIR__ . "/../../Db.class.php");
	
// Instantiate the person class
  $cartDAO  = new CartDAO();
  $http_request = new http_request();
  $body = json_decode($http_request->body());
  $db = new DB();

  switch ($_SERVER['REQUEST_METHOD']) {
    case 'POST': // add
        $cartDAO->product_id = $body->product_id;
        $cartDAO->username = $body->username;
        $cartDAO->quantity = $body->quantity;
        $cartDAO->Ngay = $body->Ngay;
        $create = $cartDAO->create();
        $http_request->sendJsonResponse('success', 200, $create);
        die();
      break;
    case 'GET': // id - all
      if (isset($_REQUEST['username']) && isset($_REQUEST['product_id'])) {
        $queryGetString = "
        SELECT cart.*
        FROM cart
        WHERE cart.username = '". $_REQUEST['username'] ."' and cart.product_id='".$_REQUEST['product_id']."'";

        $getByUser = $db->query($queryGetString);
        $http_request->sendJsonResponse('success', 200, $getByUser);
        die();
      } else if (isset($_REQUEST['username'])) {
        $queryGetString = "
        SELECT cart.*, product.name, product.price, product.image
        FROM cart
        INNER JOIN product ON cart.product_id = product.id
        WHERE cart.username = '". $_REQUEST['username'] ."'";
        $getByUser = $db->query($queryGetString);
        $http_request->sendJsonResponse('success', 200, $getByUser);
        die();
        
        $cartDAO->id = $_REQUEST['id'];
        $getID = $cartDAO->find();
        $http_request->sendJsonResponse('success', 200, $cartDAO->variables);
        die();
      } else {
        $queryGetString = 'SELECT * FROM cart';
        $getAll = $db->query($queryGetString);
        $http_request->sendJsonResponse('success', 200, $getAll);
        die();
      }
      $http_request->sendJsonResponse('get error', 400);
      die();
      break;
    case 'PUT': // edit
      if (isset($_REQUEST['id'])) {
        $cartDAO->id = $_REQUEST['id'];
        // $cartDAO->product_id = $body->product_id;
        // $cartDAO->username = $body->username;
        $cartDAO->quantity = $body->quantity;
        $cartDAO->Ngay = $body->Ngay;
        $save = $cartDAO->save();
        $http_request->sendJsonResponse('success', 200, $save);
        die();
      }
      $http_request->sendJsonResponse('save error id null', 400);
      die();
      break;
    case 'DELETE': // delete
      if (isset($_REQUEST['id'])) {
        $cartDAO->id = $_REQUEST['id'];
        $delete = $cartDAO->delete();
        $http_request->sendJsonResponse('success', 200, $delete);
        die();
      }
      $http_request->sendJsonResponse('delete error id null', 400);
      die();
      break;
  }
?>