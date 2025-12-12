
<?php
$conexion = new mysqli("localhost", "root", "root");

if ($conexion->connect_errno) {
    die("❌ Error de conexión: " . $conexion->connect_error);
}
$conexion->set_charset("utf8");

$sql = "CREATE DATABASE IF NOT EXISTS ies13";
if (!$conexion->query($sql)) {
    die("❌ Error al crear la base de datos: " . $conexion->error);
}

echo "✔ Base de datos 'ies13' creada correctamente.<br>";
$conexion->select_db("ies13");

$sql = "
CREATE TABLE IF NOT EXISTS sigi_programa_estudios (
  id INT NOT NULL AUTO_INCREMENT,
  codigo VARCHAR(10) COLLATE utf8mb3_spanish2_ci,
  tipo VARCHAR(20) COLLATE utf8mb3_spanish2_ci,
  nombre VARCHAR(100) COLLATE utf8mb3_spanish2_ci,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;
";
$conexion->query($sql);

$sql = "
CREATE TABLE IF NOT EXISTS sigi_planes_estudio (
  id INT NOT NULL AUTO_INCREMENT,
  id_programa_estudios INT NOT NULL,
  nombre VARCHAR(20) COLLATE utf8mb3_spanish2_ci,
  resolucion VARCHAR(100) COLLATE utf8mb3_spanish2_ci,
  fecha_registro DATETIME,
  perfil_egresado VARCHAR(3000) COLLATE utf8mb3_spanish2_ci,
  PRIMARY KEY (id),
  KEY fk_planes_programa (id_programa_estudios),
  CONSTRAINT fk_planes_programa FOREIGN KEY (id_programa_estudios) 
        REFERENCES sigi_programa_estudios(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;
";
$conexion->query($sql);

$sql = "
CREATE TABLE IF NOT EXISTS sigi_modulo_formativo (
  id INT NOT NULL AUTO_INCREMENT,
  descripcion VARCHAR(1000) COLLATE utf8mb3_spanish2_ci,
  nro_modulo INT NOT NULL,
  id_plan_estudio INT NOT NULL,
  PRIMARY KEY (id),
  KEY fk_modulo_plan (id_plan_estudio),
  CONSTRAINT fk_modulo_plan FOREIGN KEY (id_plan_estudio) 
        REFERENCES sigi_planes_estudio(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;
";
$conexion->query($sql);

$sql = "
CREATE TABLE IF NOT EXISTS sigi_semestre (
  id INT NOT NULL AUTO_INCREMENT,
  descripcion VARCHAR(5) COLLATE utf8mb3_spanish2_ci,
  id_modulo_formativo INT NOT NULL,
  PRIMARY KEY (id),
  KEY fk_semestre_modulo (id_modulo_formativo),
  CONSTRAINT fk_semestre_modulo FOREIGN KEY (id_modulo_formativo) 
        REFERENCES sigi_modulo_formativo(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;
";
$conexion->query($sql);


$sql = "
CREATE TABLE IF NOT EXISTS sigi_unidad_didactica (
  id INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(200) COLLATE utf8mb3_spanish2_ci,
  id_semestre INT NOT NULL,
  creditos_teorico INT,
  creditos_practico INT,
  tipo VARCHAR(20) COLLATE utf8mb3_spanish2_ci,
  orden INT,
  PRIMARY KEY (id),
  KEY fk_ud_semestre (id_semestre),
  CONSTRAINT fk_ud_semestre FOREIGN KEY (id_semestre)
        REFERENCES sigi_semestre(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;
";
$conexion->query($sql);

echo "✔ Todas las tablas fueron creadas correctamente.<br>";





$xml = simplexml_load_file('ies_bd1.xml') or die("❌ No se pudo cargar ies_bd1.xml");

foreach ($xml as $i_pe => $pe) {
   echo $codigo = $pe->codigo; 
   echo $tipo   = $pe->tipo; 
    echo $nombre = $pe->nombre;

    $sql = "INSERT INTO sigi_programa_estudios (codigo, tipo, nombre)
            VALUES ('$codigo','$tipo','$nombre')";
    $conexion->query($sql);
    $id_programa = $conexion->insert_id;

    foreach($pe->planes_estudio[0] as $i_ple => $plan){
        $nombre_plan  = $plan->nombre;
        $resolucion   = $plan->resolucion;
        $fecha        = $plan->fecha_registro;
        $perfil       = $plan->perfil_egresado;

        $sql = "INSERT INTO sigi_planes_estudio 
                (id_programa_estudios, nombre, resolucion, fecha_registro, perfil_egresado)
                VALUES ($id_programa, '$nombre_plan', '$resolucion', '$fecha', '$perfil')";
        $conexion->query($sql);
        $id_plan = $conexion->insert_id;

        foreach($plan->modulos_formativos[0] as $i_mod => $modulo){
            $descripcion = $modulo->descripcion;
            $nro_modulo  = $modulo->nro_modulo;

            $sql = "INSERT INTO sigi_modulo_formativo 
                    (descripcion, nro_modulo, id_plan_estudio)
                    VALUES ('$descripcion', $nro_modulo, $id_plan)";
            $conexion->query($sql);
            $id_modulo = $conexion->insert_id;

            foreach($modulo->semestres[0] as $i_sem => $semestre){
                $descripcion_sem = $semestre->descripcion;

                $sql = "INSERT INTO sigi_semestre (descripcion, id_modulo_formativo)
                        VALUES ('$descripcion_sem', $id_modulo)";
                $conexion->query($sql);
                $id_semestre = $conexion->insert_id;

                foreach($semestre->unidades_didacticas[0] as $i_ud => $ud){
                    $nombre_ud  = $ud->nombre;
                    $t          = $ud->creditos_teorico;
                    $p          = $ud->creditos_practico;
                    $tipo_ud    = $ud->tipo;
                    $orden      = $ud->orden;

                    $sql = "INSERT INTO sigi_unidad_didactica 
                            (nombre, id_semestre, creditos_teorico, creditos_practico, tipo, orden)
                            VALUES ('$nombre_ud', $id_semestre, $t, $p, '$tipo_ud', $orden)";
                    $conexion->query($sql);
                }
            }
        }
    }
}
//Se muestra 359 unidades didacticas porque no exixte el 133 

echo "XML insertado correctamente";

?>


