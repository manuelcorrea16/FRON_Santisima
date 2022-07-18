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
            $sedeDireccion = $_POST['sedeDireccion'];
            $gereCedula = $_POST['gereCedula'];
        }    
            
		
			$sql="INSERT INTO administrador VALUES($cedula,'$nombre',
			'$celular','$direccion', $sedeDireccion,$gereCedula)";
            
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