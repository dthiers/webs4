<?php
header('Content-Type: text/xml');
echo '<?xml version="1.0"';
echo '?>';
echo "\n";
echo '<?xml-stylesheet href="aii_css.xsl" type="text/xsl"';
echo '?>';
echo "\n";
$items = array(
               array('richting'  => 'in',
                     'naam' => 'Netwerken en Internet',
                     'coordinator_docent'  => 'Rob Verhoef',
                     'coordinator_kamer'  => 'G555',
                     'coordinator_email'  => ''),
               array('richting'  => 'ti',
                     'naam' => 'Embedded Software',
                     'coordinator_docent'  => 'Bob Verlaat',
                     'coordinator_kamer'  => 'G666',
                     'coordinator_email'  => 'bverlaat@avans.nl')
               );
?>
<aii>
<?php
foreach($items as $item) {
  echo '<kennisgebied richting="';
  echo $item["richting"];
  echo '">';
  echo "\n";
  echo "  <naam>{$item['naam']}</naam>\n";
  echo "  <coordinator>\n";
  echo "    <docent>{$item['coordinator_docent']}</docent>\n";
  echo "    <kamer>{$item['coordinator_kamer']}</kamer>\n";
  echo "    <email>{$item['coordinator_email']}</email>\n";
  echo "  </coordinator>\n";
  echo "</kennisgebied>\n";
}
?>
</aii>

