<?php 
	require_once(__DIR__ . "/../../easyCRUD/easyCRUD.class.php");

	class ClassDAO Extends Crud {
		
			# Your Table name 
			protected $table = 'class';
			
			# Primary Key of the Table
			protected $pk	 = 'id';
	}

?>