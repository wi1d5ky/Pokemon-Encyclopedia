<?php include "../config.php" ?>

<!DOCTYPE html>
<html lang="tw">
<head>
<meta http-equiv="Content-Type" content="text/html, charset=utf-8" />
<title>神奇寶貝查詢系統 - 修改特性</title>
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
                <h2>修改特性</h2>

                <form action="" method="GET">

                    <div class="drag">
                        <label for="AID">AID：</label><br>
                        <select class="AID" name="AID">
                            <?php include "./include/listAbility.php" ?>
                        </select>
                    </div><br>

                    <div class="textbox">
                        <label for="AName">特性名稱：</label><br>
                        <input type="text" name="AName" id="AName">
                    </div><br>

                    <div class="textbox">
                        <label for="AEffect">特性效果：</label>
                        <input type="text" name="AEffect" id="AEffect">
                    </div><br>

                    <input type="submit" value="修改">
                    <input type="reset">

                </form>

            </div>
        </div>

                <?php

                    if($_GET)
                    {
                        $str = "UPDATE Ability Set ";

                        $A=0;

                        if($_GET["AName"] !== "") {
                            if($A==1) $str = $str." , ";
                            $A = 1;
                            $str = $str." AName = '".$_GET["AName"]."'";
                        }

                        if($_GET["AEffect"] !== "") {
                            if($A==1) $str = $str." , ";
                            $A = 1;
                            $str = $str." AEffect = '".$_GET["AEffect"]."'";
                        }

                        $str = $str." WHERE AID = ".$_GET["AID"];


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
