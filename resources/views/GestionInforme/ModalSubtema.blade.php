
<div class="modal" tabindex="-1" role="dialog" id="ventanaModal_Informesubtema">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
        <div class="modal-header" align="center">
        
          <h3 class="modal-title" > <b><i class="fa fa-file-text-o"></i> AGREGAR SUBTEMA</b></h5>

            <br>   
               <input type="hidden" name="_method" id="idns">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          </button>
                    <br>  
           @include('GestionInforme.ventanaModalSubtema')
            <div class="form-group">
            <br>
                @include('GestionInforme.MostraSubtemas')
          </div>
                
        </div>
          
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">SALIR</button>
          <button type="button" class="btn btn-primary btn-sm" onclick="ingresarSubtema();">AGREGAR</button> 
        </div>
    </div>
  </div>
</div>




