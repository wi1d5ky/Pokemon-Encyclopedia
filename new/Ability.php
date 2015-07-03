<?php include "../config.php" ?>

<!DOCTYPE html>
<html lang="tw">
<head>
<meta http-equiv="Content-Type" content="text/html, charset=utf-8" />
<title>神奇寶貝查詢系統 - 新增特性</title>
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
                <h2>新增特性</h2>

                <form action="" method="GET">

                    <div class="textbox">
                        <label for="AName">特性名稱：</label><br>
                        <input type="text" name="AName" id="AName">
                    </div><br>

                    <div class="textbox">
                        <label for="AEffect">特性效果：</label>
                        <input type="text" name="AEffect" id="AEffect">
                    </div><br>

                    <input type="submit" value="新增">
                    <input type="reset">

                </form>

            </div>
        </div>

        <?php

            if($_GET)
            {
                $theID=0;
                $IDs = mysql_query("SELECT MAX(AID) as max FROM Ability;");

                while ($row = mysql_fetch_array($IDs)) {
                    $theID = $row["max"]+1;
                }

                echo "<br>";

                $insert = "INSERT INTO Ability VALUES(".$theID.",
                             '".$_GET["AName"]."',
                             '".$_GET["AEffect"]."')";

                $success = mysql_query($insert, $link);

                if(!$success) { // if error
                    die("新增失敗：".mysql_error());
                }
                else {
                    echo "新增成功！";
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
