<?php 
	require_once(__DIR__ . "/../../easyCRUD/easyCRUD.class.php");

	class BillDAO Extends Crud {
		
			# Your Table name 
			protected $table = 'bill';
			
			# Primary Key of the Table
			protected $pk	 = 'id';
	}

?>