using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.Xml;
using System.Xml.Xsl;
using System.IO;
using System.Xml.Schema;

namespace xp_01
{
    public partial class Form1 : Form
    {
        private bool validXml;

        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        // aanmaken van een XML bestand via een XmlTextWriter
        private void btnWriteXmlWriter_Click(object sender, EventArgs e)
        {
            XmlTextWriter xtw = null;
            xtw = new XmlTextWriter("AII.XML", null);
            try
            {
                xtw.Formatting = Formatting.Indented;
                xtw.Indentation = 2;
                xtw.Namespaces = false;

                xtw.WriteStartDocument();
                xtw.WriteStartElement("aii");

                  xtw.WriteStartElement("kennisgebied");
                    xtw.WriteStartAttribute("richting");
                    xtw.WriteString("in");
                    xtw.WriteEndAttribute();

                    xtw.WriteStartElement("naam");
                      xtw.WriteString("netwerken en internet");
                    xtw.WriteEndElement();

                    xtw.WriteStartElement("coordinator");
                      xtw.WriteStartElement("docent");
                        xtw.WriteString("Rob Verhoef");
                      xtw.WriteEndElement();

                      xtw.WriteStartElement("kamer");
                        xtw.WriteString("OG 103");
                      xtw.WriteEndElement();

                      xtw.WriteStartElement("email");
                      xtw.WriteEndElement();

                    xtw.WriteEndElement();
                  xtw.WriteEndElement();

                  xtw.WriteStartElement("kennisgebied");
                    xtw.WriteStartAttribute("richting");
                      xtw.WriteString("ti");
                    xtw.WriteEndAttribute();

                    xtw.WriteStartElement("naam");
                      xtw.WriteString("embedded software");
                    xtw.WriteEndElement();

                    xtw.WriteStartElement("coordinator");
                      xtw.WriteStartElement("docent");
                        xtw.WriteString("Bob Verlaat");
                      xtw.WriteEndElement();

                      xtw.WriteStartElement("kamer");
                        xtw.WriteString("OX 987");
                      xtw.WriteEndElement();

                      xtw.WriteStartElement("email");
                        xtw.WriteString("bax.verlaat@avans.nl");
                      xtw.WriteEndElement();

                    xtw.WriteEndElement();
                  xtw.WriteEndElement();

                  xtw.WriteEndElement();
                xtw.Flush();
            }
            catch (Exception exc)
            {
                Console.WriteLine("Exception: {0}", exc.ToString());
            }
            finally
            {
                if (xtw != null)
                {
                    xtw.Close();
                }
            }

            //ter verificatie lezen we bestand in en laten we dat in txtOutput zien
            string str = readFromFile("AII.XML");
            this.txtOutput.Text = str;
            //en bovendien koppelen we dat aan het wbOutput-veld
            this.wbOutput.Navigate(Application.StartupPath + "\\AII.XML");
        }

        // inlezen van een XML-file als DOM document
        private void btnReadDom_Click(object sender, EventArgs e)
        {
            XmlTextReader reader = new XmlTextReader("AII.XML");
            reader.WhitespaceHandling = WhitespaceHandling.None;
            XmlDocument xmlDoc = new XmlDocument();
            //Load the file into the XmlDocument
            xmlDoc.Load(reader);
            //Close off the connection to the file.
            reader.Close();

            this.txtOutput.Text = "";
            XmlNode xnod = xmlDoc.DocumentElement;
            processDOM(xnod,1);
        }
    
        private void processDOM(XmlNode xnod, Int32 intLevel)
        {
            //Adds a node to the textbox, togather with its children.
            //intLevel controls the depth of indenting
            XmlNode xnodWorking;
            String strIndent = new string('-',4 * intLevel);
            //Get the value of the node (if any)
            string strValue = (string) xnod.Value;
            if(strValue != null)
            {
                strValue = " : " + strValue;
            }
            this.txtOutput.AppendText(strIndent + xnod.Name + strValue + "\r\n");

            //For an element node, retrive the attributes
            if (xnod.NodeType == XmlNodeType.Element)
            {
                XmlNamedNodeMap mapAttributes = xnod.Attributes;
                //Add the attributes to the ListBox
                foreach(XmlNode xnodAttribute in mapAttributes)
                {
                    this.txtOutput.AppendText(strIndent + " " + xnodAttribute.Name +
                        " : " + xnodAttribute.Value + "\r\n");
                }
                //If there are any child node, call this procedrue recursively
                if(xnod.HasChildNodes)
                {
                    xnodWorking = xnod.FirstChild;
                    while (xnodWorking != null)
                    {
                        processDOM(xnodWorking, intLevel +1);
                        xnodWorking = xnodWorking.NextSibling;
                    }
                }
            }
        }

