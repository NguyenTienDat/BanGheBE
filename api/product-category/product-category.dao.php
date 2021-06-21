<?php 
	require_once(__DIR__ . "/../../easyCRUD/easyCRUD.class.php");

	class ProductDAO Extends Crud {
		
			# Your Table name 
			protected $table = 'product_category';
			
			# Primary Key of the Table
			protected $pk	 = 'id';
	}

?>