<?php include "../config.php" ?>

<!DOCTYPE html>
<html lang="tw">
<head>
<meta http-equiv="Content-Type" content="text/html, charset=utf-8" />
<title>神奇寶貝查詢系統 - 新增神奇寶貝</title>
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
                <h2>新增神奇寶貝</h2>

                <form action="#" method="GET">

                    <div class="textbox">
                        <label for="name">名字：</label><br>
                        <input type="text" name="Name" id="Name">
                    </div><br>

                    <div class="textbox">
                        <label for="GenderRatio">性別比：</label>
                        <input type="text" name="GenderRatio" id="GenderRatio">
                    </div><br>

                    <div class="drag smaller">
                        <label for="Type_1">屬性一：</label>
                        <div>
                            <select class="Type_1" name="Type_1">

                            <?php
                                $property = ['火', '水', '草', '雷', '冰', '超', '龍', '惡',
                                '普', '格', '毒', '地', '飛', '蟲', '岩', '鬼', '鋼'];

                                foreach($property as $i) {
                                    echo "<option value=\"".$i."\">".$i."</option>";
                                }
                            ?>

                            </select>
                        </div>
                    </div>

                    <div class="drag smaller">
                        <label for="Type_2">屬性二：</label>
                        <div>
                            <select class="Type_2" name="Type_2">

                            <?php
                                $property = ['火', '水', '草', '雷', '冰', '超', '龍', '惡',
                                '普', '格', '毒', '地', '飛', '蟲', '岩', '鬼', '鋼'];

                                echo "<option value=\"null\">未選擇</option>";
                                foreach($property as $i) {
                                    echo "<option value=\"".$i."\">".$i."</option>";
                                }
                            ?>

                            </select>
                        </div>
                    </div><br>
                    <div class="ability">
                        <div>
                            <label for="HP">HP：</label>
                            <input type="number" name="HP" id="HP">
                        </div>
                        <div>
                            <label for="ATK">ATK：</label>
                            <input type="number" name="ATK" id="ATK">
                        </div>
                        <div>
                            <label for="DEF">DEF：</label>
                            <input type="number" name="DEF" id="DEF">
                        </div>
                        <div>
                            <label for="SATK">SATK：</label>
                            <input type="number" name="SATK" id="SATK">
                        </div>
                        <div>
                            <label for="SDEF">SDEF：</label>
                            <input type="number" name="SDEF" id="SDEF">
                        </div>
                        <div>
                            <label for="SPD">SPD：</label>
                            <input type="number" name="SPD" id="SPD">
                        </div>
                    </div>

                    <div class="drag smaller">
                        <label for="AID">特性：</label>
                        <select class="AID" name="AID">
                            <?php include "./include/listAbility.php" ?>
                        </select>
                    </div>

                    <div class="drag smaller">
                        <label for="IID">攜帶道具：</label>
                        <select class="IID" name="IID">
                            <?php include "./include/listItem.php" ?>
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
                $IDs = mysql_query("SELECT MAX(PID) as max FROM Pokemon;");
                while ($row = mysql_fetch_array($IDs)) {
                    $theID = $row["max"]+1;
                }

                echo "<br>";

                $insert = "
                    INSERT INTO Pokemon VALUES(".$theID.",
                     '".$_GET["Name"]."',
                     ".$_GET["GenderRatio"].",
                     '".$_GET["Type_1"]."', '".$_GET["Type_2"]."',
                     ".$_GET["HP"].", ".$_GET["ATK"].", ".$_GET["DEF"].",
                     ".$_GET["SATK"].", ".$_GET["SDEF"].", ".$_GET["SPD"].",
                     ".$_GET["AID"].", ".$_GET["IID"].")";

                $success = mysql_query($insert, $link);

                if(!$success) { // if error
                    die("新增失敗：".mysql_error());
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
