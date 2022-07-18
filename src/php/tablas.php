<?php
    $conn=NULL;
    try{
        $conn = new PDO("mysql:host=localhost; dbname=santisimaspa; charset=utf8", 'root', '');
		
		if(!empty($_POST)){
            $tabla = $_POST['table'];
        }
        //$sql="SELECT * FROM $tabla";
        $sql="SELECT * FROM manicurista";
        $stm = $conn->prepare($sql);
        $stm->execute();
        $resultSet = $stm->fetchAll(PDO::FETCH_ASSOC);
        echo json_encode($resultSet);
    }catch(PDOException $e){
        echo "error".$e->getMessage();
    }
?>