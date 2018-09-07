<?php 
	require_once(__DIR__ . "/../../easyCRUD/easyCRUD.class.php");

	class SchedualeDAO Extends Crud {
		
			# Your Table name 
			protected $table = 'scheduale';
			
			# Primary Key of the Table
			protected $pk	 = 'id';
	}

?>