using System;
using System.Collections.Generic;
using System.DirectoryServices;
using System.Runtime.InteropServices;
using System.Web;
using System.Web.UI;
using System.Data;
using Microsoft.Security.Application;
using System.Text.RegularExpressions;
using System.Security.Cryptography;
using System.Text;

public partial class admin_index : System.Web.UI.Page
{
    vtislemler vtislemler = new vtislemler();

   
    protected void Page_Load(object sender, EventArgs e)
    {
       
       
        tbk_adi.Attributes.Add("onfocus", "giris(this)");
        tbk_adi.Attributes.Add("onblur", "cikis(this)");

        tbk_parola.Attributes.Add("onfocus", "giris1(this)");
        tbk_parola.Attributes.Add("onblur", "cikis1(this)");

        
    }

    protected void btngiris_Click(object sender, EventArgs e)
    {
        tbk_adi.Text = Regex.Replace(tbk_adi.Text, "'", "&#39;");
        tbk_parola.Text = Regex.Replace(tbk_parola.Text, "'", "&#39;");

       
       
        if (vtislemler.sql(tbk_adi.Text) == 0 && vtislemler.sql(tbk_parola.Text) == 0)
        {
            if (vtislemler.varmi("select * from Personel where Upper(AdSoyad)='" + tbk_adi.Text.ToString().ToUpper() + "'") == true)
            {

                DataTable dtkullanicibilgileri = vtislemler.DataTableGetir("select * from Personel where Upper(AdSoyad)='" + tbk_adi.Text.ToString().ToUpper() + "'");
                if (dtkullanicibilgileri.Rows[0]["Password"].ToString() == SHA256(tbk_parola.Text))
                
                {
                    Session["Yonetici_Adi"] = dtkullanicibilgileri.Rows[0]["AdSoyad"].ToString();
                    Session["Sira_No"] = dtkullanicibilgileri.Rows[0]["PersonelID"].ToString();
                    hataligiris.Visible = false;
                    lblhatavar.Visible = false;
                    if (Timer1.Enabled == false)
                    {
                        Timer1.Enabled = true;
                    }
                    else
                    {
                        Timer1.Enabled = false;
                    }
                }
                else
                {

                    ScriptManager.RegisterStartupScript(this, GetType(), "Pop", "mesaj();", true);
                    lblhatayok.Visible = false;
                    hataligiris.Visible = true;

                    lblhatavar.Visible = true;
                    dogrugiris.Visible = false;

                }
            }
            else
            {

                ScriptManager.RegisterStartupScript(this, GetType(), "Pop", "mesaj();", true);
                lblhatayok.Visible = false;
                hataligiris.Visible = true;

                lblhatavar.Visible = true;
                dogrugiris.Visible = false;

            }
        }
        else
        {
            Response.Redirect("yetkisizgiris.aspx");
        }
    }



    protected void Timer1_Tick(object sender, EventArgs e)
    {
        tbk_adi.Text = "Kullanıcı Adı...";
        tbk_parola.Text = "Parola...";
        ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "MyFun1", "mesaj1();", true);
        hataligiris.Visible = false;
        dogrugiris.Visible = false;
        lblhatavar.Visible = false;
        lblhatayok.Visible = false;
        Timer1.Enabled = false;
        Timer2.Enabled = true;

    }
    protected void Timer2_Tick(object sender, EventArgs e)
    {
       
        Response.Redirect("arackayit.aspx", true);
        Timer2.Enabled = false;

    }
    static public string DecodeFrom64(string encodedData)
    {
        byte[] encodedDataAsBytes
            = System.Convert.FromBase64String(encodedData);
        string returnValue =
           System.Text.ASCIIEncoding.ASCII.GetString(encodedDataAsBytes);
        return returnValue;
    }

    public string SHA256(string strGiris)
    {
        if (strGiris == "" || strGiris == null)
        {
            throw new ArgumentNullException("Şifrelenecek Veri Yok");
        }
        else
        {
            SHA256Managed sifre = new SHA256Managed();
            byte[] arySifre = ByteDonustur(strGiris);
            byte[] aryHash = sifre.ComputeHash(arySifre);
            return BitConverter.ToString(aryHash);
        }
    }
    public static byte[] ByteDonustur(string deger)
    {

        UnicodeEncoding ByteConverter = new UnicodeEncoding();
        return ByteConverter.GetBytes(deger);

    }
}