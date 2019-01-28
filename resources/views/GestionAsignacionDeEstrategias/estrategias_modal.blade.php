
<div class="modal" tabindex="-1" role="dialog" id="AsignarEstrategias_modal">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header" align="center">          
                <h3 class="modal-title" > <b><i class="fa fa-file-text-o"></i> Estrategias</b></h5>  
                <br>   
                <input type="hidden" id="idRecomendacion_modal">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                </button>
                <br>  
                
                <div class="form-group">
                    <form > 
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group has-feedback">
                                    <label ></label>
                                    <textarea class="form-control" id="descripcionEstrategia_modal" placeholder="Ingrese la descripcion">
                                    </textarea>
                                </div>
                            </div>                            
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group has-feedback">
                                    <label> Fecha de Inicio: </label>
                                    <input type="date" class="form-control" id="EstrategiaFechaI">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group has-feedback">
                                    <label> Fecha de Finalizacion: </label>
                                    <input type="date" class="form-control" id="EstrategiaFechaF">
                                </div>
                            </div>
                        </div>
                        
                        <div class="row">

                        </div>

                      </form>        

                    <br>

                    <div class="table-responsive">
                        <table class="table table-hover table table-bordered  text-center">
                            <thead>
                                   <th>Descripción</th>
                                   <th>Fecha de Inicio</th>   
                                   <th>Fecha de Finalizacion</th>    
                                   <th>Estado</th>
                                   <th>% de Cumplimiento</th>
                                   <th>Asignar Usuario</th>
                                   
                            </thead>
                            <tbody id="dgvEstrategias">
                                   
                            </tbody>
                       
                        </table>
                    </div>

                </div>                  
            </div>
            
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">SALIR</button>
            <button type="button" class="btn btn-primary btn-sm" onclick="AgregarEstrategia();">AGREGAR</button> 
          </div>
      </div>
    </div>
</div>
  
  
  
  
  