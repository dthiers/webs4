<?php

function start_element($parser, $name, &$attributes) {
  global $depth;
  print "<br/>";
  for ($i = 0; $i <$depth; $i++) {
  	print '=';
  }
  print $name.": ";
  $depth++;
}

function end_element($parser, $name) {
  global $depth;
  $depth--;
}

function character_data($parser, $data) {
  print $data;
}


  $parser = xml_parser_create();
  xml_set_element_handler($parser, 'start_element', 'end_element');
  xml_set_character_data_handler($parser, 'character_data');

  $filename = "aii.xml";
  if (!($fp = fopen($filename,'r'))) {
  	die('XML-bestand kon niet geopend worden');
  }

  $blockSize = 4 * 1024;                    // read in 4 KB chunks
  while($data = fread($fp, $blockSize)) {
    if (!xml_parse($parser, $data, feof($fp))) {
      // an error occurred; tell the user where
      echo '<h3>Parse error: '.xml_error_string($parser)." at line ".xml_get_current_line_number($parser)."</h3>";
    }
  }
  fclose($fp);
  xml_parser_free($parser);

?>

