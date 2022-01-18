<%@ Page Language="C#" AutoEventWireup="true" CodeFile="aracduzenle.aspx.cs" Inherits="aracduzenle" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="copyright" content="Sedat BIYIK" />
    <meta name="author" content="" />
    <link rel="shortcut icon" href="favicon.ico" />
    <!-- ========== COMMON STYLES ========== -->
    <link rel="stylesheet" href="css/bootstrap.min.css" media="screen" />
    <link rel="stylesheet" href="css/font-awesome.min.css" media="screen" />
    <link rel="stylesheet" href="css/animate-css/animate.min.css" media="screen" />
    <link rel="stylesheet" href="css/lobipanel/lobipanel.min.css" media="screen" />

    <title>Araç Takip Sistemi</title>


    <!-- ========== THEME CSS ========== -->
    <link rel="stylesheet" href="css/main.css" media="screen" />
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
    <form runat="server" id="form1" enctype="multipart/form-data">



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
                                <h5 class="title">Araç Takip Sistemi</h5>
                                <small class="info" id="kullaniciadisoyadi" runat="server"></small>
                            </div>
                            <!-- /.user-info -->

                            <div class="sidebar-nav">
                                <ul class="side-nav color-white" id="yoneticipanelmenu" runat="server"></ul>
                                <ul class="side-nav color-white" style="margin-top: -25px !important;">
                                    <li>
                                        <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton1_Click" Style="padding-left: 15px !important; font-size: 14px !important;"><i class="fa fa-sign-out"></i>Güvenli Çıkış</asp:LinkButton></li>
                                </ul>
                                <!-- /.side-nav -->

                            </div>
                            <!-- /.sidebar-nav -->
                        </div>
                        <!-- /.sidebar-content -->
                    </div>
                    <!-- /.left-sidebar -->

                    <div class="main-page">
                        <div class="container-fluid">

                            <section class="section">
                                <div class="container-fluid" style="">
                                    <div class="row">






                                        <div class="col-md-12">
                                            <asp:ScriptManager ID="ScriptManager2" runat="server"></asp:ScriptManager>
                                            
                                            <div class="panel">

                                                <div class="panel-body p-20">
                                                    <div class="panel-title">
                                                        <h5 class="underline">Araç Güncelleme Ekranı</h5>
                                                    </div>
                                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                        <ContentTemplate>
                                                            <div class="col-sm-12 text-center">


                                                                <div class="alert-modal" id="modalnok" data-title="İşlem başarısız! Lütfen tekrar deneyiniz!!!" data-header-color="#e74c3c" data-overlay-color="rgba(41,41,41,0.9)" data-icon-class="fa fa-times" style="color: #FFF; font-weight: bold;"></div>
                                                                <div class="alert-modal" id="modalok" data-title="İşlem başarılı, veriler yükleniyor, lütfen bekleyiniz..." data-header-color="#24cb2c" data-overlay-color="rgba(41,41,41,0.9)" data-icon-class="fa fa-check" style="color: #FFF; font-weight: bold;"></div>

                                                            </div>
                                                             <asp:Timer ID="Timer1" runat="server" Enabled="false" Interval="1000" OnTick="Timer1_Tick"></asp:Timer>
                                                            <div id="araclistesi" runat="server"></div>


                                                        </ContentTemplate>

                                                    </asp:UpdatePanel>

                                                    <!-- /.col-md-12 -->
                                                </div>
                                            </div>
                                            <!-- /.panel -->
                                        </div>
                                        <!-- /.col-md-6 -->



                                    </div>
                                </div>
                            </section>
                        </div>
                        <!-- /.container-fluid -->





                        <!-- /.section -->
                    </div>
                    <!-- /.main-page -->

                    <div class="right-sidebar bg-white fixed-sidebar">
                        <div class="sidebar-content">
                            <div class="container-fluid">
                                <div class="row">
                                    <div class="col-md-12">
                                        <h4>Yardım Penceresi <i class="fa fa-times close-icon"></i></h4>
                                        <p>Yardım metni hazırlanmaktadır.</p>

                                    </div>
                                    <!-- /.col-md-12 -->


                                    <!-- /.text-center -->
                                </div>
                                <!-- /.row -->
                            </div>
                            <!-- /.container-fluid -->
                        </div>
                        <!-- /.sidebar-content -->
                    </div>
                    <!-- /.right-sidebar -->

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



        <script src="js/pace/pace.min.js"></script>
        <script src="js/lobipanel/lobipanel.min.js"></script>
        <script src="js/iscroll/iscroll.js"></script>

        <!-- ========== PAGE JS FILES ========== -->
        <script src="js/prism/prism.js"></script>
        <script src="js/prism/prism-line-numbers.js"></script>

        <!-- ========== THEME JS ========== -->
        <script src="js/main.js"></script>





    </form>
</body>


</html>
