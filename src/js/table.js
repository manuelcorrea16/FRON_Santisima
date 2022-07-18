window.addEventListener('DOMContentLoaded', (e) => {
    e.preventDefault();
    const path = "../src/php/tablas.php"
    const tableName = {
        table: "manicurista"
    }
    fetch(path,{
        method: 'POST',
        body: tableName,
        headers:{
            "Content-type": "application/json",
            "Accept": "application/json"
        }
    })
    .then(res => res.ok ? Promise.resolve(res) : Promise.reject(new Error('Failed to load')))
    /*.then(res = JSON.parse(res))*/
    .then(res => res.json())
    .then(res=>{
        
        const table = document.getElementById("table")
        const fragment = document.createDocumentFragment()
        for(const userInfo of res){
            const row = document.createElement("TR")
            const cedula = document.createElement("TD")
            const nombre = document.createElement("TD")
            const celular = document.createElement("TD")
            const direccion = document.createElement("TD")
            const eliminar = document.createElement("TD")
            const actualizar = document.createElement("TD")
            const botonDelete = document.createElement("button")
            botonDelete.value='Borrar'
            const botonActua = document.createElement("button")
            botonActua.value='Actualizar'
            botonDelete.setAttribute('id','borrar');
            botonDelete.className = "borrar";
            cedula.textContent = userInfo.cedula
            nombre.textContent = userInfo.nombre
            celular.textContent = userInfo.celular
            direccion.textContent = userInfo.direccion
            eliminar.append(botonDelete)
            botonActua.setAttribute('id','actualizar');
            botonActua.className = "actualizar";
            actualizar.append(botonActua)
            row.append(cedula)
            row.append(nombre)
            row.append(celular)
            row.append(direccion)
            row.append(eliminar)
            row.append(actualizar)
            fragment.appendChild(row)
        }
        table.appendChild(fragment)

    }).catch(err=>console.log(err))

});