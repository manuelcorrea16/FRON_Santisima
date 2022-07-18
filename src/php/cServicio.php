<?php
    $conn=NULL;
    try{
        $conn = new PDO("mysql:host=localhost; dbname=santisimaspa; charset=utf8", 'root', '');

		print_r($_POST);
        if(!empty($_POST)){
            $id = $_POST['id'];
            $nombre = $_POST['nombre'];
            $duracion = $_POST['duracion'];
            $materiales = $_POST['materiales'];
            $costo = $_POST['costo'];
            $idInsumo = $_POST['idInsumo'];
            $adminSede = $_POST['adminSede'];
            $adminGerente = $_POST['adminGerente'];
        }    
            
			$sql="INSERT INTO servicio VALUES($cedula,'$nombre',
			'$duracion','$materiales', '$costo',$idInsumo,$adminSede,$adminGerente)";
            
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