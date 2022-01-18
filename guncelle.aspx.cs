using System;
using System.Web.UI;
using System.Diagnostics;
using System.IO;

using System.Web;
using System.Collections.Generic;
using System.Web.UI.WebControls;
using System.Data;

using System.DirectoryServices;
using System.Collections;
using System.Data.SqlClient;
using System.Text.RegularExpressions;
using System.Configuration;

public partial class guncelle : System.Web.UI.Page
{
    vtislemler vtislemler = new vtislemler();
    string baglantistr = ConfigurationManager.ConnectionStrings["veritabanibaglantisi"].ToString();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (Session["Sira_No"] == null)
            {

                Response.Redirect("index.aspx");
            }
            else
            {
                try
                {
                    Guid gelen = Guid.Parse(Session["Sira_No"].ToString());
                }
                catch
                {
                    Response.Redirect("/yetkisizgiris.aspx");
                }
                if (vtislemler.sql(Convert.ToString(Session["Sira_No"].ToString())) != -1 && vtislemler.sql(Convert.ToString(Session["Yonetici_Adi"].ToString())) != -1)
                {
                    string kullaniciadi = Regex.Replace(Session["Yonetici_Adi"].ToString(), "'", "&#39;");
                    DataTable dtyonetici = vtislemler.DataTableGetir("select * from Personel where PersonelID='" + Session["Sira_No"] + "'");
                    if (dtyonetici.Rows.Count > 0)
                    {
                        kullaniciadisoyadi.InnerHtml = "Aktif Kullanıcı: <span style=\"color:#aaa;\"/>" + kullaniciadi.ToUpper() + "</span>";
                        adsoyad.InnerHtml = "<span style=\"font-size:20px !important;\">" + kullaniciadi.ToUpper() + "</span>";

                        yoneticipanelmenu.InnerHtml = vtislemler.yoneticipanelmenu(0, "0", "EN");


                        if (Request.QueryString.Get("AracID") != null)
                        {
                            Guid AracID = Guid.Parse(Request.QueryString.Get("AracID").ToString());
                            if (vtislemler.varmi("select top 1 AracID from Araclar where AracID='" + AracID + "'") == true)
                            {
                                DataTable dt = vtislemler.DataTableGetir("select * from Araclar where AracID='" + AracID + "'");
                                tbmarka.Text = dt.Rows[0]["Marka"].ToString();
                                tbmodel.Text = dt.Rows[0]["Model"].ToString();
                                tbyil.Text = dt.Rows[0]["Yil"].ToString();
                                tbfiyat.Text = dt.Rows[0]["Fiyat"].ToString();
                            }
                            else
                            {
                                Response.Redirect("/yetkisizgiris.aspx");
                            }

                        }
                        else
                        {
                            Response.Redirect("/yetkisizgiris.aspx");
                        }

                    }
                    else
                    {
                        Response.Redirect("/yetkisizgiris.aspx");
                    }
                }
                else
                {
                    Response.Redirect("/yetkisizgiris.aspx");
                }

            }



        }
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("index.aspx");
    }

    protected void Timer1_Tick(object sender, EventArgs e)
    {
        Timer1.Enabled = false;
        Response.Redirect("aracduzenle.aspx");


    }

    protected void btnkaydet_Click(object sender, EventArgs e)
    {

        int bostextvarmi = 0;
        foreach (Control xx in pnl.Controls)
        {
            switch (xx.ToString())
            {
                case "System.Web.UI.WebControls.TextBox":
                    if (((TextBox)xx).Text == string.Empty)
                    {

                        ((TextBox)xx).Style.Add("border", "2px solid #e74c3c;");
                        bostextvarmi = 1;

                    }
                    else
                    {
                        ((TextBox)xx).Style.Add("border", "1px solid #cccccc;");
                    }

                    break;




            }

        }
        if (bostextvarmi == 0)
        {


            string marka = tbmarka.Text;
            string model = tbmodel.Text;
            int yil = Convert.ToInt32(tbyil.Text);
            int fiyat = Convert.ToInt32(tbfiyat.Text);
            if (Page.IsValid)
            {
                try
                {

                    using (var con = new SqlConnection(baglantistr))
                    {
                        using (SqlCommand cmd = new SqlCommand("Set_Araclar", con))
                        {
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.AddWithValue("@AracID", Request.QueryString.Get("AracID").ToString());
                            cmd.Parameters.AddWithValue("@Marka", marka);
                            cmd.Parameters.AddWithValue("@Model", model);
                            cmd.Parameters.AddWithValue("@Yil", yil);
                            cmd.Parameters.AddWithValue("@Fiyat", fiyat);
                            cmd.Parameters.AddWithValue("@Islem", "Güncelleme");
                            con.Open();
                            cmd.ExecuteNonQuery();
                        }
                    }

                    ScriptManager.RegisterStartupScript(this, GetType(), "Pop", "mesajok();", true);


                    if (Timer1.Enabled == false)
                    {
                        Timer1.Enabled = true;
                    }
                    else
                    {
                        Timer1.Enabled = false;
                    }
                }
                catch
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "Pop", "mesajnok();", true);
                }



            }
            else
            {

            }

        }
    }
}