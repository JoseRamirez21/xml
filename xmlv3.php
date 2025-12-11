<?php
//conexion a la BD
//en cada foreach aser las consultas insert into sigi_programas_estudios, CREAR BD Y MEJOR SI SE CREA LAS TABLAS DESDE EL CODIGO O TAMBIEN MANUAL Y LAS CONSULTAS DESDE AQUI SI
$xml = simplexml_load_file('ies_bd1.xml') or die('Error, No se cargo el XML escribe correctamente el nombre el archivo');

//echo $xml->pe_1->nombre."<br>";
//echo $xml->pe_2->nombre;
foreach ($xml as $i_pe => $pe) {
    echo 'Codigo:'.$pe->codigo.'<br>';
    echo 'Tipo:'.$pe->tipo.'<br>';
    echo 'Nombre:'.$pe->nombre.'<br>';
    //$consulta = INSERT INTO BD() VALUES() PARA TODAS LAS INFO DE LA BD
    foreach($pe->planes_estudio[0] as $i_ple => $plan){
    echo '--'.$plan->nombre. '<br>';
    echo '--'.$plan->resolucion. '<br>';
    echo '--'.$plan->fecha_registro. '<br>';
        foreach($plan->modulos_formativos[0] as $i_mod => $modulo){
        echo '----'.$modulo->descripcion. '<br>';
            foreach($modulo->semestres[0] as $i_sem => $semestre){
             echo '------'.$semestre->descripcion. '<br>';
                foreach($semestre->unidades_didacticas[0] as $i_ud => $ud){
                  echo '--------'.$ud->nombre. '<br>';
                  echo '--------'.$ud->creditos_teorico. '<br>';
                  echo '--------'.$ud->creditos_practico. '<br>';
                  echo '--------'.$ud->tipo. '<br>';
                  echo '--------'.$ud->orden. '<br>';
    }
    }
    }
}
}

?>