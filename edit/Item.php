<?php include "../config.php" ?>

<!DOCTYPE html>
<html lang="tw">
<head>
<meta http-equiv="Content-Type" content="text/html, charset=utf-8" />
<title>神奇寶貝查詢系統 - 修改道具</title>
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
                <h2>修改道具</h2>

                <form action="" method="GET">

                    <div class="drag">
                        <label for="IID">IID：</label><br>
                        <select class="IID" name="IID">
                            <?php include "./include/listItem.php" ?>
                        </select>
                    </div><br>

                     <div class="textbox">
                         <label for="IName">道具名稱：</label><br>
                         <input type="text" name="IName" id="IName">
                     </div><br>

                     <div class="textbox">
                         <label for="IPercentage">出現機率：</label>
                         <input type="text" name="IPercentage" id="IPercentage">
                     </div><br>

                     <input type="submit" value="修改">
                     <input type="reset">

                </form>

            </div>
        </div>

        <?php

            if($_GET)
            {
                $str = "UPDATE Item Set ";

                $A=0;

                if($_GET["IName"] !== "") {
                    if($A==1) $str = $str." , ";
                    $A = 1;
                    $str = $str." IName = '".$_GET["IName"]."'";
                }

                if($_GET["IPercentage"] !== "") {
                    if($A==1) $str = $str." , ";
                    $A = 1;
                    $str = $str." IPercentage = '".$_GET["IPercentage"]."'";
                }

                $str = $str." WHERE IID = ".$_GET["IID"];


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
