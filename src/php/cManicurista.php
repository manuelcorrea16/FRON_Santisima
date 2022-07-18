<?php
    $conn=NULL;
    try{
        $conn = new PDO("mysql:host=localhost; dbname=santisimaspa; charset=utf8", 'root', '');

		print_r($_POST);
        if(!empty($_POST)){
            $cedula = $_POST['cedula'];
            $nombre = $_POST['nombre'];
            $celular = $_POST['celular'];
            $direccion = $_POST['direccion'];
            $especialidad = $_POST['especialidad'];
            $profesor = $_POST['profesor'];
        }    
            
		
			$sql="INSERT INTO manicurista VALUES($cedula,'$nombre',
			'$direccion','0', $celular,'$especialidad','1','$profesor',1234,1,1,1000084641)";
            
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
