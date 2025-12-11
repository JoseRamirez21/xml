<?php
$conexion = new mysqli("localhost", "root", "root", "sigi_huanta");

if ($conexion->connect_errno) {
    die("❌ Error de conexión: " . $conexion->connect_error);
}
$conexion->set_charset("utf8");

$xml = new DOMDocument('1.0', 'UTF-8');
$xml->formatOutput = true;

$root = $xml->createElement('programas_estudios');
$xml->appendChild($root);

$consulta = "SELECT * FROM sigi_programa_estudios";
$resultado = $conexion->query($consulta);

while ($pe = mysqli_fetch_assoc($resultado)) {

    $pe_xml = $xml->createElement('pe_'.$pe['id']);
    $pe_xml->appendChild($xml->createElement('codigo', $pe['codigo']));
    $pe_xml->appendChild($xml->createElement('tipo', $pe['tipo']));
    $pe_xml->appendChild($xml->createElement('nombre', $pe['nombre']));

    // PLANES DE ESTUDIO
    $planes_xml = $xml->createElement('planes_estudio');
    $consulta_plan = "SELECT * FROM sigi_planes_estudio WHERE id_programa_estudios = ".$pe['id'];
    $resultado_plan = $conexion->query($consulta_plan);

    while ($plan = mysqli_fetch_assoc($resultado_plan)) {

        $plan_xml = $xml->createElement('plan_'.$plan['id']);

        foreach ($plan as $campo => $valor) {
            if (!in_array($campo, ['id', 'id_programa_estudios', 'perfil_egresado'])) {
                $plan_xml->appendChild($xml->createElement($campo, $valor));
            }
        }

        // MÓDULOS FORMATIVOS
        $modulos_xml = $xml->createElement('modulos_formativos');
        $consulta_mod = "SELECT * FROM sigi_modulo_formativo WHERE id_plan_estudio = ".$plan['id'];
        $resultado_mod = $conexion->query($consulta_mod);

        while ($mod = mysqli_fetch_assoc($resultado_mod)) {

            $mod_xml = $xml->createElement('modulo_'.$mod['id']);

            foreach ($mod as $campo => $valor) {
                if (!in_array($campo, ['id', 'id_plan_estudio'])) {
                    $mod_xml->appendChild($xml->createElement($campo, $valor));
                }
            }

            // SEMESTRES
            $semestres_xml = $xml->createElement('semestres');
            $consulta_sem = "SELECT * FROM sigi_semestre WHERE id_modulo_formativo = ".$mod['id'];
            $resultado_sem = $conexion->query($consulta_sem);

            while ($sem = mysqli_fetch_assoc($resultado_sem)) {

                $sem_xml = $xml->createElement('semestre_'.$sem['id']);

                foreach ($sem as $campo => $valor) {
                    if (!in_array($campo, ['id', 'id_modulo_formativo'])) {
                        $sem_xml->appendChild($xml->createElement($campo, $valor));
                    }
                }

                // UNIDADES DIDÁCTICAS
                $uds_xml = $xml->createElement('unidades_didacticas');
                $consulta_ud = "SELECT * FROM sigi_unidad_didactica WHERE id_semestre = ".$sem['id'];
                $resultado_ud = $conexion->query($consulta_ud);

                while ($ud = mysqli_fetch_assoc($resultado_ud)) {

                    $ud_xml = $xml->createElement('unidad_didactica_'.$ud['id']);

                    foreach ($ud as $campo => $valor) {
                        if (!in_array($campo, ['id', 'id_semestre'])) {
                            $ud_xml->appendChild($xml->createElement($campo, $valor));
                        }
                    }

                    // Calculos: horas teoricas, practicas, semestrales (opcionales)
                    // Puedes agregarlos después aquí

                    $uds_xml->appendChild($ud_xml);
                }

                $sem_xml->appendChild($uds_xml);
                $semestres_xml->appendChild($sem_xml);
            }

            $mod_xml->appendChild($semestres_xml);
            $modulos_xml->appendChild($mod_xml);
        }

        $plan_xml->appendChild($modulos_xml);
        $planes_xml->appendChild($plan_xml);
    }

    $pe_xml->appendChild($planes_xml);
    $root->appendChild($pe_xml);
}

$xml->save("ies_bd1.xml");
?>
