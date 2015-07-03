<?php include "../config.php" ?>

<!DOCTYPE html>
<html lang="tw">
<head>
<meta http-equiv="Content-Type" content="text/html, charset=utf-8" />
<title>神奇寶貝查詢系統 - 修改招式</title>
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
                <h2>修改招式</h2>

                <form action="" method="GET">

                    <div class="drag">
                        <label for="SID">SID：</label><br>
                        <select class="SID" name="SID">
                            <?php include "./include/listSkill.php" ?>
                        </select>
                    </div><br>

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

                                echo "<option value=\"none\">不更動</option>";

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

                    <input type="submit" value="修改">
                    <input type="reset">

                </form>
            </div>
        </div>

        <?php

            if($_GET)
            {
                $str = "UPDATE Skill Set ";

                $A=0;

                if($_GET["SName"] !== "") {
                    if($A==1) $str = $str." , ";
                    $A = 1;
                    $str = $str." SName = '".$_GET["SName"]."'";
                }

                if($_GET["SType"] !== "none") {
                    if($A==1) $str = $str." , ";
                    $A = 1;
                    $str = $str." SType = '".$_GET["SType"]."'";
                }

                if($_GET["SPowerPoint"] !== "") {
                    if($A==1) $str = $str." , ";
                    $A = 1;
                    $str = $str." SPowerPoint = ".$_GET["SPowerPoint"];
                }

                if($_GET["SBasePower"] !== "") {
                    if($A==1) $str = $str." , ";
                    $A = 1;
                    $str = $str." SBasePower = ".$_GET["SBasePower"];
                }

                if($_GET["SAccuracy"] !== "") {
                    if($A==1) $str = $str." , ";
                    $A = 1;
                    $str = $str." SAccuracy = ".$_GET["SAccuracy"];
                }


                if($_GET["SEffect"] !== "") {
                    if($A==1) $str = $str." , ";
                    $A = 1;
                    $str = $str." SEffect = '".$_GET["SEffect"]."'";
                }


                if($_GET["SSpeedPriority"] !== "") {
                    if($A==1) $str = $str." , ";
                    $A = 1;
                    $str = $str." SSpeedPriority = ".$_GET["SSpeedPriority"];
                }


                $str = $str." WHERE SID = ".$_GET["SID"];


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
