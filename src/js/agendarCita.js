form = document.getElementById("form")
form.addEventListener('submit',(e)=>{
    e.preventDefault();
    const formData= new FormData(form) 
    /*const path = ('/profesor/create/create.php')*/
    const path = ("../../src/php/agendarCita.php")
    fetch('/ajax/profesor/create/create1.php', {
        method: 'POST',
        body: formData,
        headers: {
<<<<<<< HEAD
            
=======
            "Content-type": "application/json",
>>>>>>> 4f9ef181f7b644a4e4970db435e591bb817466d1
            "Accept": "application/json"
        } 
    }).catch(()=>{
        alert("no esta funcionando")
    })
})