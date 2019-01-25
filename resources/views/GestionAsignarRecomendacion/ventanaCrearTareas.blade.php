<form id="formregistromodal"  method="post" enctype="multipart/form-data"> 
              
      <div class="row">
    
       
 <script>
    function soloLetras(e){
       key = e.keyCode || e.which;
       tecla = String.fromCharCode(key).toLowerCase();
       letras = " áéíóúabcdefghijklmnñopqrstuvwxyz";
       especiales = "8-37-39-46";

       tecla_especial = false
       for(var i in especiales){
            if(key == especiales[i]){
                tecla_especial = true;
                break;
            }
        }

        if(letras.indexOf(tecla)==-1 && !tecla_especial){
            return false;
        }
    }
</script>  

       
    <div class="col-md-6">
    <div class="form-group has-feedback">
       <label for="descripcionTarea">Descripcion</label>
        <input type="text" onkeypress="return soloLetras(event)" class="form-control" name="descripcionTarea" id="tarea_descripcionTarea" placeholder="Ingrese la descripcion"required>
    </div>
    </div>
  

     <div class="col-md-6">
    <div class="form-group has-feedback">
        <label for="porcentajeCumplimientotarea">Porcentaje Cumplimiento</label>
       <input type="text" class="form-control" name="porcentajeCumplimientotarea" id="tarea_porcentajeCumplimientotarea" placeholder="Ingrese el porcentaje"required>
     
    </div>
    </div>
    
   <div class="col-md-6">
    <div class="form-group has-feedback">
             <label for="estadoTarea">Estado</label>
        <input type="text" onkeypress="return soloLetras(event)" class="form-control" name="estadoTarea" id="tarea_estadoTarea" placeholder="Ingrese el estado">
   
    </div>  
    </div>
    
    <div class="col-md-6">
    <div class="form-group has-feedback">
        <label for="fechaCreacion">Fecha Creacion</label>
        <input type="date" class="form-control" name="fechaCreacion" id="tarea_fechaCreacion" placeholder="Ingrese la fecha"required>

    </div>  
    </div>

  <div class="col-md-6">
    <div class="form-group has-feedback">
        <label for="fecha">Fecha</label>
        <input type="date" class="form-control" name="fecha" id="tarea_fecha" placeholder="Ingrese la descripcion">

    </div>   
    </div>  
    
    <input type="hidden" name="_method" id="idEstrategia_Tarea">

</div>
                
</form>
          
     