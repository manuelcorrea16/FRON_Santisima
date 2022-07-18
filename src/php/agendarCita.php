<?php
    $conn=NULL;
    try{
        $conn = new PDO("mysql:host=localhost; dbname=colegio; charset=utf8", 'root', '');

        if(!empty($_POST)){
            $id = $_POST['id'];
            $contrato = $_POST['contrato'];
            $ofiarea = $_POST['ofiarea'];
            $ofiadmin = $_POST['ofiadmin'];
        }    
            
		
			$sql="INSERT INTO servicio_has_manicurista VALUES('$id','$ofiadmin',
			'$ofiarea','$contrato')";
		
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