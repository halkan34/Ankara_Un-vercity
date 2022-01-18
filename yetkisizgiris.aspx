<%@ Page Language="C#" AutoEventWireup="true" CodeFile="yetkisizgiris.aspx.cs" Inherits="yetkisizgiris" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="copyright" content="Sedat BIYIK" />
    <meta name="author" content="" />
    <link rel="shortcut icon" href="<%= ResolveUrl("~") %>favicon.ico" />
    <!-- ========== COMMON STYLES ========== -->
    <title>Araç Takip Sistemi</title>
    <!-- ========== COMMON STYLES ========== -->
    <link rel="stylesheet" href="<%= ResolveUrl("~") %>css/bootstrap.min.css" media="screen">
    <link rel="stylesheet" href="<%= ResolveUrl("~") %>css/font-awesome.min.css" media="screen" />
    <link rel="stylesheet" href="<%= ResolveUrl("~") %>css/animate-css/animate.min.css" media="screen" />
    <link rel="stylesheet" href="<%= ResolveUrl("~") %>css/lobipanel/lobipanel.min.css" media="screen" />


    <link rel="stylesheet" href="<%= ResolveUrl("~") %>css/iziModal/iziModal.min.css" media="screen" />
    <link rel="stylesheet" href="<%= ResolveUrl("~") %>css/sweet-alert/sweetalert.css" media="screen" />

    <!-- ========== THEME CSS ========== -->
    <link rel="stylesheet" href="<%= ResolveUrl("~") %>css/main.css" media="screen" />
</head>
<body class="top-navbar-fixed bg-danger">
    <div class="main-wrapper">


        <!-- ========== WRAPPER FOR BOTH SIDEBARS & MAIN CONTENT ========== -->
        <div class="content-wrapper" style="margin-top:0px !important;">
            <div class="content-container">



                <div class="main-page">

                    <section class="section">
                        <div class="container-fluid">
                            <div class="col-md-offset-3 col-md-6  pt-50">
                                <div class="panel" style="border: 6px solid #cfcbcb;">
                                    <div class="panel-body p-30">
                                        <div class="error-box">
                                            <i class="fa fa-exclamation-triangle color-danger" style="font-size: 50px !important;"></i>

                                            <h2 class="sub-title" style="border-bottom:3px solid #ff0000;">Hatalı İşlem! Olası muhtemel sebepleri aşağıda görebilirsiniz!</h2>
                                            <div class="hr"></div>
                                            <p class="text-muted mb-15"><i class="fa fa-exclamation-triangle color-danger mr-5"></i>Görüntülemeye çalıştığınız sayfa bulunamadı!!! </p>
                                            <p class="text-muted mb-15"><i class="fa fa-exclamation-triangle color-danger mr-5"></i>Girişini yaptığınız verileri kontrol ederek işleminizi tekrar yapmayı deneyiniz!!! </p>
                                            <p class="text-muted mb-15"><i class="fa fa-exclamation-triangle color-danger mr-5"></i>Görüntülemeye çalıştığınız sayfaya erişim için yetkiniz yoktur!!! </p>
                                            <p class="text-muted mb-15">Aşağıdaki bağlantıya tıklayarak Araç Takip Sistemi anasayfasına ulaşabilirsiniz.</p>
                                            <p class="text-muted mb-15"><i class="fa fa-arrow-down color-success mr-5"></i><i class="fa fa-arrow-down color-success mr-5"></i><i class="fa fa-arrow-down color-success mr-5"></i></p>
                                            <div class="hr"></div>
                                            <a href="index.aspx" class="btn btn-primary btn-animated btn-wide p-10" style="font-size: 15px !important; border: 4px solid #cfcbcb;"><span class="visible-content">Anasayfa</span><span class="hidden-content"><i class="fa fa-arrow-right"></i></span></a>
                                        </div>
                                        <!-- /.error-box -->
                                    </div>
                                </div>
                                <!-- /.panel -->
                            </div>
                            <!-- /.col-md-offset-3 col-md-6 -->
                        </div>
                        <!-- /.container-fluid -->
                    </section>


                </div>
                <!-- /.main-page -->



            </div>
            <!-- /.content-container -->
        </div>
        <!-- /.content-wrapper -->

    </div>
    <!-- /.main-wrapper -->

    <!-- ========== COMMON JS FILES ========== -->
    <script src="<%= ResolveUrl("~") %>js/jquery/jquery-2.2.4.min.js"></script>
    <script src="<%= ResolveUrl("~") %>js/jquery-ui/jquery-ui.min.js"></script>
    <script src="<%= ResolveUrl("~") %>js/bootstrap/bootstrap.min.js"></script>

    <script src="<%= ResolveUrl("~") %>js/lobipanel/lobipanel.min.js"></script>


    <!-- ========== PAGE JS FILES ========== -->

    <script src="<%= ResolveUrl("~") %>js/iziModal/iziModal.min.js"></script>
    <script src="<%= ResolveUrl("~") %>js/sweet-alert/sweetalert.min.js"></script>

    <!-- ========== THEME JS ========== -->
    <script src="<%= ResolveUrl("~") %>js/main.js"></script>



    <!-- ========== ADD custom.js FILE BELOW WITH YOUR CHANGES ========== -->
</body>
</html>
