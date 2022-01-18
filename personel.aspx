<%@ Page Language="C#" AutoEventWireup="true" CodeFile="personel.aspx.cs" Inherits="personel" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="copyright" content="Sedat BIYIK" />
    <meta name="author" content="" />
    <link rel="shortcut icon" href="favicon.ico" />
    <title>Araç Takip Sistemi - Araç Takip Sistemi</title>
    <!-- ========== COMMON STYLES ========== -->
    <link rel="stylesheet" href="css/bootstrap.min.css" media="screen">
    <link rel="stylesheet" href="css/font-awesome.min.css" media="screen" />
    <link rel="stylesheet" href="css/animate-css/animate.min.css" media="screen" />
    <link rel="stylesheet" href="css/lobipanel/lobipanel.min.css" media="screen" />

    <!-- ========== PAGE STYLES ========== -->

    <link rel="stylesheet" href="css/iziModal/iziModal.min.css" media="screen" />
    <link rel="stylesheet" href="css/sweet-alert/sweetalert.css" media="screen" />

    <!-- ========== THEME CSS ========== -->
    <link rel="stylesheet" href="css/main.css" media="screen" />
    <script type="text/javascript">




        function mesajok() {
            $('#modalok').iziModal();
            $('#modalok').iziModal('open', this);
        };
        function mesajnok() {
            $('#modalnok').iziModal();
            $('#modalnok').iziModal('open', this);
        };
    </script>
      <style>
        #GridView1 tbody tr th {
            color: white !important;
            background-color: #000 !important;
        }
    </style>
</head>

