<<<<<<< HEAD
form = document.getElementById("form")
eliminar = document.getElementById("borrar")
form.addEventListener('submit',()=>{
    
    const formData= new FormData(form) 
    /*const path = ('/profesor/create/create.php')*/
    const path = ("../src/php/cManicurista.php")
    fetch(path, {
        method: 'POST',
        body: formData,
        headers: {
            
            "Accept": "application/json"
        } 
    }).catch(()=>{
        alert("no esta funcionando")
    })
})

eliminar.addEventListener("click",()=>{
    
})
=======
>>>>>>> 4f9ef181f7b644a4e4970db435e591bb817466d1
