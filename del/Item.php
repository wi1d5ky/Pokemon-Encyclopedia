<?php include "../config.php" ?>

<!DOCTYPE html>
<html lang="tw">
<head>
<meta http-equiv="Content-Type" content="text/html, charset=utf-8" />
<title>神奇寶貝查詢系統 - 刪除道具</title>
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
                <h2>刪除道具</h2>

                <form action="#" method="GET">

                    <div class="drag smaller">
                        <label for="IID">道具名稱：</label>
                        <select class="IID" name="IID">
                            <?php include "./include/listItem.php" ?>
                        </select>
                    </div>

                    <input type="submit" value="刪除">
                    <input type="reset">

                </form>

                <div class="result">
                    <?php

                        if($_GET)
                        {
                            $success = mysql_query("DELETE FROM Item WHERE IID = ".$_GET["IID"], $link);

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
