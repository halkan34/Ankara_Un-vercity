using System;
using System.Collections.Generic;
using System.DirectoryServices;
using System.Runtime.InteropServices;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Text.RegularExpressions;
using System.Configuration;
using System.Text;
using System.Security.Cryptography;

public partial class personel : System.Web.UI.Page
{
    vtislemler vtislemler = new vtislemler();
    string baglantistr = ConfigurationManager.ConnectionStrings["veritabanibaglantisi"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Sira_No"] == null)
        {
            Response.Redirect("index.aspx");
        }
        else
        {
            if (vtislemler.verigetir("select AuthLevel from Personel where PersonelID='" + Session["Sira_No"] + "'", "AuthLevel") == "10")
            {
                if (!IsPostBack)
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


                        kullaniciadisoyadi.InnerHtml = "Aktif Kullanıcı: <span style=\"color:#aaa;\"/>" + Session["Yonetici_Adi"].ToString().ToUpper() + "</span>";
                        adsoyad.InnerHtml = "<span style=\"font-size:20px !important;\">" + Session["Yonetici_Adi"].ToString().ToUpper() + "</span>";
                        
                        string verigirisyetkisi = vtislemler.verigetir("select IsEditor from Personel where PersonelID='" + Session["Sira_No"] + "'", "IsEditor");
                        if (vtislemler.verigetir("select AuthLevel from Personel where PersonelID='" + Session["Sira_No"] + "'", "AuthLevel") == "10")
                        {
                            yoneticipanelmenu.InnerHtml = vtislemler.yoneticipanelmenu(10, verigirisyetkisi, "EN");
                        }
                        else if (vtislemler.verigetir("select AuthLevel from Personel where PersonelID='" + Session["Sira_No"] + "'", "AuthLevel") == "9")
                        {
                            yoneticipanelmenu.InnerHtml = vtislemler.yoneticipanelmenu(9, verigirisyetkisi, "EN");
                        }
                        else if (vtislemler.verigetir("select AuthLevel from Personel where PersonelID='" + Session["Sira_No"] + "'", "AuthLevel") == "8")
                        {
                            yoneticipanelmenu.InnerHtml = vtislemler.yoneticipanelmenu(8, verigirisyetkisi, "EN");
                        }
                        else if (vtislemler.verigetir("select AuthLevel from Personel where PersonelID='" + Session["Sira_No"] + "'", "AuthLevel") == "5")
                        {
                            yoneticipanelmenu.InnerHtml = vtislemler.yoneticipanelmenu(5, verigirisyetkisi, "EN");
                        }
                        else
                        {
                            yoneticipanelmenu.InnerHtml = vtislemler.yoneticipanelmenu(0, verigirisyetkisi, "EN");
                        }
                        DataTable dt = vtislemler.DataTableGetir("Select PersonelID as [No],NTUsername as [NT Username],AdSoyad as [Ad-Soyad],EPosta as [E-Posta], UserName as [Kullanıcı Adı], AuthLevel as [Yetki Seviyesi] from Personel where IsDeleted='0'  order by AdSoyad");

                        GridView1.Visible = true;
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                        GridView1.Columns[0].Visible = false;
                        if (dt.Rows.Count > 0)
                        {
                            for (int i = 0; i < GridView1.Rows.Count; i++)
                            {


                                Label lblgvYetkiSeviyesi = (Label)GridView1.Rows[i].FindControl("lblgvYetkiSeviyesi");
                                if (lblgvYetkiSeviyesi.Text == "0")
                                {
                                    lblgvYetkiSeviyesi.Text = "User";
                                }
                                else
                                {
                                    lblgvYetkiSeviyesi.Text = "Admin";
                                }


                                Button btnsil = (Button)GridView1.Rows[i].FindControl("btnsil");
                                if (lblgvYetkiSeviyesi.Text != "User")
                                {
                                    btnsil.Enabled = true;
                                }

                            }
                        }
                    }
                    else
                    {
                        Response.Redirect("/yetkisizgiris.aspx");
                    }







                }

            }
            else
            {
                Response.Redirect("/yetkisizgiris.aspx");
            }
        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Session.Abandon();//oluşturulmuş session nesneleri sonlandırılır.
        Response.Redirect("index.aspx");
    }

    protected void btnguncelle1_Click(object sender, EventArgs e)
    {
        Button btnSec = (Button)sender;
        GridViewRow row = btnSec.NamingContainer as GridViewRow;
        string secilenlokasyonid = GridView1.DataKeys[row.RowIndex].Value.ToString();

        int rowindex = row.RowIndex;

        Label lblgvNTUsername = (Label)GridView1.Rows[rowindex].FindControl("lblgvNTUsername");
        TextBox tbgvNTUsername = (TextBox)GridView1.Rows[rowindex].FindControl("tbgvNTUsername");

        Label lblgvadsoyad = (Label)GridView1.Rows[rowindex].FindControl("lblgvadsoyad");
        TextBox tbgvadsoyad = (TextBox)GridView1.Rows[rowindex].FindControl("tbgvadsoyad");

        Label lblgveposta = (Label)GridView1.Rows[rowindex].FindControl("lblgveposta");
        TextBox tbgveposta = (TextBox)GridView1.Rows[rowindex].FindControl("tbgveposta");



        Label lblgvYetkiSeviyesi = (Label)GridView1.Rows[rowindex].FindControl("lblgvYetkiSeviyesi");
        DropDownList ddlgvYetkiSeviyesi = (DropDownList)GridView1.Rows[rowindex].FindControl("ddlgvYetkiSeviyesi");



        Label lblgvkullaniciadi = (Label)GridView1.Rows[rowindex].FindControl("lblgvkullaniciadi");
        TextBox tbgvkullaniciadi = (TextBox)GridView1.Rows[rowindex].FindControl("tbgvkullaniciadi");

        Label lblgvpassword = (Label)GridView1.Rows[rowindex].FindControl("lblgvpassword");
        TextBox tbgvpassword = (TextBox)GridView1.Rows[rowindex].FindControl("tbgvpassword");
        LinkButton btngvgenaratepass = (LinkButton)GridView1.Rows[rowindex].FindControl("btngvgenaratepass");

        Button btnguncelle1 = (Button)GridView1.Rows[rowindex].FindControl("btnguncelle1");
        Button btnguncelle2 = (Button)GridView1.Rows[rowindex].FindControl("btnguncelle2");
        Button btnsil = (Button)GridView1.Rows[rowindex].FindControl("btnsil");

        foreach (GridViewRow satirlar in GridView1.Rows)
        {
            Button btnguncelle11 = (Button)satirlar.FindControl("btnguncelle1");
            Button btnguncelle21 = (Button)satirlar.FindControl("btnguncelle2");
            Button btnsil1 = (Button)satirlar.FindControl("btnsil");
            btnguncelle11.Enabled = false;
            btnguncelle21.Enabled = false;
            btnsil1.Enabled = false;
        }
        btnguncelle2.Visible = true;
        btnguncelle1.Visible = false;
        btnguncelle2.Enabled = true;
        lblgvadsoyad.Visible = false;
        lblgveposta.Visible = false;

        lblgvNTUsername.Visible = false;

        lblgvkullaniciadi.Visible = false;
        lblgvYetkiSeviyesi.Visible = false;

        lblgvpassword.Visible = false;

        tbgvNTUsername.Visible = true;
        tbgvadsoyad.Visible = true;
        tbgveposta.Visible = true;

        tbgvkullaniciadi.Visible = true;
        ddlgvYetkiSeviyesi.Visible = true;

        tbgvpassword.Visible = true;
        tbgvpassword.Enabled = false;
        btngvgenaratepass.Visible = true;

    }

    protected void btnguncelle2_Click(object sender, EventArgs e)
    {


        Button btnSec = (Button)sender;
        GridViewRow row = btnSec.NamingContainer as GridViewRow;
        string secilenlokasyonid = GridView1.DataKeys[row.RowIndex].Value.ToString();
        int rowindex = row.RowIndex;
        Label lblgvno = (Label)GridView1.Rows[rowindex].FindControl("lblgvno");

        TextBox tbgvNTUsername = (TextBox)GridView1.Rows[rowindex].FindControl("tbgvNTUsername");

        TextBox tbgvadsoyad = (TextBox)GridView1.Rows[rowindex].FindControl("tbgvadsoyad");

        TextBox tbgveposta = (TextBox)GridView1.Rows[rowindex].FindControl("tbgveposta");



        DropDownList ddlgvYetkiSeviyesi = (DropDownList)GridView1.Rows[rowindex].FindControl("ddlgvYetkiSeviyesi");

        TextBox tbgvkullaniciadi = (TextBox)GridView1.Rows[rowindex].FindControl("tbgvkullaniciadi");

        TextBox tbgvpassword = (TextBox)GridView1.Rows[rowindex].FindControl("tbgvpassword");


        int bostexvarmi = 0;
        if (string.IsNullOrEmpty(tbgvadsoyad.Text))
        {
            tbgvadsoyad.Style.Add("border", "2px solid #F00");
            bostexvarmi = 1;
        }
        else
        {
            tbgvadsoyad.Style.Add("border", "1px solid #ccc");
        }

        if (string.IsNullOrEmpty(tbgvNTUsername.Text))
        {
            tbgvNTUsername.Style.Add("border", "2px solid #F00");
            bostexvarmi = 1;
        }
        else
        {
            tbgvNTUsername.Style.Add("border", "1px solid #ccc");
        }

        if (string.IsNullOrEmpty(tbgveposta.Text))
        {
            tbgveposta.Style.Add("border", "2px solid #F00");
            bostexvarmi = 1;
        }
        else
        {
            tbgveposta.Style.Add("border", "1px solid #ccc");
        }


        if (string.IsNullOrEmpty(tbgvkullaniciadi.Text))
        {
            tbgvkullaniciadi.Style.Add("border", "2px solid #F00");
            bostexvarmi = 1;
        }
        else
        {
            tbgvkullaniciadi.Style.Add("border", "1px solid #ccc");
        }

        if (string.IsNullOrEmpty(tbgvpassword.Text))
        {
            tbgvpassword.Style.Add("border", "2px solid #F00");
            bostexvarmi = 1;
        }
        else
        {
            tbgvpassword.Style.Add("border", "1px solid #ccc");
        }








        if (string.IsNullOrEmpty(ddlgvYetkiSeviyesi.SelectedItem.Text) || ddlgvYetkiSeviyesi.SelectedIndex < 0 || ddlgvYetkiSeviyesi.SelectedItem.Text == "Seçiniz...")
        {
            ddlgvYetkiSeviyesi.Style.Add("border", "2px solid #F00");
            bostexvarmi = 1;
        }
        else
        {
            ddlgvYetkiSeviyesi.Style.Add("border", "1px solid #ccc");
        }





        if (bostexvarmi == 0)
        {
            string adsoyad = tbgvadsoyad.Text;
            string eposta = tbgveposta.Text;
            string ntuser = tbgvNTUsername.Text;
            string yetkiseviyesi = "";
            if (ddlgvYetkiSeviyesi.SelectedItem.Text.ToString() == "Poweradmin")
            {
                yetkiseviyesi = "10";
            }
            else if (ddlgvYetkiSeviyesi.SelectedItem.Text.ToString() == "Admin")
            {
                yetkiseviyesi = "10";
            }
            else
            {
                yetkiseviyesi = "0";
            }

            string kullaniciadi = tbgvkullaniciadi.Text;
            string password = tbgvpassword.Text;

            ntuser = Regex.Replace(ntuser, "'", "&#39;");
            if (!string.IsNullOrEmpty(ntuser) && vtislemler.sql(ntuser) != -1)
            {
                tbgvNTUsername.Style.Add("border", "1px solid #ccc");
                List<string> bilgiler = GetAdElements(ntuser);
                if (bilgiler.Count >= 2)
                {
                    tbgvadsoyad.Text = bilgiler[0].ToString().ToUpper();
                    tbgvkullaniciadi.Text = bilgiler[0].ToString().ToUpper();
                    tbgveposta.Text = bilgiler[2].ToString();
                    tbgvNTUsername.Style.Add("border", "1px solid #ccc");
                    if (vtislemler.sql(adsoyad) != -1 && vtislemler.sql(kullaniciadi) != -1 && vtislemler.sql(ntuser) != -1)
                    {

                        if (Page.IsValid)
                        {

                            adsoyad = tbgvadsoyad.Text;
                            eposta = tbgveposta.Text;
                            kullaniciadi = tbgvkullaniciadi.Text;
                            //try
                            //{
                            string tarih = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
                            using (var con = new SqlConnection(baglantistr))
                            {
                                using (SqlCommand cmd = new SqlCommand("Set_Personel", con))
                                {
                                    cmd.CommandType = CommandType.StoredProcedure;
                                    cmd.Parameters.AddWithValue("@PersonelID", lblgvno.Text);

                                    cmd.Parameters.AddWithValue("@AdSoyad", adsoyad);
                                    cmd.Parameters.AddWithValue("@EPosta", eposta);

                                    cmd.Parameters.AddWithValue("@UserName", kullaniciadi);
                                    cmd.Parameters.AddWithValue("@Password", SHA256(password));
                                    cmd.Parameters.AddWithValue("@AuthLevel", yetkiseviyesi);
                                    cmd.Parameters.AddWithValue("@NTUsername", ntuser);
                                    cmd.Parameters.AddWithValue("@ModifiedOn", tarih);
                                    cmd.Parameters.AddWithValue("@ModifiedBy", Session["Yonetici_Adi"]);
                                    cmd.Parameters.AddWithValue("@CreatedOn", DBNull.Value);
                                    cmd.Parameters.AddWithValue("@CreatedBy", DBNull.Value);
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
                            //}
                            //catch
                            //{
                            //    ScriptManager.RegisterStartupScript(this, GetType(), "Pop", "mesajnok();", true);
                            //}



                        }
                        else
                        {

                        }
                    }
                }
                else
                {
                    tbgvNTUsername.Style.Add("border", "2px solid #F00");
                }
            }
            else
            {
                tbgvNTUsername.Style.Add("border", "2px solid #F00");
            }
        }


    }

    protected void btnsil_Click(object sender, EventArgs e)
    {
        Button btnSec = (Button)sender;
        GridViewRow row = btnSec.NamingContainer as GridViewRow;
        int rowindex = row.RowIndex;
        string secilenkayitid = GridView1.DataKeys[row.RowIndex].Value.ToString();
        try
        {
            using (var con = new SqlConnection(baglantistr))
            {
                using (SqlCommand cmd = new SqlCommand("Set_Personel", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@PersonelID", secilenkayitid);

                    cmd.Parameters.AddWithValue("@AdSoyad", DBNull.Value);
                    cmd.Parameters.AddWithValue("@EPosta", DBNull.Value);

                    cmd.Parameters.AddWithValue("@UserName", DBNull.Value);
                    cmd.Parameters.AddWithValue("@Password", DBNull.Value);
                    cmd.Parameters.AddWithValue("@AuthLevel", DBNull.Value);
                    cmd.Parameters.AddWithValue("@NTUsername", DBNull.Value);
                    cmd.Parameters.AddWithValue("@ModifiedOn", DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"));
                    cmd.Parameters.AddWithValue("@ModifiedBy", Session["Yonetici_Adi"]);
                    cmd.Parameters.AddWithValue("@CreatedOn", DBNull.Value);
                    cmd.Parameters.AddWithValue("@CreatedBy", DBNull.Value);
                    cmd.Parameters.AddWithValue("@Islem", "Silme");

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
                case "System.Web.UI.WebControls.DropDownList":
                    if (((DropDownList)xx).SelectedIndex < 0 || ((DropDownList)xx).SelectedItem.Text.Contains("Seçiniz..."))
                    {

                        ((DropDownList)xx).Style.Add("border", "2px solid #e74c3c;");
                        bostextvarmi = 1;


                    }
                    else
                    {
                        ((DropDownList)xx).Style.Add("border", "1px solid #cccccc;");
                    }

                    break;

                case "System.Web.UI.WebControls.RadioButtonList":
                    if (((RadioButtonList)xx).SelectedIndex < 0)
                    {
                        ((RadioButtonList)xx).Style.Add("border", "2px solid #e74c3c;");
                        bostextvarmi = 1;
                    }
                    else
                    {
                        ((RadioButtonList)xx).Style.Add("border", "1px solid #cccccc;");
                    }

                    break;

            }

        }
        if (bostextvarmi == 0)
        {


            string adsoyad = tbadsoyad.Text;
            string eposta = tbeposta.Text;
            string ntuser = tbntuser.Text;

            string yetkiseviyesi = "";
            if (rbtnlyetkiseviyesi.SelectedItem.Text.ToString() == "Poweradmin")
            {
                yetkiseviyesi = "10";
            }
            else if (rbtnlyetkiseviyesi.SelectedItem.Text.ToString() == "Admin")
            {
                yetkiseviyesi = "10";
            }
            else
            {
                yetkiseviyesi = "0";
            }

            string kullaniciadi = tbkullaniciadi.Text;
            string password = tbpassword.Text;
            if (vtislemler.sql(adsoyad) != -1 && vtislemler.sql(kullaniciadi) != -1 && vtislemler.sql(ntuser) != -1)
            {

                if (Page.IsValid)
                {
                    if (vtislemler.varmi("select top 1 PersonelID from Personel where NTUsername='" + ntuser + "'") == false)
                    {
                        cv.IsValid = true;




                        try
                        {
                            string tarih = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
                            using (var con = new SqlConnection(baglantistr))
                            {
                                using (SqlCommand cmd = new SqlCommand("Set_Personel", con))
                                {
                                    cmd.CommandType = CommandType.StoredProcedure;
                                    cmd.Parameters.AddWithValue("@PersonelID", DBNull.Value);
                                    cmd.Parameters.AddWithValue("@ModifiedOn", DBNull.Value);
                                    cmd.Parameters.AddWithValue("@ModifiedBy", DBNull.Value);

                                    cmd.Parameters.AddWithValue("@AdSoyad", adsoyad);
                                    cmd.Parameters.AddWithValue("@EPosta", eposta);

                                    cmd.Parameters.AddWithValue("@UserName", kullaniciadi);
                                    cmd.Parameters.AddWithValue("@Password", SHA256(password));
                                    cmd.Parameters.AddWithValue("@AuthLevel", yetkiseviyesi);
                                    cmd.Parameters.AddWithValue("@NTUsername", ntuser);
                                    cmd.Parameters.AddWithValue("@CreatedOn", tarih);
                                    cmd.Parameters.AddWithValue("@CreatedBy", Session["Yonetici_Adi"]);
                                    cmd.Parameters.AddWithValue("@Islem", "YeniKayıt");

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
                        cv.IsValid = false;
                    }


                }
                else
                {

                }
            }
        }
    }




    protected void Timer1_Tick(object sender, EventArgs e)
    {
        Response.Redirect("personel.html");
        Timer1.Enabled = false;

    }
    protected void btngetir_Click(object sender, EventArgs e)
    {
        tbntuser.Text = Regex.Replace(tbntuser.Text, "'", "&#39;");
        if (!string.IsNullOrEmpty(tbntuser.Text) && vtislemler.sql(tbntuser.Text) != -1)
        {
            tbntuser.Style.Add("border", "1px solid #ccc");
            List<string> bilgiler = GetAdElements(tbntuser.Text);
            if (bilgiler.Count >= 2)
            {
                tbadsoyad.Text = bilgiler[0].ToString().ToUpper();
                tbkullaniciadi.Text = bilgiler[0].ToString().ToUpper();
                tbeposta.Text = bilgiler[2].ToString();
                tbntuser.Style.Add("border", "1px solid #ccc");
            }
            else
            {
                tbntuser.Style.Add("border", "2px solid #F00");
            }
        }
        else
        {
            tbntuser.Style.Add("border", "2px solid #F00");
        }
    }
    public List<string> GetAdElements(string ntuser)
    {
        List<string> DataList = new List<string>();
        string message = @"";

        string test = ntuser.Substring(ntuser.LastIndexOf(@"\") + 1);

        using (DirectoryEntry de = new DirectoryEntry("LDAP://141.11.111.111"))
        {
            using (DirectorySearcher adSearch = new DirectorySearcher(de))
            {
                adSearch.PropertiesToLoad.Add("sn");  // surname = last name
                adSearch.PropertiesToLoad.Add("givenName");  // given (or first) name
                adSearch.PropertiesToLoad.Add("mail");  // e-mail addresse
                adSearch.PropertiesToLoad.Add("department"); // department name

                adSearch.Filter = "(sAMAccountName=" + test + ")";
                try
                {
                    System.DirectoryServices.SearchResult adSearchResult = adSearch.FindOne();
                    if (adSearchResult == null)
                    {
                        DataList.Add("The search is null!");
                    }
                    else
                    {
                        string getGivenname = @""; string getSurname = @""; string getMail = @""; string getDepartment = @"";

                        foreach (string propKey in adSearchResult.Properties.PropertyNames)
                        {
                            foreach (object property in adSearchResult.Properties[propKey])
                            {
                                // Uncomment to debug
                                // MessageBox.Show(propKey + ":" + property.ToString());

                                if (propKey == "givenname") { getGivenname = property.ToString(); }
                                if (propKey == "sn") { getSurname += property.ToString(); }
                                if (propKey == "mail") { getMail = property.ToString(); }
                                if (propKey == "department") { getDepartment = property.ToString(); }
                            }
                        }
                        message = getGivenname + " " + getSurname + "\n" + getMail + "\n" + getDepartment;

                        DataList.Add(getGivenname + " " + getSurname);
                        DataList.Add(getDepartment);
                        DataList.Add(getMail);

                    }
                }
                catch (COMException ex)
                {

                    DataList.Add(ex.Message.ToString());
                }


            }
        }

        return DataList;
        //return message;
    }
    public string Encrypt(string sifre, string hash)
    {
        byte[] data = UTF8Encoding.UTF8.GetBytes(sifre);
        using (MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider())
        {
            byte[] keys = md5.ComputeHash(UTF8Encoding.UTF8.GetBytes(hash));
            using (TripleDESCryptoServiceProvider tripDes = new TripleDESCryptoServiceProvider() { Key = keys, Mode = CipherMode.ECB, Padding = PaddingMode.PKCS7 })
            {
                ICryptoTransform transform = tripDes.CreateEncryptor();
                byte[] results = transform.TransformFinalBlock(data, 0, data.Length);
                return Convert.ToBase64String(results, 0, results.Length);
            }
        }
    }

    private string EncodeTo64(string toEncode)
    {
        byte[] toEncodeAsBytes
         = System.Text.ASCIIEncoding.ASCII.GetBytes(toEncode);
        string returnValue
              = System.Convert.ToBase64String(toEncodeAsBytes);
        return returnValue;
    }
    private static int Minimum_Length = 8;
    private static int Upper_Case_length = 1;
    private static int Lower_Case_length = 1;
    private static int NonAlpha_length = 1;
    private static int Numeric_length = 1;

    public static bool IsValid(string Password)
    {
        if (Password.Length < Minimum_Length)
            return false;
        if (UpperCaseCount(Password) < Upper_Case_length)
            return false;
        if (NumericCount(Password) < Numeric_length)
            return false;
        if (LowerCaseCount(Password) < Lower_Case_length)
            return false;
        if (NonAlphaCount(Password) < NonAlpha_length)
            return false;
        return true;
    }

    private static int UpperCaseCount(string Password)
    {
        return Regex.Matches(Password, "[A-Z]").Count;
    }
    private static int LowerCaseCount(string Password)
    {
        return Regex.Matches(Password, "[a-z]").Count;
    }
    private static int NumericCount(string Password)
    {
        return Regex.Matches(Password, "[0-9]").Count;
    }
    private static int NonAlphaCount(string Password)
    {
        return Regex.Matches(Password, @"[_]").Count;
    }
    public string GeneratePassword()
    {


        int length = Minimum_Length;

        bool nonAlphanumeric = true;
        bool digit = true;
        bool lowercase = true;
        bool uppercase = true;

        StringBuilder password = new StringBuilder();
        Random random = new Random();

        while (password.Length < length)
        {
            char c = (char)random.Next(35, 39);

            password.Append(c);

            if (char.IsDigit(c))
                digit = false;
            else if (char.IsLower(c))
                lowercase = false;
            else if (char.IsUpper(c))
                uppercase = false;
            else if (!char.IsLetterOrDigit(c))
                nonAlphanumeric = false;
        }

        if (nonAlphanumeric)
            password.Append((char)random.Next(35, 39));
        if (digit)
            password.Append((char)random.Next(48, 58));
        if (lowercase)
            password.Append((char)random.Next(97, 123));
        if (uppercase)
            password.Append((char)random.Next(65, 91));

        return password.ToString();
    }
    protected void btngenaratepass_Click(object sender, EventArgs e)
    {
        tbpassword.Text = CreatePassword(12, chars);
    }

    protected void btngvgenaratepass_Click(object sender, EventArgs e)
    {
        LinkButton btnSec = (LinkButton)sender;
        GridViewRow row = btnSec.NamingContainer as GridViewRow;
        string secilenlokasyonid = GridView1.DataKeys[row.RowIndex].Value.ToString();
        int rowindex = row.RowIndex;
        TextBox tbgvpassword = (TextBox)GridView1.Rows[rowindex].FindControl("tbgvpassword");
        tbgvpassword.Text = CreatePassword(12, chars);
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
    string chars = "ABCDEFGHIJKLMNOPRSTUVYZabcdefghijklmnoprstuvyzwxq1234567890_()[].+";

    private string CreatePassword(int length, string chars)
    {
        StringBuilder Password = new StringBuilder();
        Random Rnd = new Random();
        for (int i = 0; i < length; i++)
        {
            Password.Append(chars[Rnd.Next(0, chars.Length)]);
        }

        return Password.ToString();
    }




}