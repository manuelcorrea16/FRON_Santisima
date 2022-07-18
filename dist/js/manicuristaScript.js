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
