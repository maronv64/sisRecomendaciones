
window.onload=mostrarEstrategia();
/*FUNCION PARA INGRESAR LOS ACTIVIDAD*/

function ingresarEstrategia(){ 
    //Datos que se envian a la ruta   
    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });
//alert("hola");
    var FrmData = {
        descripcionEstrategia:$('#Estrategia_descripcion').val(),
        fecha: $('#Estrategia_fecha').val(),
        recomendacionesusuarios_id: $('#idEstrategiasReco').val(),
        

    }
    //alert("hola *" +FrmData.descripcionA );
    //debugger
    $.ajax({
        url:'Estrategia', // Url que se envia para la solicitud esta en el web php es la ruta
        method: "POST",             // Tipo de solicitud que se enviará, llamado como método
        data: FrmData,               // Datos enviados al servidor, un conjunto de pares clave / valor (es decir, campos de formulario y valores)
        success: function (data)   // Una función a ser llamada si la solicitud tiene éxito
        {
            
            mostrarEstrategia($('#idEstrategiasReco').val());  
             
                
            limpiarEstrategia();
        },
        complete: function(){
               
            }
    });  
}


/*MOSTRAR TODOS LO ACTIVIDA*/
function mostrarEstrategia(id){
    $.get('FiltrarEstrategias/'+id, function (data) {
        $("#tablaestrategia").html("");
        $.each(data, function(i, item) { //recorre el data 
           cargartablaEstrategia(item); // carga los datos en la tabla
        });      
    });
    
}

 

function eliminarEstrategia(id){
    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });
    var FrmData ;
    $.ajax({
        url:'Estrategia/'+id, // Url que se envia para la solicitud esta en el web php es la ruta
        method: "DELETE",             // Tipo de solicitud que se enviará, llamado como método
        data: FrmData,               // Datos enviados al servidor, un conjunto de pares clave / valor (es decir, campos de formulario y valores)
        success: function (data)   // Una función a ser llamada si la solicitud tiene éxito
        {   
            mostrarEstrategia($('#idEstrategiasReco').val());  
            // carga los datos en la tabla                       
        }
    });
}

/*MUESTRA LOS DATOS DEL TAREA SELECCIONADO  EN EL MODAL */
function prepararactualizarEstrategia(id){
   
    $.get('preparactualizarEstrategia/'+id,function(data){
        $('#idEstrategia').val(data.id);
        $('#descripcionE').val(data.descripcionEstrategia);
        $('#fechaF').val(data.fecha); 
        //$('#estrategia_recousuarioid').val(data.recousuarios_v2.id);
                          
    });
}
/*PARA ACTUALIZAR LOS DATOS DEL TAREA*/
function EstrategiaUpdate(){ 

   var FrmData = {
        id: $('#idEstrategia').val(),
        descripcionEstrategia:$('#descripcionE').val(),
        fecha:$('#fechaF').val(),
        //recomendacionesusuarios_id: $('#estrategia_recousuarioid').val(),
       
    
    }
    console.log(FrmData);
    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });
    $.ajax({
        url:'Estrategia/'+ $('#idEstrategia').val(), // Url que se envia para la solicitud esta en el web php es la ruta
        method: "PUT",             // Tipo de solicitud que se enviará, llamado como método
        data: FrmData,               // Datos enviados al servidor, un conjunto de pares clave / valor (es decir, campos de formulario y valores)
        success: function (data)   // Una función a ser llamada si la solicitud tiene éxito
        {
            mostrarEstrategia($('#idEstrategiasReco').val());  
            limpiarEstrategia();
        },
       
    });  
}

/*PARA LIMPIAR LOS COMPONENTES DEL FORMULARIO*/
function  limpiarEstrategia(){
    $('#Estrategia_descripcion').val('');
    $('#Estrategia_fecha').val('');
}


/*FUNCIÓN PARA CARGAR LOS TAREA EN LA TABLA*/
function cargartablaEstrategia(data){
  //debugger
    $("#tablaestrategia").append(
        "<tr id='fila_cod"+"'>\
         <td>"+ data.descripcionEstrategia+"</td>\
         <td>"+ data.fecha+"</td>\
         <td class='row'><button type='button' class='btn btn-info' data-toggle='modal' onClick='Mostrar_estrategia_Tarea("+data.id+")'><i class= 'fa fa-	fa fa-folder-open-o'></i></button></td>\
         <td class='row'><button type='button' class='btn btn-warning' data-toggle='modal' data-target='#actualizarEstrategiamodal' onClick='prepararactualizarEstrategia("+data.id+")'><i class='fa fa-edit'></i></button></td>\
         <td class='row'> <button type='button' class='btn btn-danger' id='btn-confirm' onClick='eliminarEstrategia("+data.id+")'><i class='fa fa-trash'></i></button></td>\
         </tr>"
    );
}


function Mostrar_estrategia_Tarea(id){
    $('#ventanaAgregarTareas').modal('show');
    $('#idEstrategia_Tarea').val(id);
    mostrarTareas(id);
       
}


