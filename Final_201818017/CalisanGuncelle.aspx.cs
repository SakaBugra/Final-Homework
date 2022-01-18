using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Final_201818017
{
    public partial class CalisanGuncelle : System.Web.UI.Page
    {
        readonly SqlConnection sqlbaglanti = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {

            
            string id = Request.QueryString["Id"];
            try
            {

                if (sqlbaglanti.State == ConnectionState.Closed)
                {
                    sqlbaglanti.Open();
                }

                string sqlkod = "SELECT * FROM Calisan INNER JOIN Bolum ON(Calisan.BolumID= Bolum.Id) INNER JOIN Unvan ON(Calisan.UnvanID= Unvan.Id) WHERE Calisan.Id = @id";
                SqlCommand sqlcommand = new SqlCommand(sqlkod, sqlbaglanti);
                sqlcommand.Parameters.AddWithValue("@id", id);
                using (SqlDataReader rdr = sqlcommand.ExecuteReader())
                {
                    while (rdr.Read())
                    {
                        var colId = rdr[0].ToString();
                        var Adi = rdr[1].ToString();
                        var Soyadi = rdr[2].ToString();
                        var TCno = rdr[3].ToString();
                        var Cinsiyet = rdr[4].ToString();
                        var DogumYill = rdr[5].ToString();
                        var BasTarihh = rdr[8].ToString();
                        var BitTarihh = rdr[9].ToString();
                        int Bolumm = (Convert.ToInt32(rdr[6]))-1;
                        int Unvan = (Convert.ToInt32(rdr[7]))-1;

                        Ad.Text = Adi;
                        Soyad.Text = Soyadi;
                        TCKN.Text = TCno;
                        cinsiyetrb.SelectedValue = Cinsiyet;
                        DogumYil.Text = DogumYill;
                        BasTarih.Text = Convert.ToDateTime(BasTarihh).ToString("yyyy-MM-dd");
                        BitTarih.Text = Convert.ToDateTime(BitTarihh).ToString("yyyy-MM-dd");
                        bolum.SelectedIndex = Bolumm;
                        unvan.SelectedIndex = Unvan;
                    }
                }
            }
            catch
            {
                Response.Write("<script>Lütfen Id parametresini giriniz.</script>");
            }

            }
        }

        protected void kayitguncelle_Click(object sender, EventArgs e)
        {
            string id = Request.QueryString["Id"];
            if (sqlbaglanti.State == ConnectionState.Closed)
            {
                sqlbaglanti.Open();
            }

            string sqlkod2 = "UPDATE Calisan SET Adi=@Ad, Soyadi=@Soyad, TCKimlikNo=@TCno, Cinsiyet=@Cinsiyet, DogumYili=@DogumYil, BolumID=@Bolum, UnvanID=@Unvan, BasTarih=@BasTarih, BitTarih=@BitTarih WHERE Id=@id";
            SqlCommand sqlcommand1 = new SqlCommand(sqlkod2, sqlbaglanti);
            sqlcommand1.Parameters.AddWithValue("@Ad", Ad.Text);
            sqlcommand1.Parameters.AddWithValue("@Soyad", Soyad.Text);
            sqlcommand1.Parameters.AddWithValue("@TCno", TCKN.Text);
            sqlcommand1.Parameters.AddWithValue("@Cinsiyet", cinsiyetrb.SelectedValue);
            sqlcommand1.Parameters.AddWithValue("@DogumYil", DogumYil.Text);
            sqlcommand1.Parameters.AddWithValue("@Bolum", bolum.SelectedValue);
            sqlcommand1.Parameters.AddWithValue("@Unvan", unvan.SelectedValue);
            sqlcommand1.Parameters.AddWithValue("@BasTarih", Convert.ToDateTime(BasTarih.Text));
            sqlcommand1.Parameters.AddWithValue("@BitTarih", Convert.ToDateTime(BitTarih.Text));
            sqlcommand1.Parameters.AddWithValue("@id", id);

            sqlcommand1.ExecuteNonQuery();
            Response.Write("<script>alert('Güncellendi')</script>");
        }

        protected void kayitsil_Click(object sender, EventArgs e)
        {
            string id = Request.QueryString["Id"];
            if (sqlbaglanti.State == ConnectionState.Closed)
            {
                sqlbaglanti.Open();
            }

            string sqlkod3 = "DELETE Calisan WHERE Id=@id";
            SqlCommand sqlcommand2 = new SqlCommand(sqlkod3, sqlbaglanti);
            sqlcommand2.Parameters.AddWithValue("@id", id);

            sqlcommand2.ExecuteNonQuery();
            Response.Write("<script>alert('Kayıt Silindi')</script>");
        }
    }
}