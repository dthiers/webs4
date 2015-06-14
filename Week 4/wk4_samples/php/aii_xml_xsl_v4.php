<?php
//////////////////////////////////////////////////////////////////////////////
/// XSL-extensie moet geladen zijn voor PHP5 (onder Windows in PHP.INI te regelen)/////
///////////////////////////////////////////////////////////////////////////////

error_reporting(E_ALL);

// Load the XML source
$xml = new DOMDocument;
$xml->load('aii.xml');

// Load the XSL source
$xsl = new DOMDocument;
$xsl->load('aii_css.xsl');

// Create XSLT-processor and attach xsl rules
$proc = new XSLTProcessor;
$proc->importStyleSheet($xsl); 

// And do it!
echo $proc->transformToXML($xml);

?>