<?php 
	require_once(__DIR__ . "/../../easyCRUD/easyCRUD.class.php");

	class CartDAO Extends Crud {
		
			# Your Table name 
			protected $table = 'cart';
			
			# Primary Key of the Table
			protected $pk	 = 'id';
	}

?>