<%@ Page Language="C#" CodeFile="index.aspx.cs" Inherits="admin_index" AutoEventWireup="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="copyright" content="Sedat BIYIK" />
    <meta name="author" content="" />
    <link rel="shortcut icon" href="<%= ResolveUrl("~") %>favicon.ico" />
    <title>Araç Takip Sistemi</title>
    <!-- ========== COMMON STYLES ========== -->
    <link rel="stylesheet" href="<%= ResolveUrl("~") %>css/bootstrap.css" media="screen" />
    <link rel="stylesheet" href="<%= ResolveUrl("~") %>css/font-awesome.min.css" media="screen" />
    <link rel="stylesheet" href="<%= ResolveUrl("~") %>css/animate-css/animate.min.css" media="screen" />
    <link rel="stylesheet" href="<%= ResolveUrl("~") %>css/lobipanel/lobipanel.min.css" media="screen" />


    <link rel="stylesheet" href="<%= ResolveUrl("~") %>css/iziModal/iziModal.min.css" media="screen" />
    <link rel="stylesheet" href="<%= ResolveUrl("~") %>css/sweet-alert/sweetalert.css" media="screen" />

    <!-- ========== THEME CSS ========== -->
    <link rel="stylesheet" href="<%= ResolveUrl("~") %>css/main.css" media="screen" />
    <link rel="stylesheet" href="<%= ResolveUrl("~") %>css/colorbox.css" />
    <!-- ========== MODERNIZR ========== -->
    <script src="<%= ResolveUrl("~") %>js/modernizr/modernizr.min.js"></script>
    
    <script type="text/javascript">
        function giris(kontrol) {
            if (kontrol.value == 'Kullanıcı Adı...') {
                kontrol.value = '';
            }
        }
        function cikis(kontrol) {
            if (kontrol.value == '') {
                kontrol.value = 'Kullanıcı Adı...';

            }

        }

        function giris1(kontrol) {
            if (kontrol.value == 'Parola...') {
                kontrol.value = '';
            }
        }
        function cikis1(kontrol) {
            if (kontrol.value == '') {
                kontrol.value = 'Parola...';

            }

        }

        function mesaj() {
            $('#modal13').iziModal();
            $('#modal13').iziModal('open', this);
        };
        function mesaj1() {
            $('#modal14').iziModal();
            $('#modal14').iziModal('open', this);

        };

    </script>

</head>
<body>
    
    <div class="main-wrapper">

        <div class="login-bg">
            <div class="row">
                <div class="col-md-4 col-md-offset-4">
                    <div class="panel login-box" style="background:rgba(255,255,255,0.5) !important;">

                        <div class="panel-body">

                            <div class="section-title">
                                <p class="text-center">
                                    <img src="<%= ResolveUrl("~") %>images/cbk.jpg" alt="Araç Takip Sistemi" class="logo" width="350px" height="5px" /></p>
                                <p class="text-center">
                                    <img src="<%= ResolveUrl("~") %>images/logorapor.png" alt="Araç Takip Sistemi" class="logo" width="300px" /></p>
                                <p class="text-center">
                                    <img src="<%= ResolveUrl("~") %>images/cbk.jpg" alt="Araç Takip Sistemi" class="logo" width="350px" height="5px" /></p>
                                <p class="sub-title color-white white text-center">Araç Takip Sistemi</p>
                            </div>

                            <form id="form1" runat="server">

                                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
                                        <div class="form-group">
                                            <label>Kullanıcı Adı:</label>
                                            <asp:TextBox runat="server" class="form-control" ID="tbk_adi" Text="Kullanıcı Adı..." autocomplete="off"></asp:TextBox>

                                        </div>
                                        <div class="form-group">
                                            <label>Parola:</label>

                                            <asp:TextBox runat="server" type="password" class="form-control" ID="tbk_parola" Text="Parola..."></asp:TextBox>

                                        </div>

                                        <div class="form-group text-center">
                                            <div class="text-center">
                                                <asp:Button ID="btngiris" OnClick="btngiris_Click" runat="server" Text="GİRİŞ" type="submit" CssClass="btn btn-grad" />
                                                <div class="alert-modal" id="modal13" data-title="Hatalı kullanıcı adı ya da parola! Lütfen tekrar deneyiniz!!!" data-header-color="#e74c3c" data-overlay-color="rgba(41,41,41,0.9)" data-icon-class="fa fa-times" style="color: #FFF; font-weight: bold;"></div>
                                                <div class="alert-modal" id="modal14" data-title="Giriş başarılı, paneliniz yükleniyor, lütfen bekleyiniz..." data-header-color="#24cb2c" data-overlay-color="rgba(41,41,41,0.9)" data-icon-class="fa fa-check" style="color: #FFF; font-weight: bold;"></div>

                                                <div class="clearfix"></div>
                                            </div>
                                        </div>
                                        <hr>

                                        <div class="alert alert-danger left-icon-alert" role="alert" id="hataligiris" runat="server" visible="false">

                                            <asp:Label ID="lblhatavar" runat="server" Text="Hatalı kullanıcı adı ya da parola!" Visible="false"></asp:Label>
                                            <asp:RegularExpressionValidator runat="server" Display="Dynamic" ID="searchValidator" ControlToValidate="tbk_adi" ErrorMessage="Hatalı kullanıcı adı ya da parola!" ValidationExpression="/^[-_ 0-9a-z]|\.|[-_ 0-9a-z]$/i" />
                                            <asp:RegularExpressionValidator runat="server" Display="Dynamic" ID="RegularExpressionValidator1" ControlToValidate="tbk_parola" ErrorMessage="Hatalı kullanıcı adı ya da parola!" ValidationExpression="/^[-_ 0-9a-z]|\.|[-_ 0-9a-z]$/i" />
                                        </div>
                                        <div class="alert alert-success left-icon-alert" role="alert" id="dogrugiris" runat="server" visible="false">
                                            <asp:Label ID="lblhatayok" runat="server" Text="Paneliniz yükleniyor, lütfen bekleyiniz..." Visible="false"></asp:Label>

                                        </div>
                                        <asp:Timer ID="Timer1" runat="server" Enabled="false" Interval="500" OnTick="Timer1_Tick"></asp:Timer>

                                        <asp:Timer ID="Timer2" runat="server" Enabled="false" Interval="1000" OnTick="Timer2_Tick">
                                        </asp:Timer>

                                    </ContentTemplate>

                                </asp:UpdatePanel>


                            </form>




                            <!-- /.text-center -->

                        </div>
                    </div>

                </div>
                <!-- /.col-md-6 col-md-offset-3 -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /. -->

    </div>
    <!-- /.main-wrapper -->

    <!-- ========== COMMON JS FILES ========== -->
    <script src="<%= ResolveUrl("~") %>js/jquery/jquery-2.2.4.min.js"></script>
    <script src="<%= ResolveUrl("~") %>js/jquery-ui/jquery-ui.min.js"></script>
    <script src="<%= ResolveUrl("~") %>js/bootstrap/bootstrap.min.js"></script>



    <script src="<%= ResolveUrl("~") %>js/iziModal/iziModal.min.js"></script>
    <script src="<%= ResolveUrl("~") %>js/sweet-alert/sweetalert.min.js"></script>

    <!-- ========== THEME JS ========== -->
    <script src="<%= ResolveUrl("~") %>js/main.js"></script>
    
   
    <!-- ========== ADD custom.js FILE BELOW WITH YOUR CHANGES ========== -->

</body>
</html>
