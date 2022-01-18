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

public partial class aracduzenle : System.Web.UI.Page
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
                        DataTable dt = vtislemler.DataTableGetir("Select AracID as [No],Marka,Model,Yil as [Yıl], Fiyat from Araclar order by Marka,Model,Yil");
                        string strdataaraclar = "<table class=\"table table-bordered table-responsive\"><thead><tr><th class=\"color-white bg-black\">MARKA</th><th class=\"color-white bg-black\">MODEL</th><th class=\"color-white bg-black\">YIL</th><th class=\"color-white bg-black\">FİYAT</th><th class=\"color-white bg-black\">GÜNCELLE</th></tr></thead><tbody>";
                        for (int i = 0; i < dt.Rows.Count; i++)
                        {
                            strdataaraclar += "<tr><td>" + dt.Rows[i]["Marka"].ToString() + "</td><td>" + dt.Rows[i]["Model"].ToString() + "</td><td>" + dt.Rows[i]["Yıl"].ToString() + "</td><td>" + dt.Rows[i]["Fiyat"].ToString() + "</td><td><a href=\"guncelle.aspx?AracID=" + dt.Rows[i]["No"].ToString() + "\" class=\"btn btn-primary\">GÜNCELLE</a></td></tr>";
                        }
                        strdataaraclar += "</tbody></table>";
                        araclistesi.InnerHtml = strdataaraclar;
                        



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
        Response.Redirect("aracsil.aspx");


    }
}