<?php
    $conn=NULL;
    try{
        $conn = new PDO("mysql:host=localhost; dbname=prueba_bd; charset=utf8", 'root', '');
		$sql="SELECT * FROM manicurista";
		
        $stm = $conn->prepare($sql);
        $stm->execute();
        $resultSet = $stm->fetchAll(PDO::FETCH_ASSOC);
        echo json_encode($resultSet);
    }catch(PDOException $e){
        echo "error".$e->getMessage();
    }
?>