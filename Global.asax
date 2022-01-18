<%@ Application Language="C#" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Globalization" %>
<%@ Import Namespace="System.Linq" %>
<%@ Import Namespace="System.Web" %>
<%@ Import Namespace="System.Web.UI.WebControls" %>
<%@ Import Namespace="System.Net" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Xml" %>
<%@ Import Namespace="System.Collections.Specialized" %>
<%@ Import Namespace="System.Web.Routing" %>
<script RunAt="server">
    vtislemler vtislemler = new vtislemler();
   
    protected void Application_PreSendRequestHeaders()
    {
        if (HttpContext.Current != null)
        {
            HttpContext.Current.Response.Headers.Remove("Server");
        }
    }
    void Application_Start(object sender, EventArgs e)
    {
        
    }
    void Session_Start(object sender, EventArgs e)
    {
        Session.Timeout = 60;


    }
    void Session_End(object sender, EventArgs e)
    {
    }
    void Application_End(object sender, EventArgs e)
    {
    }
    protected void Application_BeginRequest(object sender, EventArgs e)
    {
    }

</script>

