@if(session()->has('msj'))
<div class="alert alert-success" role="alert">
  {{ session('msj') }}
</div>
@endif

@if(session()->has('errormsj'))
<div class="alert alert-danger" role="alert">
  ¡Error al guardar los datos!
</div>
@endif 


<form role="form" method="POST" enctype="multipart/form-data">


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


    {{ csrf_field() }} <!-- Para validar el token -->
    <div class="form-group">
        <label for="descripcionCargo">Descrición</label>
        <input type="text"  onkeypress="return soloLetras(event)" class="form-control" name="descripcionCargo" id="idcargo" placeholder="Ingrese el Cargo" value="{{old('descripcionCargo')}}">
           </div>

    

  <button type="button" class="btn btn-primary  btn-lg" id="btnTI" onclick="IngresarCargos()"><i class="fa fa-floppy-o " aria-hidden="true"></i></button>
</form>