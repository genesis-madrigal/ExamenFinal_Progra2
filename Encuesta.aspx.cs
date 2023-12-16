using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ExamenFinal_Progra2
{
    public partial class Encuesta : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LlenarDropdownPartidos();
        }

        public void alertas(String texto)
        {
            string message = texto;
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append("<script type = 'text/javascript'>");
            sb.Append("window.onload=function(){");
            sb.Append("alert('");
            sb.Append(message);
            sb.Append("')};");
            sb.Append("</script>");
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());

        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            alertBox1.Attributes["class"] = "";
            alertBox2.Attributes["class"] = "";
            alertBox3.Attributes["class"] = "";

            alertBox1.InnerText = "";
            alertBox2.InnerText = "";
            alertBox3.InnerText = "";

            int error = 0;

            if (string.IsNullOrWhiteSpace(tbNombre.Text) || string.IsNullOrWhiteSpace(tbCorreo.Text) || string.IsNullOrWhiteSpace(tbEdad.Text))
            {
                
                alertBox1.InnerText = "Hay valores sin información";
                alertBox1.Attributes["class"] = "alert alert-danger";           

                error++;
            }
            if (!(tbCorreo.Text.Contains("@") && tbCorreo.Text.Contains(".")))
            {
                alertBox2.InnerText = "El correo no está en un formato válido";
                alertBox2.Attributes["class"] = "alert alert-danger";
                
                error++;
            }

           
            bool check = int.TryParse(tbEdad.Text, out int a);            

            if (check)
            {
                if (int.Parse(tbEdad.Text) < 18 || int.Parse(tbEdad.Text) > 50)
                {
                    alertBox3.InnerText = "La edad no es mayor de 18 y menor de 50";
                    alertBox3.Attributes["class"] = "alert alert-danger";
                    error++;
                }
            }
            else
            {                
                alertBox3.InnerText = "La edad no es un número";
                alertBox3.Attributes["class"] = "alert alert-danger";
                error++;
            }

            


            if (error < 1)
            {
                //Contra la base de datos
                int resultado = Classes.Encuesta.Agregar(tbNombre.Text, int.Parse(tbEdad.Text), tbCorreo.Text, ddlPartidoP.Text);

                
                //2627 codigo UNIQUE KEY
                
                if (resultado == 1)
                {                    
                    alertBox2.InnerText = "La encuesta ha sido enviada con éxito";
                    alertBox2.Attributes["class"] = "alert alert-success";

                    tbNombre.Text = string.Empty;
                    tbEdad.Text = string.Empty;
                    tbCorreo.Text = string.Empty;
                }
                else if (resultado == 2627)
                {                    
                    alertBox1.InnerText = "El correo ingresado ya existe";
                    alertBox1.Attributes["class"] = "alert alert-danger";

                }
                else
                {
                    alertBox1.InnerText = "Error al enviar encuesta";
                    alertBox1.Attributes["class"] = "alert alert-danger";
                }
            }           
            
            



        }

        protected void LlenarDropdownPartidos()
        {
            string constr = ConfigurationManager.ConnectionStrings["Conexion"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("Consulta_Partidos"))
                {

                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            ddlPartidoP.DataSource = dt;

                            ddlPartidoP.DataTextField = dt.Columns["Partido"].ToString();
                            ddlPartidoP.DataValueField = dt.Columns["SiglasPartido"].ToString();
                            ddlPartidoP.DataBind();
                        }
                    }
                }
            }
        }
    }
}