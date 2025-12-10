<?php

// 1. Conectar a la base de datos
$conexion = new mysqli("localhost", "root", "root", "sigi_huanta");
if ($conexion->connect_errno) {
    echo "Error al conectar a la base de datos: " . $conexion->connect_error;
}

// 2. Crear un nuevo archivo XML
$xml = new DOMDocument('1.0', 'UTF-8');
$xml->formatOutput = true; // hace que se vea bonito y ordenado

// 3. Crear el nodo raíz (el padre principal del XML)
$et1 = $xml->createElement('programas_estudio');
$xml->appendChild($et1); // lo añadimos al XML

// 4. Traer todos los programas de estudio de la base de datos
$consulta = "SELECT * FROM sigi_programa_estudios";
$resultado = $conexion->query($consulta);

// 5. Recorrer cada programa de estudio
while ($pe = mysqli_fetch_assoc($resultado)) {

    echo $pe['nombre'] . "<br>"; // solo para mostrar en pantalla

    // Crear un nodo para este programa (hijo del padre)
    $num_pe = $xml->createElement('pe_' . $pe['id']);

    // Agregar información del programa
    $codigo_pe = $xml->createElement('codigo', $pe['codigo']);
    $num_pe->appendChild($codigo_pe);

    $tipo_pe = $xml->createElement('tipo', $pe['tipo']);
    $num_pe->appendChild($tipo_pe);

    $nombre_pe = $xml->createElement('nombre', $pe['nombre']);
    $num_pe->appendChild($nombre_pe);

    // Crear un nodo para guardar todos los planes de este programa
    $et_plan = $xml->createElement('planes_estudio');

    // 6. Traer los planes de este programa
    $consulta_plan = "SELECT * FROM sigi_planes_estudio WHERE id_programa_estudios=" . $pe['id'];
    $resultado_plan = $conexion->query($consulta_plan);

    // 7. Recorrer cada plan
    while ($plan = mysqli_fetch_assoc($resultado_plan)) {

        echo "--" . $plan['nombre'] . "<br>";

        // Crear nodo para el plan (hijo del programa)
        $num_plan = $xml->createElement('plan_' . $plan['id']);

        // Agregar datos del plan
        $nombre_plan = $xml->createElement('nombre', $plan['nombre']);
        $num_plan->appendChild($nombre_plan);

        $resolucion_plan = $xml->createElement('resolucion', $plan['resolucion']);
        $num_plan->appendChild($resolucion_plan);

        $fecha_registro_plan = $xml->createElement('fecha_registro', $plan['fecha_registro']);
        $num_plan->appendChild($fecha_registro_plan);

        // Nodo para guardar los módulos del plan
        $et_modulos = $xml->createElement('modulos_formativos');

        // 8. Traer los módulos de este plan
        $consulta_mod = "SELECT * FROM sigi_modulo_formativo WHERE id_plan_estudio=" . $plan['id'];
        $resultado_mod = $conexion->query($consulta_mod);

        // 9. Recorrer cada módulo
        while ($modulo = mysqli_fetch_assoc($resultado_mod)) {

            echo "----" . $modulo['descripcion'] . "<br>";

            // Nodo del módulo (hijo del plan)
            $num_modulo = $xml->createElement('modulo_' . $modulo['id']);

            // Datos del módulo
            $descripcion_mod = $xml->createElement('descripcion', $modulo['descripcion']);
            $num_modulo->appendChild($descripcion_mod);

            $nro_modulo_mod = $xml->createElement('nro_modulo', $modulo['nro_modulo']);
            $num_modulo->appendChild($nro_modulo_mod);

            // Nodo para guardar los periodos del módulo
            $et_periodos = $xml->createElement('periodos');

            // 10. Traer los periodos (semestres) de este módulo
            $consulta_per = "SELECT * FROM sigi_semestre WHERE id_modulo_formativo=" . $modulo['id'];
            $resultado_per = $conexion->query($consulta_per);

            // 11. Recorrer cada periodo
            while ($per = mysqli_fetch_assoc($resultado_per)) {

                echo "------" . $per['descripcion'] . "<br>";

                // Nodo del periodo (hijo del módulo)
                $num_per = $xml->createElement('periodo_' . $per['id']);

                // Agregar descripción del periodo
                $descripcion_per = $xml->createElement('descripcion', $per['descripcion']);
                $num_per->appendChild($descripcion_per);

                // Nodo para las unidades didácticas
                $et_uds = $xml->createElement('unidades_didacticas');

                // 12. Traer las unidades didácticas del periodo
                $consulta_uds = "SELECT * FROM sigi_unidad_didactica WHERE id_semestre=" . $per['id'];
                $resultado_uds = $conexion->query($consulta_uds);

                // 13. Recorrer cada unidad
                while ($uds = mysqli_fetch_assoc($resultado_uds)) {

                    echo "--------" . $uds['nombre'] . "<br>";

                    // Nodo de la unidad (hijo del periodo)
                    $num_ud = $xml->createElement('ud_' . $uds['orden']);

                    // Agregar datos de la unidad
                    $nombre_ud = $xml->createElement('nombre', $uds['nombre']);
                    $num_ud->appendChild($nombre_ud);

                    $creditos_teorico = $xml->createElement('creditos_teorico', $uds['creditos_teorico']);
                    $num_ud->appendChild($creditos_teorico);

                    $creditos_practico = $xml->createElement('creditos_practico', $uds['creditos_practico']);
                    $num_ud->appendChild($creditos_practico);

                    $tipo = $xml->createElement('tipo', $uds['tipo']);
                    $num_ud->appendChild($tipo);

                    // Calcular horas semanales y semestrales
                    $hr_semanal = ($uds['creditos_teorico'] * 1) + ($uds['creditos_practico'] * 2);
                    $hr_sem = $xml->createElement('horas_semanal', $hr_semanal);
                    $num_ud->appendChild($hr_sem);

                    $hr_semestral = $xml->createElement('horas_semestral', $hr_semanal * 16);
                    $num_ud->appendChild($hr_semestral);

                    // Añadir la unidad al contenedor de unidades
                    $et_uds->appendChild($num_ud);
                }

                // Añadir todas las unidades al periodo
                $num_per->appendChild($et_uds);

                // Añadir periodo al contenedor de periodos
                $et_periodos->appendChild($num_per);
            }

            // Añadir todos los periodos al módulo
            $num_modulo->appendChild($et_periodos);

            // Añadir módulo al contenedor de módulos del plan
            $et_modulos->appendChild($num_modulo);
        }

        // Añadir todos los módulos al plan
        $num_plan->appendChild($et_modulos);

        // Añadir plan al contenedor de planes del programa
        $et_plan->appendChild($num_plan);
    }

    // Añadir todos los planes al programa
    $num_pe->appendChild($et_plan);

    // Añadir programa al nodo raíz
    $et1->appendChild($num_pe);
}

// 14. Guardar el archivo XML
$archivo = "ies_db23.xml";
$xml->save($archivo);

