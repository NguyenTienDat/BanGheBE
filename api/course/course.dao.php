<?php 
	require_once(__DIR__ . "/../../easyCRUD/easyCRUD.class.php");

	class CourseDAO Extends Crud {
		
			# Your Table name 
			protected $table = 'course';
			
			# Primary Key of the Table
			protected $pk	 = 'id';
	}

?>