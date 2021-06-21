<?php
// Require the person class file
  require_once("product.dao.php");
  require_once(__DIR__ . "/../../helper/http-request.php");
  require_once(__DIR__ . "/../../Db.class.php");
	
// Instantiate the person class
  $productDAO  = new ProductDAO();
  $http_request = new http_request();
  $body = json_decode($http_request->body());
  $db = new DB();

  switch ($_SERVER['REQUEST_METHOD']) {
    case 'POST': // add
      if (isset($_REQUEST['id'])) {
        $productDAO->id = $_REQUEST['id'];
        $productDAO->name = $body->name;
        $productDAO->price = $body->price;
        $productDAO->size = $body->size;
        $productDAO->weight = $body->weight;
        $productDAO->color = $body->color;
        $productDAO->description = $body->description;
        $productDAO->image = $body->image;
        $productDAO->category = $body->category;
        $save = $productDAO->save();
        $http_request->sendJsonResponse('success', 200, $save);
        die();
      } else {
        $productDAO->name = $body->name;
        $productDAO->price = $body->price;
        $productDAO->size = $body->size;
        $productDAO->weight = $body->weight;
        $productDAO->color = $body->color;
        $productDAO->description = $body->description;
        $productDAO->image = $body->image;
        $productDAO->category = $body->category;
        $create = $productDAO->create();
        $http_request->sendJsonResponse('success', 200, $create);
        die();
      }
      break;
    case 'GET': // id - all
      if (isset($_REQUEST['id'])) {
        $productDAO->id = $_REQUEST['id'];
        if (isset($_REQUEST['type']) && $_REQUEST['type'] == 'delete') {
            $delete = $productDAO->delete();
            $http_request->sendJsonResponse('success', 200, $delete);
            die();
          $http_request->sendJsonResponse('delete error id null', 400);
          die();
          break;
        }
        $getID = $productDAO->find();
        $http_request->sendJsonResponse('success', 200, $productDAO->variables);
        die();
      } else {
        $queryGetString = 'SELECT * FROM product ';
        $getAll = $db->query($queryGetString);
        $http_request->sendJsonResponse('success', 200, $getAll);
        die();
      }
      $http_request->sendJsonResponse('get error', 400);
      die();
      break;
    case 'PUT': // edit
      if (isset($_REQUEST['id'])) {
        $productDAO->id = $_REQUEST['id'];
        $productDAO->name = $body->name;
        $productDAO->price = $body->price;
        $productDAO->size = $body->size;
        $productDAO->weight = $body->weight;
        $productDAO->color = $body->color;
        $productDAO->description = $body->description;
        $productDAO->image = $body->image;
        $productDAO->category = $body->category;
        $save = $productDAO->save();
        $http_request->sendJsonResponse('success', 200, $save);
        die();
      }
      $http_request->sendJsonResponse('save error id null', 400);
      die();
      break;
    case 'DELETE': // delete
      if (isset($_REQUEST['id'])) {
        $productDAO->id = $_REQUEST['id'];
        $delete = $productDAO->delete();
        $http_request->sendJsonResponse('success', 200, $delete);
        die();
      }
      $http_request->sendJsonResponse('delete error id null', 400);
      die();
      break;
  }
?>