<?php
$conexion = new mysqli("localhost", "root", "root", "sigi_huanta");

// Si falla la conexión
if ($conexion->connect_errno) {
    die("❌ Error de conexión: " . $conexion->connect_error);
}
$conexion->set_charset("utf8");

$xml = new DOMDocument('1.0', 'UTF-8');
$xml->formatOutput = true;

$et1 = $xml->createElement('programas_estudios');
$xml->appendChild($et1);

$consulta = "SELECT * FROM sigi_programa_estudios";
$resultado = $conexion->query($consulta);

while ($pe = mysqli_fetch_assoc($resultado)) {
    echo $pe['nombre']."<br>";

    // Programa de estudios
    $num_pe = $xml->createElement('pe_'.$pe['id']);
    $codigo_pe = $xml->createElement('codigo', $pe['codigo']);
    $num_pe->appendChild($codigo_pe);
    $tipo_pe = $xml->createElement('tipo', $pe['tipo']);
    $num_pe->appendChild($tipo_pe);
    $nombre_pe = $xml->createElement('nombre', $pe['nombre']);
    $num_pe->appendChild($nombre_pe);

    // Planes de Estudios
    $et_plan = $xml->createElement('planes_estudio');
    $consulta_plan = "SELECT * FROM sigi_planes_estudio WHERE id_programa_estudios = ".$pe['id'];
    $resultado_plan = $conexion->query($consulta_plan);
    while($plan = mysqli_fetch_assoc($resultado_plan)){
        $plan_xml = $xml->createElement('plan_'.$plan['id']);
        foreach ($plan as $campo => $valor) {
            if ($campo !== 'id' && $campo !== 'id_programa_estudios' && $campo !== 'perfil_egresado') {
                $plan_xml->appendChild($xml->createElement($campo, $valor));
            }
        }
        // Módulos formativos
        $et_mod = $xml->createElement('modulos_formativos');
        $consulta_mod = "SELECT * FROM sigi_modulo_formativo WHERE id_plan_estudio = ".$plan['id'];
        $resultado_mod = $conexion->query($consulta_mod);
        while($mod = mysqli_fetch_assoc($resultado_mod)){
            $mod_xml = $xml->createElement('modulo_'.$mod['id']);
            foreach ($mod as $campo => $valor) {
                if ($campo !== 'id' && $campo !== 'id_plan_estudio') {
                    $mod_xml->appendChild($xml->createElement($campo, $valor));
                }
            }
            // Semestres
            $et_sem = $xml->createElement('semestres');
            $consulta_sem = "SELECT * FROM sigi_semestre WHERE id_modulo_formativo = ".$mod['id'];
            $resultado_sem = $conexion->query($consulta_sem);
            while($sem = mysqli_fetch_assoc($resultado_sem)){
                $sem_xml = $xml->createElement('semestre_'.$sem['id']);
                foreach ($sem as $campo => $valor) {
                    if ($campo !== 'id' && $campo !== 'id_modulo_formativo') {
                        $sem_xml->appendChild($xml->createElement($campo, $valor));
                    }
                }


                // Unidades Didacticas
        $et_ud = $xml->createElement('unidades_didacticas');
        $consulta_ud = "SELECT * FROM sigi_unidad_didactica WHERE id_semestre = ".$sem['id'];
        $resultado_mod = $conexion->query($consulta_ud);
        while($ud = mysqli_fetch_assoc($resultado_ud)){
            $mod_xml = $xml->createElement('unidad_didactica_'.$ud['id']);
            foreach ($ud as $campo => $valor) {
                if ($campo !== 'id' && $campo !== 'id_semestre') {
                    $ud_xml->appendChild($xml->createElement($campo, $valor));
                }

                //horas teoricas = creditos teoricos x1
                //horas practicas = creditos practicos x2

                  //horas semanales = ht + hp

                  // horas semestrales = hs1 x 16

            }
                $et_sem->appendChild($sem_xml);
            }
            $mod_xml->appendChild($et_sem); 
            $et_mod->appendChild($mod_xml); 
        }
        $plan_xml->appendChild($et_mod); 
        $et_plan->appendChild($plan_xml);
    }
    $num_pe->appendChild($et_plan);
    $et1->appendChild($num_pe); 
}

$archivo = "ies_bd1.xml";
$xml->save($archivo);

?>
