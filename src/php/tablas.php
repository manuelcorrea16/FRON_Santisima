<?php
    $conn=NULL;
    try{
<<<<<<< HEAD
        $conn = new PDO("mysql:host=localhost; dbname=santisimaspa; charset=utf8", 'root', '');
=======
        $conn = new PDO("mysql:host=localhost; dbname=prueba_bd; charset=utf8", 'root', '');
>>>>>>> 4f9ef181f7b644a4e4970db435e591bb817466d1
		
		if(!empty($_POST)){
            $tabla = $_POST['table'];
        }
<<<<<<< HEAD
        //$sql="SELECT * FROM $tabla";
        $sql="SELECT * FROM manicurista";
=======
        $sql="SELECT * FROM $tabla";
>>>>>>> 4f9ef181f7b644a4e4970db435e591bb817466d1
        $stm = $conn->prepare($sql);
        $stm->execute();
        $resultSet = $stm->fetchAll(PDO::FETCH_ASSOC);
        echo json_encode($resultSet);
    }catch(PDOException $e){
        echo "error".$e->getMessage();
    }
?>