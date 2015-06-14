#!/bin/bash

# generate and show html version
xsltproc html.xsl order.xml > order.html
open order.html

# generate and show pdf version
xsltproc invoice.xsl order.xml > invoice.fo
/usr/local/bin/fop invoice.fo invoice.pdf
open invoice.pdf
