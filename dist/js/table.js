window.addEventListener('DOMContentLoaded', (e) => {
    e.preventDefault();
    const path = "../php/manicuristaScript.php"
    fetch(path)
    .then(res => res.ok ? Promise.resolve(res) : Promise.reject(new Error('Failed to load')))
    /*.then(res = JSON.parse(res))*/
    .then(res => res.json())
    .then(res=>{
        
        const table = document.getElementById("table")
        const fragment = document.createDocumentFragment()
        //for(const userInfo of res){
            const row = document.createElement("TR")
            const cedula = document.createElement("TD")
            const nombre = document.createElement("TD")
            const celular = document.createElement("TD")
            const direccion = document.createElement("TD")
            const botonDelete = document.createElement("button")
            botonDelete.textContent('Borrar')
            const botonActua = document.createElement("button")
            botonActua.textContent('Actualizar')
            botonDelete.setAttribute('id','borrar');
            botonDelete.className = "borrar";
            cedula.textContent = userInfo.cedula
            nombre.textContent = userInfo.nombre
            celular.textContent = userInfo.celular
            direccion.textContent = userInfo.direccion
            const eliminar = document.createElement("TD")
            eliminar.append(boton1)
            botonActua.setAttribute('id','actualizar');
            botonActua.className = "actualizar";
            const actualizar = document.createElement("TD")
            actualizar.append(boton)
            row.append(cedula)
            row.append(nombre)
            row.append(celular)
            row.append(direccion)
            row.append(eliminar)
            row.append(actualizar)
            fragment.appendChild(row)
        //}
        table.appendChild(fragment)

    }).catch(err=>console.log(err))

});