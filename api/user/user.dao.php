<?php 
	require_once("/../../easyCRUD/easyCRUD.class.php");

	class UserDAO Extends Crud {
		
			# Your Table name 
			protected $table = 'user';
			
			# Primary Key of the Table
			protected $pk	 = 'username';
	}

?>