<?php include "../config.php" ?>

<!DOCTYPE html>
<html lang="tw">
<head>
<meta http-equiv="Content-Type" content="text/html, charset=utf-8" />
<title>神奇寶貝查詢系統 - 新增地點</title>
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
                <h2>新增地點</h2>

                <form action="" method="GET">

                    <div class="drag smaller">
                        <label for="PID">神奇寶貝名稱：</label>
                        <select class="PID" name="PID">
                            <?php include "./include/listPokemon.php" ?>
                        </select>
                    </div>

                    <div class="drag smaller">
                        <label for="RID">區域名稱：</label>
                        <select class="RID" name="RID">
                            <?php include "./include/listRegion.php" ?>
                        </select>
                    </div>

                     <div class="textbox">
                         <label for="LoProbability">出現機率：</label><br>
                         <input type="text" name="LoProbability" id="LoProbability">
                     </div><br>

                     <div class="drag">
                        <label for="LoWay">出現方法：</label>
                        <select class="LoWay" name="LoWay">
                            <?php
                                $way = ['道路', '衝浪', '爛釣竿', '好釣竿', '高級釣竿'];

                                foreach ($way as $key => $value) {
                                    echo "<option value=\"".$key."\">".$value."</option>";
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
                $IDs = mysql_query("SELECT MAX(LoID) as max FROM Locations;");

                while ($row = mysql_fetch_array($IDs)) {
                    $theID = $row["max"]+1;
                }

                echo "<br>";

                $insert = "INSERT INTO Locations VALUES("
                            .$theID.", "
                            .$_GET["PID"].", "
                            .$_GET["RID"].", "
                            .$_GET["LoProbability"].", "
                            .$_GET["LoWay"].")";

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