<body class="top-navbar-fixed">
    <form runat="server" id="form" enctype="multipart/form-data">
        <div class="main-wrapper">

            <!-- ========== TOP NAVBAR ========== -->
            <nav class="navbar top-navbar bg-black-300 box-shadow">
                <div class="container-fluid">
                    <div class="row">
                        <div class="navbar-header no-padding">
                            <a class="navbar-brand" href="kokpit.html" style="margin: 0px !important;">
                                <img src="images/logorapor.png" alt="Araç Takip Sistemi" class="logo" />
                            </a>
                             <span class="small-nav-handle hidden-sm hidden-xs"><i class="fa fa-outdent"></i></span>
                            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse-1" aria-expanded="false">
                                <span class="sr-only">Toggle navigation</span>
                                <i class="fa fa-ellipsis-v"></i>
                            </button>
                            <button type="button" class="navbar-toggle mobile-nav-toggle">
                                <i class="fa fa-bars"></i>
                            </button>
                        </div>
                        <!-- /.navbar-header -->

                        <div class="collapse navbar-collapse" id="navbar-collapse-1">
                            <ul class="nav navbar-nav" data-dropdown-in="fadeIn" data-dropdown-out="fadeOut">
                                <li class="hidden-sm hidden-xs"><a href="#" class="user-info-handle"><i class="fa fa-user"></i></a></li>
                                <li class="hidden-sm hidden-xs"><a href="#" class="full-screen-handle"><i class="fa fa-arrows-alt"></i></a></li>


                            </ul>
                            <!-- /.nav navbar-nav -->

                            <ul class="nav navbar-nav navbar-right" data-dropdown-in="fadeIn" data-dropdown-out="fadeOut">


                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" id="adsoyad" runat="server"><span class="caret"></span></a>
                                    <ul class="dropdown-menu profile-dropdown">



                                        <li>
                                            <asp:LinkButton ID="LinkButton1" runat="server" CssClass="color-danger text-center" OnClick="LinkButton1_Click"><i class="fa fa-sign-out"></i>Güvenli Çıkış</asp:LinkButton>

                                        </li>
                                    </ul>
                                </li>
                                <!-- /.dropdown -->

                            </ul>
                            <!-- /.nav navbar-nav navbar-right -->
                        </div>
                        <!-- /.navbar-collapse -->
                    </div>
                    <!-- /.row -->
                </div>
                <!-- /.container-fluid -->
            </nav>


            <!-- ========== WRAPPER FOR BOTH SIDEBARS & MAIN CONTENT ========== -->
            <div class="content-wrapper">
                <div class="content-container">

                    <!-- ========== LEFT SIDEBAR ========== -->
                    <div class="left-sidebar fixed-sidebar bg-black-300 box-shadow">
                        <div class="sidebar-content">
                            <div class="user-info closed">
                                <img src="images/logotek.png" alt="Araç Takip Sistemi" class="img-circle profile-img" />
                                <h5 class="title">Araç Takip Sistemi - Araç Takip Sistemi</h5>
                                <small class="info" id="kullaniciadisoyadi" runat="server"></small>
                            </div>
                            <!-- /.user-info -->

                            <div class="sidebar-nav">
                                <ul class="side-nav color-white" id="yoneticipanelmenu" runat="server"></ul>
                                <ul class="side-nav color-white" style="margin-top:-25px !important;">
                                    <li><asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton1_Click" style="padding-left:15px !important; font-size:14px !important;"><i class="fa fa-sign-out"></i>Güvenli Çıkış</asp:LinkButton></li>
                                </ul>
                                <!-- /.side-nav -->

                            </div>
                            <!-- /.sidebar-nav -->
                        </div>
                        <!-- /.sidebar-content -->
                    </div>
                    <!-- /.left-sidebar -->

                    <div class="main-page">
                        

                        <section class="section">
                            <div class="container-fluid">

                                <div class="row">






                                    <div class="col-md-12">
                                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                                        <div class="panel">

                                            <div class="panel-body p-20">
                                                <div class="panel-title">
                                                    <h5 class="underline">Kullanıcı Tanımlama Ekranı</h5>
                                                </div>
                                                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                                    <ContentTemplate>
                                                        <asp:Panel ID="pnl" runat="server">
                                                            <div class="form-horizontal" style="margin-top: 15px;">

                                                                <div class="form-group">
                                                                    <label for="inputEmail2" class="col-sm-4 text-center">NT User:</label>
                                                                    <label for="inputEmail2" class="col-sm-4 text-center">Ad-Soyad:</label>
                                                                    <label for="inputEmail3" class="col-sm-4 text-center">E-Posta Adresi:</label>
                                                                    
                                                                </div>
                                                                <div class="form-group">
                                                                    <div class="col-sm-4" style="display: inline !important;">
                                                                        <asp:TextBox ID="tbntuser" runat="server" CssClass="form-control" ValidationGroup="ekle" Width="80%" Style="display: inline-block !important; padding-top: 10px;"></asp:TextBox>
                                                                        <asp:Button ID="btngetir" runat="server" BorderStyle="None" CssClass="btn btn-default tickbtn" Width="35px" Height="35px" Style="display: inline-block !important; padding-top: 10px; float: right;" OnClick="btngetir_Click" />
                                                                    </div>
                                                                    <div class="col-sm-4">
                                                                        <asp:TextBox ID="tbadsoyad" runat="server" CssClass="form-control" ValidationGroup="ekle"></asp:TextBox>
                                                                    </div>
                                                                    <div class="col-sm-4">
                                                                        <asp:TextBox ID="tbeposta" runat="server" CssClass="form-control" ValidationGroup="ekle"></asp:TextBox>
                                                                    </div>
                                                                   
                                                                </div>

                                                                <div class="form-group">
                                                                                                                                    
                                                                    <label for="inputEmail3" class="col-sm-4 text-center">Yetki Seviyesi:</label>
                                                                     <label for="inputEmail3" class="col-sm-4 text-center">Kullanıcı Adı:</label>
                                                                    <label for="inputEmail3" class="col-sm-4 text-center">Parola:</label>
                                                                </div>
                                                                <div class="form-group">

                                                                     
                                                                    <div class="col-sm-4">

                                                                        <asp:RadioButtonList ID="rbtnlyetkiseviyesi" runat="server" RepeatDirection="Horizontal" Font-Size="Small" Font-Bold="false" CssClass="form-control rbtnl" CellPadding="0" CellSpacing="0" RepeatLayout="Table" BorderStyle="None" TextAlign="Right" Style="margin-bottom: 0px !important; height: 60px">

                                                                            <asp:ListItem>Admin</asp:ListItem>
                                                                            <asp:ListItem>User</asp:ListItem>
                                                                        </asp:RadioButtonList>
                                                                    </div>
                                                                    <div class="col-sm-4">

                                                                        <asp:TextBox ID="tbkullaniciadi" runat="server" CssClass="form-control" ValidationGroup="ekle"></asp:TextBox>
                                                                    </div>
                                                                     <div class="col-sm-3" style="display: inline;">
                                                                        <asp:TextBox ID="tbpassword" Enabled="false" runat="server" CssClass="form-control" ValidationGroup="ekle" Width="200" Style="display: inline-block"></asp:TextBox>
                                                                        <asp:LinkButton ID="btngenaratepass" runat="server" Text="Şifre Oluştur" Width="150" Height="35" Style="display: inline-block; font-size: 15px !important; padding-top: 5px !important; color: #0094ff; text-decoration: underline !important;" OnClick="btngenaratepass_Click" />
                                                                    </div>
                                                                </div>





                                                              
                                                                <div class="form-group">



                                                                    <div class="col-sm-12 text-center">

                                                                        <asp:Button ID="btnkaydet" runat="server" Text="Kaydet" CssClass="btn btn-success" OnClick="btnkaydet_Click" ValidationGroup="ekle" Style="padding: 10px !important; font-size: 16px !important;" />

                                                                        <div class="alert-modal" id="modalnok" data-title="İşlem başarısız! Lütfen tekrar deneyiniz!!!" data-header-color="#e74c3c" data-overlay-color="rgba(41,41,41,0.9)" data-icon-class="fa fa-times" style="color: #FFF; font-weight: bold;"></div>
                                                                        <div class="alert-modal" id="modalok" data-title="İşlem başarılı, veriler yükleniyor, lütfen bekleyiniz..." data-header-color="#24cb2c" data-overlay-color="rgba(41,41,41,0.9)" data-icon-class="fa fa-check" style="color: #FFF; font-weight: bold;"></div>
                                                                        <asp:CustomValidator ID="cv" runat="server" ErrorMessage="Kullanıcı sistemde kayıtlıdır!!!" ControlToValidate="tbpassword" CssClass="alert alert-danger hata1" ValidationGroup="ekle" BorderStyle="None" Style="margin: 0px; padding: 0px;"></asp:CustomValidator>
                                                                        
                                                                    </div>


                                                                </div>




                                                            </div>
                                                        </asp:Panel>
                                                        <asp:Timer ID="Timer1" runat="server" Enabled="false" Interval="1000" OnTick="Timer1_Tick"></asp:Timer>
                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:AsyncPostBackTrigger ControlID="btnkaydet" EventName="Click" />
                                                    </Triggers>

                                                </asp:UpdatePanel>

                                            </div>
                                        </div>
                                        <div class="panel">

                                            <div class="panel-body p-20">
                                                <div class="panel-title">
                                                    <h5 class="underline">Tanımlı Kullanıcılar</h5>
                                                </div>
                                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                    <ContentTemplate>
                                                        <asp:GridView ID="GridView1" runat="server" CssClass="display  table table-bordered text-center" AutoGenerateColumns="False" DataKeyNames="No,NT Username,Ad-Soyad,E-Posta,Yetki Seviyesi,Kullanıcı Adı" AllowSorting="True">
                                                            <AlternatingRowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                            <Columns>
                                                                <asp:TemplateField AccessibleHeaderText="No" HeaderText="No">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblgvno" runat="server" Text='<%# Bind("[No]") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                    <HeaderStyle CssClass="text-center" />
                                                                    <ItemStyle CssClass="text-center" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField AccessibleHeaderText="NT Username" HeaderText="NT Username">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblgvNTUsername" runat="server" Text='<%# Bind("[NT Username]") %>'></asp:Label>
                                                                        <asp:TextBox ID="tbgvNTUsername" runat="server" Text='<%# Bind("[NT Username]") %>' CssClass="form-control mt-5" Visible="false"></asp:TextBox>
                                                                    </ItemTemplate>
                                                                    <HeaderStyle CssClass="text-center" />
                                                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField AccessibleHeaderText="Ad-Soyad" HeaderText="Ad-Soyad">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblgvadsoyad" runat="server" Text='<%# Bind("[Ad-Soyad]") %>'></asp:Label>
                                                                        <asp:TextBox ID="tbgvadsoyad" runat="server" Text='<%# Bind("[Ad-Soyad]") %>' CssClass="form-control mt-5" Visible="false"></asp:TextBox>
                                                                    </ItemTemplate>
                                                                    <HeaderStyle CssClass="text-center" />
                                                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField AccessibleHeaderText="E-Posta" HeaderText="E-Posta">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblgveposta" runat="server" Text='<%# Bind("[E-Posta]") %>'></asp:Label>
                                                                        <asp:TextBox ID="tbgveposta" runat="server" Text='<%# Bind("[E-Posta]") %>' CssClass="form-control mt-5" Visible="false"></asp:TextBox>
                                                                    </ItemTemplate>
                                                                    <HeaderStyle CssClass="text-center" />
                                                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                                </asp:TemplateField>
                                                               
                                                                
                                                               
                                                               
                                                                <asp:TemplateField AccessibleHeaderText="Yetki Seviyesi" HeaderText="Yetki Seviyesi">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblgvYetkiSeviyesi" runat="server" Text='<%# Bind("[Yetki Seviyesi]") %>'></asp:Label>
                                                                        <asp:DropDownList ID="ddlgvYetkiSeviyesi" runat="server" CssClass="form-control" Visible="false" class="form-control" Style="height: 35px">
                                                                            <asp:ListItem>Admin</asp:ListItem>
                                                                            <asp:ListItem>User</asp:ListItem>
                                                                        </asp:DropDownList>
                                                                    </ItemTemplate>
                                                                    <HeaderStyle CssClass="text-center" />
                                                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                                </asp:TemplateField>
                                                                
                                                                <asp:TemplateField AccessibleHeaderText="Kullanıcı Adı" HeaderText="Kullanıcı Adı">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblgvkullaniciadi" runat="server" Text='<%# Bind("[Kullanıcı Adı]") %>'></asp:Label>
                                                                        <asp:TextBox ID="tbgvkullaniciadi" runat="server" Text='<%# Bind("[Kullanıcı Adı]") %>' CssClass="form-control mt-5" Visible="false"></asp:TextBox>
                                                                    </ItemTemplate>
                                                                    <HeaderStyle CssClass="text-center" />
                                                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                                </asp:TemplateField>
                                                                 <asp:TemplateField AccessibleHeaderText="Parola" HeaderText="Parola">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblgvpassword" runat="server" Text="************"></asp:Label>
                                                                        <asp:TextBox ID="tbgvpassword" runat="server" CssClass="form-control mt-5" Visible="false"></asp:TextBox>
                                                                         <asp:LinkButton ID="btngvgenaratepass" runat="server" Text="Şifre Üret" Width="150" Height="35" Style="display: inline-block; font-size: 15px !important; padding-top: 5px !important; color: #0094ff; text-decoration: underline !important;" OnClick="btngvgenaratepass_Click" Visible="false" />
                                                                    </ItemTemplate>
                                                                    <HeaderStyle CssClass="text-center" />
                                                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Güncelle">
                                                                    <ItemTemplate>
                                                                        <asp:Button ID="btnguncelle1" runat="server" BorderStyle="None" CommandName="Guncelle1" CssClass="btn btn-primary" OnClick="btnguncelle1_Click" Text="Güncelle" />
                                                                        <asp:Button ID="btnguncelle2" runat="server" BorderStyle="None" CommandName="Guncelle2" CssClass="btn btn-success" OnClick="btnguncelle2_Click" Text="Güncelle" Visible="false" />
                                                                    </ItemTemplate>
                                                                    <HeaderStyle CssClass="text-center" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Delete">
                                                                    <ItemTemplate>
                                                                        <asp:Button ID="btnsil" runat="server" OnClientClick="return confirm('Seçilen kayda ait tüm veriler silinecektir, onaylıyor musunuz?');" BorderStyle="None" CommandName="Sil" CssClass="btn btn-danger" OnClick="btnsil_Click" Text="Sil" />
                                                                    </ItemTemplate>
                                                                    <HeaderStyle CssClass="text-center" />
                                                                </asp:TemplateField>
                                                            </Columns>
                                                            <HeaderStyle CssClass="text-center !important" />
                                                            <RowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                        </asp:GridView>

                                                    </ContentTemplate>

                                                </asp:UpdatePanel>

                                                <!-- /.col-md-12 -->
                                            </div>
                                        </div>
                                        <!-- /.panel -->
                                    </div>
                                    <!-- /.col-md-6 -->



                                </div>
                                <!-- /.row -->

                            </div>
                            <!-- /.container-fluid -->
                        </section>


                        <!-- /.section -->
                    </div>
                    <!-- /.main-page -->



                </div>
                <!-- /.content-container -->
            </div>
            <!-- /.content-wrapper -->

        </div>

        <!-- /.main-wrapper -->

        <!-- ========== COMMON JS FILES ========== -->
        <script src="js/jquery/jquery-2.2.4.min.js"></script>
        <script src="js/jquery-ui/jquery-ui.min.js"></script>
        <script src="js/bootstrap/bootstrap.min.js"></script>

        <script src="js/lobipanel/lobipanel.min.js"></script>

        <script src="js/iziModal/iziModal.min.js"></script>
        <script src="js/sweet-alert/sweetalert.min.js"></script>

        <!-- ========== THEME JS ========== -->
        <script src="js/main.js"></script>


        <!-- ========== ADD custom.js FILE BELOW WITH YOUR CHANGES ========== -->
    </form>
</body>
</html>
