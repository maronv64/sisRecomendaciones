window.onload = function() {
    //alert('hola');
    CargarRecomendacionesGenerales();
}
function CargarRecomendacionesGenerales() {
    $('#dgvRecomendaciones').html('');
    $.get('RecomendacionesMostrar/', function (data) {
        $.each(data, function(i, item) { //recorre el data 
            var fila="";
            fila+='<tr>';
            fila+='<td>'+ item.descripcionRecomendacion + '</td>';
            fila+='<td>'+ item.porcentajeCumplimiento + '</td>';
            fila+='<td>'+ item.estadoRecomendacion + '</td>';
            fila+='<td>'+ item.subtemas_v2.descripcionSubtema+ '</td>';
            fila+= "<td class='row'> <center> <button type='button' class='btn btn-info' onClick='mostarMisEstrategias("+item.id+")'><i class='fa fa-map-o'></i></button></td>";
            fila+=''
            fila+='</tr>';
          
            $('#dgvRecomendaciones').append(fila);

        });

    });
}

function mostarMisEstrategias(_id) {
    CargarEstrategias(_id);
    $('#AsignarEstrategias_modal').modal('show');
    $('#idRecomendacion_modal').val(_id);
    
}
function AgregarEstrategia() {
    
    var FrmData={
        recomendacion_id:       $('#idRecomendacion_modal').val(),
        descripcionEstrategia:  $('#descripcionEstrategia_modal').val(),
        fechaInicio:            $('#EstrategiaFechaI').val(),
        fechaFin:               $('#EstrategiaFechaF').val(),
    }    
    //alert($('#idRecomendacion_modal').val());
    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });

    $.ajax({
        url: 'Estrategia', // Url que se envia para la solicitud esta en el web php es la ruta
        method: "POST",             // Tipo de solicitud que se enviará, llamado como método
        data: FrmData,               // Datos enviados al servidor, un conjunto de pares clave / valor (es decir, campos de formulario y valores)
        success: function (data)   // Una función a ser llamada si la solicitud tiene éxito
        {
            alert('Datos Guardados')
        },
        error: function () {
            
        },
        complete: function(){
            
        }
    });

}

function CargarEstrategias(_idR) {
    $('#dgvEstrategias').html('');
    $.get('estrategiasRecomendacion/'+_idR, function (data) {

        $.each(data, function(i, item) { //recorre el data 
            var fila="";
            fila+='<tr>';
            fila+='<td>'+ item.descripcionEstrategia + '</td>';
            fila+='<td>'+ item.fechaInicio + '</td>';
            fila+='<td>'+ item.fechaFin + '</td>';
            fila+='<td>'+ item.Estado+ '</td>';
            fila+='<td>'+ item.porcentajeCumplimiento+ '</td>';
            fila+= "<td class='row'> <center> <button type='button' class='btn btn-info' onClick='asignarUsuario("+item.id+")'><i class='fa fa-map-o'></i></button></td>";
            fila+='</tr>';
            $('#dgvEstrategias').append(fila);
        });        
    });
}