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
            
            "Accept": "application/json"
        } 
    }).catch(()=>{
        alert("no esta funcionando")
    })
})