        private void btnValidate1_Click(object sender, EventArgs e)
        {
            bool valid;
            this.txtOutput.Text = "validating ADRESBOEK1.XML...";
            valid = validateXmlWithSchema("ADRESBOEK1.XML");
            if (valid)
            { this.txtOutput.AppendText("\r\n" + "==> valid!!"); }
            else
            { this.txtOutput.AppendText("\r\n" + " ==> sorry:  NOT valid!!"); }
        }

        private void btnValidate2_Click(object sender, EventArgs e)
        {
            bool valid;
            this.txtOutput.Text = "validating ADRESBOEK2.XML ...";
            valid = validateXmlWithoutSchema("ADRESBOEK2.XML");
            if (valid)
            { this.txtOutput.AppendText("\r\n" + " ==> valid!!"); }
            else
            { this.txtOutput.AppendText("\r\n" + " ==> sorry:  NOT valid!!"); }

        }

        private bool validateXmlWithSchema(String fileName)
        {
            //First we create the xmltextreader
            XmlTextReader xmlr = new XmlTextReader(fileName);
            //We pass the xmltextreader into the xmlvalidatingreader
            //This will validate the xml doc with the schema file
            //NOTE the xml file it self points to the schema file
            XmlValidatingReader xmlvread = new XmlValidatingReader(xmlr);

            // Set the validation event handler
            xmlvread.ValidationEventHandler += 
                new ValidationEventHandler (ValidationCallBack);
            validXml = true; //make sure to reset the success var

            // Read XML data
            while (xmlvread.Read()){}

            //Close the reader.
            xmlvread.Close();

            //The validationeventhandler is the only thing that would set 
            //validXml to false
            return validXml;
        }

        public bool validateXmlWithoutSchema(string fileName)
        {
            validXml = false;
            // Declare local objects
            XmlTextReader         tr   = null;
            XmlSchemaCollection   xsc  = null;
            XmlValidatingReader   vr   = null;

            // Text reader object
            tr  = new XmlTextReader("adresboek.xsd");
            xsc = new XmlSchemaCollection();
            xsc.Add(null, tr);

            // XML validator object
            XmlTextReader xmlr = new XmlTextReader(fileName);
            vr = new XmlValidatingReader(xmlr);
            vr.Schemas.Add(xsc);

            // Add validation event handler
            vr.ValidationType = ValidationType.Schema;
            vr.ValidationEventHandler +=
                new ValidationEventHandler(ValidationCallBack);

            // Validate XML data
            while(vr.Read());

            vr.Close();
            return (validXml);
        }

        private void ValidationCallBack(Object sender, ValidationEventArgs args)
        {
            //Display the validation error.  This is only called on error
            validXml = false; //Validation failed
            this.txtOutput.AppendText("\r\n" + "  Validation error: " + args.Message);
        }

        private void btnXslt_Click(object sender, EventArgs e)
        {
            string src = "ADRESBOEK1.XML";
            string stylesheet = "ADRESBOEK.XSL";
            string dest = "ADRESBOEK.HTML";
            XslTransform transform = new XslTransform();
            transform.Load(stylesheet);
            transform.Transform(src, dest);

            string str = readFromFile(dest);
            this.txtOutput.Text = str;
            this.wbOutput.Navigate(Application.StartupPath + "\\" + dest);
        }
        

        private void btnClear_Click(object sender, EventArgs e)
        {
            this.txtOutput.Text = "";
            this.wbOutput.Navigate("about:blank"); 
        }

        private string readFromFile(string filename)
        {
            StreamReader SR;
            string S, str;
            str = "";
            SR = new StreamReader(filename);
            //SR = File.OpenText(filename);
            S = SR.ReadLine();
            while (S != null)
            {
                str += S;
                S = SR.ReadLine();
            }
            SR.Close();
            return (str);
        }


    }
}