<?php include "../config.php" ?>

<!DOCTYPE html>
<html lang="tw">
<head>
<meta http-equiv="Content-Type" content="text/html, charset=utf-8" />
<title>神奇寶貝查詢系統 - 新增招式</title>
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
                <h2>新增招式</h2>

                <form action="" method="GET">

                <div class="textbox">
                    <label for="SName">招式名稱：</label><br>
                    <input type="text" name="SName" id="SName">
                </div>

                <div class="drag">
                    <label for="SType">招式類型：</label>
                    <div>
                        <select class="SType" name="SType">

                        <?php
                            $property = ['火', '水', '草', '雷', '冰', '超', '龍', '惡',
                            '普', '格', '毒', '地', '飛', '蟲', '岩', '鬼', '鋼'];

                            foreach($property as $i) {
                                echo "<option value=\"".$i."\">".$i."</option>";
                            }
                        ?>

                        </select>
                    </div>
                </div><br>

                <div class="ability">
                    <div>
                        <label for="SPowerPoint">SPowerPoint：</label><br>
                        <input type="number" name="SPowerPoint" id="SPowerPoint">
                    </div>
                </div><br>

                <div class="textbox">
                    <label for="SBasePower">SBasePower：</label><br>
                    <input type="number" name="SBasePower" id="SBasePower">
                </div><br>

                <div class="textbox">
                    <label for="SAccuracy">命中率：</label><br>
                    <input type="text" name="SAccuracy" id="SAccuracy">
                </div><br>

                <div class="textbox">
                    <label for="SEffect">技能描述/特殊效果：</label><br>
                    <input type="text" name="SEffect" id="SEffect">
                </div><br>

                <div class="textbox">
                    <label for="SSpeedPriority">速度優先度：</label><br>
                    <input type="number" name="SSpeedPriority" id="SSpeedPriority">
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
                $IDs = mysql_query("SELECT MAX(SID) as max FROM Skill;");

                while ($row = mysql_fetch_array($IDs)) {
                    $theID = $row["max"]+1;
                }

                echo "<br>";

                echo $insert = "INSERT INTO Skill VALUES(".$theID.",
                            '".$_GET["SName"]."',
                            '".$_GET["SType"]."',
                            ".$_GET["SPowerPoint"].",
                            ".$_GET["SBasePower"].",
                            ".$_GET["SAccuracy"].",
                            '".$_GET["SEffect"]."',
                            ".$_GET["SSpeedPriority"].")";

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
