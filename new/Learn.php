<?php include "../config.php" ?>

<!DOCTYPE html>
<html lang="tw">
<head>
<meta http-equiv="Content-Type" content="text/html, charset=utf-8" />
<title>神奇寶貝查詢系統 - 新增學習</title>
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

                <h2>新增學習</h2>

                <form action="" method="GET">

                    <div class="drag smaller">
                        <label for="PID">招式名稱：</label>
                        <select class="PID" name="PID">
                            <?php include "./include/listPokemon.php" ?>
                        </select>
                    </div>

                    <div class="drag smaller">
                        <label for="SID">招式名稱：</label>
                        <select class="SID" name="SID">
                            <?php include "./include/listSkill.php" ?>
                        </select>
                    </div><br>

                    <div class="drag smaller">
                        <label for="LAtLevel">何時學會：</label>
                        <select class="LAtLevel" name="LAtLevel">
                            <?php
                                for ($i=1; $i <= 100 ; $i++) {
                                    echo "<option value=\"".$i."\">".$i."</option>";
                                }
                             ?>
                        </select>
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
                $IDs = mysql_query("SELECT MAX(LID) as max FROM Learn;");

                while ($row = mysql_fetch_array($IDs)) {
                    $theID = $row["max"]+1;
                }

                echo $insert = "INSERT INTO Learn VALUES(".$theID.",
                             ".$_GET["PID"].",
                             ".$_GET["SID"].",
                             ".$_GET["LAtLevel"].")";

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
