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

        <input type="hidden" name="_method" id="idEstrategiasReco">

              
      <div class="col-md-12">
         <div class="form-group has-feedback">
           <label for="descripcionEstrategia"></label>
            <textarea onkeypress="return soloLetras(event)" class="form-control" name="descripcionEstrategia" id="Estrategia_descripcion" placeholder="Ingrese la descripcion">
                 </textarea>
         </div>
       </div>

   <div class="col-md-12">
       <div class="form-group has-feedback">
       <label for="descripcionEstrategia"></label>
        <input type="date" class="form-control" id="Estrategia_fecha"   name="fecha">
        </div>
     </div>
              
            
</div>
                
</form>
          
     