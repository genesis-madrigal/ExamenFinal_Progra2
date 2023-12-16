using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;

namespace ExamenFinal_Progra2.Classes
{
    public class Encuesta
    {
        public int NumeroEncuesta { get; set; }

        public string Nombre { get; set; }

        public int Edad { get; set; }

        public string CorreoElectronico { get; set; }

        public string PartidoP { get; set; }

        public Encuesta()
        {
            Nombre = string.Empty;
            Edad = 0;
            CorreoElectronico = string.Empty;
            PartidoP = string.Empty;
        }

        public Encuesta(int ID, string nombre, int edad, string correoelectronico, string partidop)
        {
            NumeroEncuesta = ID;
            Nombre = nombre;
            Edad = edad;
            CorreoElectronico = correoelectronico;
            PartidoP = partidop;
        }


        public static int Agregar(string Nombre, int Edad, string CorreoElectronico, string PartidoP)
        {
            int retorno = 0;
            

            SqlConnection Conn = new SqlConnection();
            try
            {
                using (Conn = DBConn.obtenerConexion())
                {
                    SqlCommand cmd = new SqlCommand("INSERTAR_ENCUESTA", Conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.Add(new SqlParameter("@NOMBRE", Nombre));
                    cmd.Parameters.Add(new SqlParameter("@EDAD", Edad));
                    cmd.Parameters.Add(new SqlParameter("@CORREOELECTRONICO", CorreoElectronico));
                    cmd.Parameters.Add(new SqlParameter("@PARTIDOP", PartidoP));


                    retorno = cmd.ExecuteNonQuery();
                }
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                retorno = ex.Number;
            }
            finally
            {
                Conn.Close();
            }

            return retorno;
        }
    }
}