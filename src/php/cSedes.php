<?php
    $conn=NULL;
    try{
        $conn = new PDO("mysql:host=localhost; dbname=santisimaspa; charset=utf8", 'root', '');

		print_r($_POST);
        if(!empty($_POST)){
            $dirección = $_POST['dirección'];
            $nombre = $_POST['nombre'];
            $gerente = $_POST['gerente'];
            $ciudad = $_POST['ciudad'];
        }    
            
		
			$sql="INSERT INTO sede VALUES($dirección,'$ciudad',
			'$nombre',$ciudad";
            
        $stm = $conn->prepare($sql);
        $stm->execute();
        $resultSet = $stm->fetchAll(PDO::FETCH_ASSOC);
        
        if($stm->rowCount()==1){
            echo "ok";
        }else{
            echo "error";
        }
    }catch(PDOException $e){
        echo "error".$e->getMessage();
    }