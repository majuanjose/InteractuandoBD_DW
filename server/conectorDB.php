<?php
/*
Autor: Juan Jose Moreno
Fecha Craci�n: 2018-05-19
Proyecto: Unidad 7 Nextu Integraci�n con BD
*/
class ConectorBD {
	private $host;
	private $user;
	private $password;
	private $nombre_db;
	private $conexion;

	function __construct($host, $user, $password) {
		$this -> host = $host;
		$this -> user = $user;
		$this -> password = $password;
	}

	function initConexion($nombre_db) {
		$this -> conexion = new mysqli($this -> host, $this -> user, $this -> password, $nombre_db);
		if ($this -> conexion -> connect_error) {
			return "Error:" . $this -> conexion -> connect_error;
		} else {
			return "OK";
		}
	}

	function getConexion() {
		return $this -> conexion;
	}

	function ejecutarQuery($query) {
		return $this -> conexion -> query($query);
	}

	function cerrarConexion() {
		$this -> conexion -> close();
	}

	function insertData($tabla, $data) {
		$sql = 'INSERT INTO ' . $tabla . ' (';
		$i = 1;
		foreach ($data as $key => $value) {
			$sql .= $key;
			if ($i < count($data)) {
				$sql .= ', ';
			} else
				$sql .= ')';
			$i++;
		}
		$sql .= ' VALUES (';
		$i = 1;
		foreach ($data as $key => $value) {
			$sql .= "'" . $value . "'";
			if ($i < count($data)) {
				$sql .= ', ';
			} else
				$sql .= ');';
			$i++;
		}
		return $this -> ejecutarQuery($sql);
	}



	function actualizarRegistro($tabla, $data, $condicion) {
		$sql = 'UPDATE ' . $tabla . ' SET ';
		$i = 1;
		
		foreach ($data as $key => $value) {
			$sql .= $key . '="' . $value. '"';
			if ($i < sizeof($data)) {
				$sql .= ', ';
			} else
				$sql .= ' WHERE ' . $condicion . ';';
			$i++;
		}
		
		return $this -> ejecutarQuery($sql);
	}


	function eliminarRegistro($tabla, $condicion) {
		$sql = 'DELETE FROM ' . $tabla . ' WHERE ' . $condicion . ';';
		return $this -> ejecutarQuery($sql);
	}

	function consultar($tablas, $campos, $condicion = "") {
		$sql = "SELECT ";
		
		$key_a = array_keys($campos);  /*Linea de codigo para version 7 de PHP*/
	    $ultima_key = end($key_a);     /*Linea de codigo para version 7 de PHP*/
      // $ultima_key = end(array_keys($campos)); /*Linea de codigo para version 5 de PHP*/
		foreach ($campos as $key => $value) {
			$sql .= $value;
			if ($key != $ultima_key) {
				$sql .= ", ";
			} else
				$sql .= " FROM ";
		}
	  $key_b = array_keys($tablas);   /*Linea de codigo para version 7 de PHP*/
	  $ultima_key = end($key_b);        /*Linea de codigo para version 7 de PHP*/
	  //$ultima_key = end(array_keys($tablas)); /*Linea de codigo para version 5 de PHP*/
		foreach ($tablas as $key => $value) {
			$sql .= $value;
			if ($key != $ultima_key) {
				$sql .= ", ";
			} else
				$sql .= " ";
		}
		if ($condicion == "") {
			$sql .= ";";
		} else {
			$sql .= ' WHERE ' . $condicion . ";";
		}
		return $this -> ejecutarQuery($sql);
	}

}
?>