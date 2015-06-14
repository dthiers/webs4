<?php
error_reporting(E_ALL);

function nodeType2Str($nodeType)
{
	$str = "nodeTypeToStr: UNKNOWN";
	if ($nodeType == XML_ELEMENT_NODE)
	  { $str = "xml_element"; }
	elseif ($nodeType == XML_ATTRIBUTE_NODE)
	  { $str = "xml_attribute"; }
	elseif ($nodeType == XML_TEXT_NODE)
	  { $str = "xml_text"; }
	elseif ($nodeType == XML_CDATA_SECTION_NODE)
	  { $str = "xml_cdata_section"; }
	elseif ($nodeType == XML_ENTITY_REF_NODE)
	  { $str = "xml_entity_ref"; }
	elseif ($nodeType == XML_ENTITY_NODE)
	  { $str = "xml_entity"; }
	elseif ($nodeType == XML_PI_NODE)
	  { $str = "xml_pi"; }
	elseif ($nodeType == XML_COMMENT_NODE)
	  { $str = "xml_comment"; }
	elseif ($nodeType == XML_DOCUMENT_NODE)
	  { $str = "xml_document"; }
	elseif ($nodeType == XML_DOCUMENT_TYPE_NODE)
	  { $str = "xml_document_type"; }
	elseif ($nodeType == XML_DOCUMENT_FRAG_NODE)
	  { $str = "xml_document_frag"; }
	elseif ($nodeType == XML_NOTATION_NODE)
	  { $str = "xml_notation"; }
	else
      { $str = "nodeTypeToStr: UNKNOWN"; }
    return $str;
}

function domTree($node, $depth)
{
	$fill = str_pad("", $depth*2 , "-");
	$nodeType = nodeType2Str($node->nodeType);
	echo "{$fill}{$node->nodeName}";
	if (  ($node->nodeType == XML_ATTRIBUTE_NODE)
	    ||($node->nodeType == XML_TEXT_NODE)
	    ||($node->nodeType == XML_COMMENT_NODE) )
	  {
	    echo "->{$node->nodeValue}";
      }
	echo "<br>\n";
	if ($node->nodeType == XML_ELEMENT_NODE)
	  { // element, dan alle children doorlopen
	    // eerst attributen 
        foreach ($node->attributes as $child)
	      {domTree($child,$depth);}
	    // dan alle children
        foreach ($node->childNodes as $child)
	      {domTree($child,$depth+1);}
	  }
}	

if (isset($_GET) && isset($_GET['f']))
    { $file = $_GET['f']; }
  else
    { $file = 'aii.xml'; }


$dom = new DOMDocument;
// Whitespace is no longer significant
$dom->preserveWhiteSpace = false;

// read from a file
if (!$dom->load($file))
{
 echo "Error while loading the document\n";
 exit;
}

//vraag de root op
$root = $dom->documentElement;
//en vervolgens de domTree vanaf de root
domTree($root, 0);
?>
