<?php include "../config.php" ?>

<!DOCTYPE html>
<html lang="tw">
<head>
<meta http-equiv="Content-Type" content="text/html, charset=utf-8" />
<title>神奇寶貝查詢系統 - 刪除地點</title>
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
                <h2>刪除地點</h2>

                <form action="#" method="GET">

                    <div class="drag smaller">
                        <label for="PID">神奇寶貝名字：</label>
                        <select class="PID" name="PID">
                            <?php include "./include/listPokemon.php" ?>
                        </select>
                    </div>

                    <div class="drag smaller">
                        <label for="RID">區域名稱：</label>
                        <select class="RID" name="RID">
                            <?php include "./include/listRegion.php" ?>
                        </select>
                    </div><br>

                    <input type="submit" value="刪除">
                    <input type="reset">
                </form>

                <div class="result">

                <?php

                    if($_GET)
                    {
                        $success = mysql_query("
                            DELETE FROM Locations WHERE
                            PID = ".$_GET["PID"]." AND
                            RID = ".$_GET["RID"]
                            , $link);

                        if(!$success) { // if error
                            die("<div class=\"error\">未找到資料</div>");
                        }
                    }
                    else {
                        // 初始化
                    }

                ?>

                </div>
            </div>
        </div>

        <footer>
            <div class="copy">2015 &copy; 范耿誌、黃冠傑、陳羽恆</div>
        </footer>
    </div>
</body>
</html>
