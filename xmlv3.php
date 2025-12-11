
<?php
$conexion = new mysqli("localhost", "root", "root");

// Verificar conexión
if ($conexion->connect_errno) {
    die("❌ Error de conexión: " . $conexion->connect_error);
}

$conexion->set_charset("utf8");

// --------------------------------------------------------
// 1. CREAR LA BASE DE DATOS
// --------------------------------------------------------
$sql = "CREATE DATABASE IF NOT EXISTS ies CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci";
if (!$conexion->query($sql)) {
    die("❌ Error al crear la base de datos: " . $conexion->error);
}

echo "✔ Base de datos 'ies' creada correctamente.<br>";

// Cambiar conexión a la nueva BD
$conexion->select_db("ies");


// --------------------------------------------------------
// 2. TABLA sigi_programa_estudios
// --------------------------------------------------------
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


// --------------------------------------------------------
// 3. TABLA sigi_planes_estudio
// --------------------------------------------------------
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


// --------------------------------------------------------
// 4. TABLA sigi_modulo_formativo
// --------------------------------------------------------
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


// --------------------------------------------------------
// 5. TABLA sigi_semestre
// --------------------------------------------------------
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


// --------------------------------------------------------
// 6. TABLA sigi_unidad_didactica
// --------------------------------------------------------
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


echo "✔ Todas las tablas fueron creadas correctamente.";





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


