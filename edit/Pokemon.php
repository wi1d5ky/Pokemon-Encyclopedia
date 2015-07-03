<?php include "../config.php" ?>

<!DOCTYPE html>
<html lang="tw">
<head>
<meta http-equiv="Content-Type" content="text/html, charset=utf-8" />
<title>神奇寶貝查詢系統 - 修改神奇寶貝</title>
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
                <h2>修改神奇寶貝</h2>

                <form action="#" method="GET">

                    <div class="drag">
                        <label for="PID">PID：</label><br>

                        <select class="PID" name="PID">
                            <?php include './include/listPokemon.php'; ?>
                        </select>

                    </div><br>

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

                                echo "<option value=\"none\">不設置</option>";

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

                                echo "<option value=\"none\">不設置</option>";
                                echo "<option value=\"null\">無</option>";
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

                    <input type="submit" value="修改">
                    <input type="reset">

                </form>
            </div>
        </div>

        <?php

            if($_GET)
            {
                $str = "UPDATE Pokemon Set ";

                $A=0;

                if($_GET["Name"] !== "") {
                    if($A==1) $str = $str." , ";
                    $A = 1;
                    $str = $str." Name = '".$_GET["Name"]."'";
                }

                if($_GET["GenderRatio"] !== "") {
                    if($A==1) $str = $str." , ";
                    $A = 1;
                    $str = $str." GenderRatio = ".$_GET["GenderRatio"];
                }

                if($_GET["Type_1"] !== "none") {
                    if($A==1) $str = $str." , ";
                    $A = 1;
                    $str = $str." Type_1 = '".$_GET["Type_1"]."'";
                }

                if($_GET["Type_2"] !== "none") {
                    if($A==1) $str = $str." , ";
                    $A = 1;
                    $str = $str." Type_2 = '".$_GET["Type_2"]."'";
                }


                if($_GET['HP'] != ""){
                    if($A==1) $str = $str." , ";
                    $A = 1;
                    $str = $str.' HP = '.$_GET['HP'];
                }

                if($_GET['ATK'] != ""){
                    if($A==1) $str = $str." , ";
                    $A = 1;
                    $str = $str.' ATK = '.$_GET['ATK'];
                }

                if($_GET['DEF'] != ""){
                    if($A==1) $str = $str." , ";
                    $A = 1;
                    $str = $str.' DEF = '.$_GET['DEF'];
                }

                if($_GET['SATK'] != ""){
                    if($A==1) $str = $str." , ";
                    $A = 1;
                    $str = $str.' SATK = '.$_GET['SATK'];
                }

                if($_GET['SDEF'] != ""){
                    if($A==1) $str = $str." , ";
                    $A = 1;
                    $str = $str.' SDEF = '.$_GET['SDEF'];
                }

                if($_GET['SPD'] != ""){
                    if($A==1) $str = $str." , ";
                    $A = 1;
                    $str = $str.' SPD = '.$_GET['SPD'];
                }

                if($_GET['SPD'] != ""){
                    if($A==1) $str = $str." , ";
                    $A = 1;
                    $str = $str.' SPD = '.$_GET['SPD'];
                }

                if($_GET['AID'] != "none"){
                    if($A==1) $str = $str." , ";
                    $A = 1;
                    $str = $str.' AID = '.$_GET['AID'];
                }

                if($_GET['IID'] != "none"){
                    if($A==1) $str = $str." , ";
                    $A = 1;
                    $str = $str.' IID = '.$_GET['IID'];
                }

                $str = $str." WHERE PID = ".$_GET["PID"];


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
