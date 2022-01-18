using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace Final_201818017
{
    public partial class CalisanEkle : System.Web.UI.Page
    {
        readonly SqlConnection sqlbaglanti = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void kaydet_Click(object sender, EventArgs e)
        {
            try
            {

                if (sqlbaglanti.State == ConnectionState.Closed)
                {
                    sqlbaglanti.Open();
                }

                string sqlkod = "INSERT INTO Calisan VALUES (@Ad, @Soyad, @TCno, @Cinsiyet, @DogumYil, @Bolum, @Unvan, @BasTarih, @BitTarih)";
                SqlCommand sqlcommand = new SqlCommand(sqlkod, sqlbaglanti);
                sqlcommand.Parameters.AddWithValue("@Ad", Ad.Text);
                sqlcommand.Parameters.AddWithValue("@Soyad", Soyad.Text);
                sqlcommand.Parameters.AddWithValue("@TCno", TCno.Text);
                sqlcommand.Parameters.AddWithValue("@Cinsiyet", cinsiyetrb.SelectedValue);
                sqlcommand.Parameters.AddWithValue("@DogumYil", DogumYil.Text);
                sqlcommand.Parameters.AddWithValue("@Bolum", bolum.SelectedValue);
                sqlcommand.Parameters.AddWithValue("@Unvan", unvan.SelectedValue);
                sqlcommand.Parameters.AddWithValue("@BasTarih", Convert.ToDateTime(BasTarih.Text));
                sqlcommand.Parameters.AddWithValue("@BitTarih", Convert.ToDateTime(BitTarih.Text));

                int a = sqlcommand.ExecuteNonQuery();
                if (a > 0)
                {
                    Response.Write("<script>alert('Başarılı! Eklendi')</script>");
                }
                else
                {
                    Response.Write("<script>alert('Başarısız ! Eklenemedi.')</script>");
                }
            }
            catch
            {
                Response.Write("<script>alert('Başarısız ! Eklenemedi.')</script>");
            }

        }

        protected void Link_Click(object sender, EventArgs e)
        {
            Response.Redirect("CalisanListe.aspx");
        }
    }
}