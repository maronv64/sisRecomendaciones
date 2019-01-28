<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Estrategia extends Model
{
    protected $table = 'estrategia';
    protected $primaryKey = 'id';
    public $timestamps=false;
    protected $fillable = [
        'descripcionEstrategia','fechaInicio','fechaFin' ,'estado','porcentajeCumplimiento','recomendacion_id'
    ];
    
    public function recomendacion(){
        return $this->hasOne('App\Recomendacion','id','recomendacion_id');
    }

    public function  Recousuarios(){
        return $this->belongsTo('App\RecomendacionUsuario','recomendacionesusuarios_id', 'id');
    }

    public function  RecousuariosV2(){
        return $this->hasOne('App\RecomendacionUsuario','id','recomendacionesusuarios_id');
    }

    public function  Tareas(){
        return $this->hasMany('App\Estrategia','id');
    }
    

    // public function TipoUsuariov2 (){
    //     return $this->hasOne('App\TipoUsuario','id', 'tipousuario_id');
    // }
     
}
