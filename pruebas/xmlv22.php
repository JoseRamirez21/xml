<?php
$conexion = new mysqli("localhost", "root", "root", "sigi_huanta");

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

    $num_pe = $xml->createElement('pe_'.$pe['id']);

    $num_pe->appendChild($xml->createElement('codigo', $pe['codigo']));
    $num_pe->appendChild($xml->createElement('tipo', $pe['tipo']));
    $num_pe->appendChild($xml->createElement('nombre', $pe['nombre']));

    // ===================== PLANES DE ESTUDIO ==========================
    $et_plan = $xml->createElement('planes_estudio');
    $consulta_plan = "SELECT * FROM sigi_planes_estudio WHERE id_programa_estudios = ".$pe['id'];
    $resultado_plan = $conexion->query($consulta_plan);

    while ($plan = mysqli_fetch_assoc($resultado_plan)) {

        $plan_xml = $xml->createElement('plan_'.$plan['id']);

        foreach ($plan as $campo => $valor) {
            if ($campo !== 'id' && $campo !== 'id_programa_estudios' && $campo !== 'perfil_egresado') {
                $plan_xml->appendChild($xml->createElement($campo, $valor));
            }
        }

        // ===================== MODULOS FORMATIVOS ==========================
        $et_mod = $xml->createElement('modulos_formativos');

        $consulta_mod = "SELECT * FROM sigi_modulo_formativo WHERE id_plan_estudio = ".$plan['id'];
        $resultado_mod = $conexion->query($consulta_mod);

        while ($mod = mysqli_fetch_assoc($resultado_mod)) {

            $mod_xml = $xml->createElement('modulo_'.$mod['id']);

            foreach ($mod as $campo => $valor) {
                if ($campo !== 'id' && $campo !== 'id_plan_estudio') {
                    $mod_xml->appendChild($xml->createElement($campo, $valor));
                }
            }

            // ===================== SEMESTRES ==========================
            $et_sem = $xml->createElement('semestres');

            $consulta_sem = "SELECT * FROM sigi_semestre WHERE id_modulo_formativo = ".$mod['id'];
            $resultado_sem = $conexion->query($consulta_sem);

            while ($sem = mysqli_fetch_assoc($resultado_sem)) {

                $sem_xml = $xml->createElement('semestre_'.$sem['id']);

                foreach ($sem as $campo => $valor) {
                    if ($campo !== 'id' && $campo !== 'id_modulo_formativo') {
                        $sem_xml->appendChild($xml->createElement($campo, $valor));
                    }
                }

                $et_sem->appendChild($sem_xml);
            }

            // Añadir semestres dentro del módulo
            $mod_xml->appendChild($et_sem);

            // Agregar módulo al contenedor de módulos
            $et_mod->appendChild($mod_xml);
        }

        // Agregar módulos al plan
        $plan_xml->appendChild($et_mod);

        // Agregar plan al programa
        $et_plan->appendChild($plan_xml);
    }

    $num_pe->appendChild($et_plan);
    $et1->appendChild($num_pe);
}

$xml->save("ies_bd22.xml");
?>
