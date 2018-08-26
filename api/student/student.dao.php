<?php 
	require_once(__DIR__ . "/../../easyCRUD/easyCRUD.class.php");

	class StudentDAO Extends Crud {
		
			# Your Table name 
			protected $table = 'student';
			
			# Primary Key of the Table
			protected $pk	 = 'id';
	}

?>