<?php include "../config.php" ?>

<!DOCTYPE html>
<html lang="tw">
<head>
<meta http-equiv="Content-Type" content="text/html, charset=utf-8" />
<title>神奇寶貝查詢系統 - 修改區域</title>
<link href="../css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <div class="page">
        <header>
            <div class="logo">
                <h1>神奇寶貝查詢系統</h1>
                <p>Pokemon Search System</p>
            </div>
        </header>

        <div class="navbar">
            <?php include("../include/snav.php"); ?>

        </div>

        <div class="main">

            <div class="full-content">
                <h2>修改區域</h2>

                <form action="" method="GET">

                    <div class="drag">
                        <label for="RID">RID：</label><br>
                        <select class="RID" name="RID">
                            <?php include "./include/listRegion.php" ?>
                        </select>
                    </div><br>

                    <div class="textbox">
                        <label for="RName">地區名稱：</label><br>
                        <input type="text" name="RName" id="RName">
                    </div><br>

                    <div class="textbox">
                        <label for="RDescribe">地區描述：</label><br>
                        <input type="text" name="RDescribe" id="RDescribe">
                    </div><br>

                    <input type="submit" value="修改">
                    <input type="reset">
                </form>

            </div>
        </div>

        <?php

            if($_GET)
            {
                $str = "UPDATE Region Set ";

                $A=0;

                if($_GET["RName"] !== "") {
                    if($A==1) $str = $str." , ";
                    $A = 1;
                    $str = $str." RName = '".$_GET["RName"]."'";
                }

                if($_GET["RDescribe"] !== "") {
                    if($A==1) $str = $str." , ";
                    $A = 1;
                    $str = $str." RDescribe = '".$_GET["RDescribe"]."'";
                }

                $str = $str." WHERE RID = ".$_GET["RID"];


                echo $str;
                $success = mysql_query($str, $link);

                if(!$success) { // if error
                    die("失敗：".mysql_error());
                }
            }
            else {
                // 初始化
            }
        ?>

        <footer>
            <div class="copy">2015 &copy; 范耿誌、黃冠傑、陳羽恆</div>
        </footer>
    </div>
</body>
</html>
