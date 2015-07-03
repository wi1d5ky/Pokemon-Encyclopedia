<?php include('./config.php') ?>

<!DOCTYPE html>
<html lang="tw">
<head>
<meta http-equiv="Content-Type" content="text/html, charset=utf-8" />
<title>神奇寶貝查詢系統</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
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
            <?php include("./include/nav.php"); ?>
        </div>

        <div class="main">
            <div class="full-content">
                <form action="" method="get">
                    <div class="pokemon">
                        <label for="pokemon">以寵物編號搜尋：</label><br>
                        <input type="text" id="pokemon" name="pokemon" value=""> <br>
                    </div>
                    <div class="property">
                        <label for="property">屬性：</label>
                        <div>
                            <?php include "./include/property.php"; ?>
                        </div>
                    </div>
                    <div class="ability">
                        <div>HP：<br><input type="number" name="HP"></div>
                        <div>攻：<br><input type="number" name="ATK"></div>
                        <div>防：<br><input type="number" name="DEF"></div>
                        <div>特攻：<br><input type="number" name="SATK"></div>
                        <div>特防：<br><input type="number" name="SDEF"></div>
                        <div>速度：<br><input type="number" name="SPD"></div>
                        <div class="total">Total<input type="number" name="total"></div>
                    </div>

                    <div class="drag">只限特性：<br>
                        <select name="special">
                            <?php include "./include/special.php";?>
                        </select>
                    </div>

                    <div class="drag">只限區域：<br>
                        <select name="region">
                            <?php include './include/region.php'; ?>
                        </select>
                    </div>

                    <div class="drag smaller">只限懂招式：<br>
                        <?php
                            for ($i=1; $i <= 4; $i++) {
                                echo '<select name="skill'.$i.'">';?>
                                    <?php include "./include/skilloption.php"?>
                                <?php echo'</select>';
                            }
                        ?>
                    </div>

                    <div class="sort">排序方式依：<br>
                        <input type="radio" name="sort" value="PID">ID
                        <input type="radio" name="sort" value="HP">HP
                        <input type="radio" name="sort" value="ATK">攻
                        <input type="radio" name="sort" value="DEF">防
                        <input type="radio" name="sort" value="SATK">特攻
                        <input type="radio" name="sort" value="SDEF">特防
                        <input type="radio" name="sort" value="SPD">速度
                        <input type="radio" name="sort" value="total">總和
                    </div>
                    <br>

                    <input type="submit">
                    <input type="reset">
                </form>

                <div class="result">
                    <?php

                    if(!$_GET)
                    {
                        //echo "歡迎使用查詢系統";
                    }
                    elseif($_GET['pokemon']=="" &&     // ID 不填
                        /* 以下為全部不勾時 */
                        $_GET["fire"] != "on" && $_GET["water"] != "on" &&
                        $_GET["grass"] != "on" && $_GET["thunder"] != "on" &&
                        $_GET["ice"] != "on" && $_GET["superpower"] != "on" &&
                        $_GET["dragon"] != "on" && $_GET["evil"] != "on" &&
                        $_GET["normal"] != "on" && $_GET["wrestle"] != "on" &&
                        $_GET["poison"] != "on" && $_GET["ground"] != "on" &&
                        $_GET["fly"] != "on" && $_GET["bug"] != "on" &&
                        $_GET["rock"] != "on" && $_GET["ghost"] != "on" &&
                        $_GET["steel"] != "on" &&

                        /* 以下為個體質為空時 */
                        $_GET["HP"] =="" &&
                        $_GET["ATK"] =="" &&
                        $_GET["DEF"] =="" &&
                        $_GET["SATK"] =="" &&
                        $_GET["SDEF"] =="" &&
                        $_GET["SPD"] =="" &&
                        $_GET['total']=="" &&

                        $_GET["special"] === "none" &&

                        $_GET["reigon"] === "none" &&

                        $_GET["skill1"] === "none" && $_GET["skill2"] === "none" &&
                        $_GET["skill3"] === "none" && $_GET["skill4"] === "none"

                        )
                    {

                        $str = "SELECT distinct PID,Name,Type_1,Type_2,HP,ATK,DEF,SATK,SDEF,SPD
                                FROM Pokemon";

                        switch ($_GET["sort"]) {
                            case 'PID':
                            $str = $str.' ORDER BY PID ';
                                break;
                            case 'HP':
                            $str = $str.' ORDER BY HP DESC ';
                                break;
                            case 'ATK':
                            $str = $str.' ORDER BY ATK DESC ';
                                break;
                            case 'DEF':
                            $str = $str.' ORDER BY DEF DESC ';
                                break;
                            case 'SATK':
                            $str = $str.' ORDER BY SATK DESC ';
                                break;
                            case 'SDEF':
                            $str = $str.' ORDER BY SDEF DESC ';
                                break;
                            case 'SPD':
                            $str = $str.' ORDER BY SPD DESC ';
                                break;
                            case 'total':
                            $str = $str.' ORDER BY HP + ATK + DEF + SATK + SDEF + SPD DESC ';
                            default:
                                break;
                        }

                        $result = mysql_query($str, $link);

                        echo'
                        <table>
                            <tr>
                                <th>Pokemon ID</th>
                                <th>名字</th>
                                <th>屬性一</th>
                                <th>屬性二</th>
                                <th>HP</th>
                                <th>ATK</th>
                                <th>DEF</th>
                                <th>SATK</th>
                                <th>SDEF</th>
                                <th>SPD</th>
                                <th>Total</th>
                            </tr>

                        ';
                        while ($row = mysql_fetch_array($result)) {
                            echo'
                                <tr>
                                    <td>'.$row["PID"].'</td>
                                    <td>'.$row["Name"].'</td>
                                    <td>'.$row["Type_1"].'</td>
                                    <td>'.$row["Type_2"].'</td>
                                    <td>'.$row["HP"].'</td>
                                    <td>'.$row["ATK"].'</td>
                                    <td>'.$row["DEF"].'</td>
                                    <td>'.$row["SATK"].'</td>
                                    <td>'.$row["SDEF"].'</td>
                                    <td>'.$row["SPD"].'</td>
                                    <td>'.($row["HP"]+$row["ATK"]+$row["DEF"]+$row["SATK"]+$row["SDEF"]+$row["SPD"]).'</td>
                                </tr>
                            ';
                        }
                        echo '</table>';
                    }
                    else {
                        $str = "SELECT distinct PID,Name,Type_1,Type_2,HP,ATK,DEF,SATK,SDEF,SPD
                                FROM Pokemon natural join Ability natural join Item
                                WHERE ";
                        $A = 0;

                        /* 編號選 */
                        if($_GET['pokemon'] != "") {
                            $A = 1;
                            $str = $str.'PID ='.$_GET['pokemon'];
                        }


                        if ($_GET["fire"] === "on" || $_GET["water"] === "on" ||
                            $_GET["grass"] === "on" || $_GET["thunder"] === "on" ||
                            $_GET["ice"] === "on" || $_GET["superpower"] === "on" ||
                            $_GET["dragon"] === "on" || $_GET["evil"] === "on" ||
                            $_GET["normal"] === "on" || $_GET["wrestle"] === "on" ||
                            $_GET["poison"] === "on" || $_GET["ground"] === "on" ||
                            $_GET["fly"] === "on" || $_GET["bug"] === "on" ||
                            $_GET["rock"] === "on" || $_GET["ghost"] === "on" ||
                            $_GET["steel"] === "on"
                            ) {

                            if($A==1) {$str = $str.' AND ';}
                            $A = 1;

                            $B = 0;

                            if($_GET["fire"] == "on")
                            {
                                if($B == 0) {$str = $str.'(';}
                                $A = 1;
                                $B = 1;
                                $str = $str.'Type_1 = \'火\' OR Type_2 = \'火\'';
                            }

                            if($_GET["water"] == "on")
                            {
                                if($B == 0) {$str = $str.'(';}
                                if($B == 1) {$str = $str.' OR ';}
                                $A = 1;
                                $B = 1;
                                $str = $str.'Type_1 = \'水\' OR Type_2 = \'水\'';
                            }

                            if($_GET["grass"] == "on")
                            {
                                if($B == 0) {$str = $str.'(';}
                                if($B == 1) {$str = $str.' OR ';}
                                $A = 1;
                                $B = 1;
                                $str = $str.'Type_1 = \'草\' OR Type_2 = \'草\'';
                            }

                            if($_GET["thunder"] == "on")
                            {
                                if($B == 0) {$str = $str.'(';}
                                if($B == 1) {$str = $str.' OR ';}
                                $A = 1;
                                $B = 1;
                                $str = $str.'Type_1 = \'雷\' OR Type_2 = \'雷\'';
                            }

                            if($_GET["ice"] == "on")
                            {
                                if($B == 0) {$str = $str.'(';}
                                if($B == 1) {$str = $str.' OR ';}
                                $A = 1;
                                $B = 1;
                                $str = $str.'Type_1 = \'冰\' OR Type_2 = \'冰\'';
                            }

                            if($_GET["superpower"] == "on")
                            {
                                if($B == 0) {$str = $str.'(';}
                                if($B == 1) {$str = $str.' OR ';}
                                $A = 1;
                                $B = 1;
                                $str = $str.'Type_1 = \'超\' OR Type_2 = \'超\'';}
                            if($_GET["dragon"] == "on")
                            {
                                if($B == 0) {$str = $str.'(';}
                                if($B == 1) {$str = $str.' OR ';}
                                $A = 1;
                                $B = 1;
                                $str = $str.'Type_1 = \'龍\' OR Type_2 = \'龍\'';
                            }
                            if($_GET["evil"] == "on")
                            {
                                if($B == 0) {$str = $str.'(';}
                                if($B == 1) {$str = $str.' OR ';}
                                $A = 1;
                                $B = 1;
                                $str = $str.'Type_1 = \'惡\' OR Type_2 = \'惡\'';
                            }
                            if($_GET["normal"] == "on")
                            {
                                if($B == 0) {$str = $str.'(';}
                                if($B == 1) {$str = $str.' OR ';}
                                $A = 1;
                                $B = 1;
                                $str = $str.'Type_1 = \'普\' OR Type_2 = \'普\'';
                            }
                            if($_GET["wrestle"] == "on")
                            {
                                if($B == 0) {$str = $str.'(';}
                                if($B == 1) {$str = $str.' OR ';}
                                $A = 1;
                                $B = 1;
                                $str = $str.'Type_1 = \'格\' OR Type_2 = \'格\'';
                            }
                            if($_GET["poison"] == "on")
                            {
                                if($B == 0) {$str = $str.'(';}
                                if($B == 1) {$str = $str.' OR ';}
                                $A = 1;
                                $B = 1;
                                $str = $str.'Type_1 = \'毒\' OR Type_2 = \'毒\'';
                            }
                            if($_GET["ground"] == "on")
                            {
                                if($B == 0) {$str = $str.'(';}
                                if($B == 1) {$str = $str.' OR ';}
                                $A = 1;
                                $B = 1;
                                $str = $str.'Type_1 = \'地\' OR Type_2 = \'地\'';
                            }
                            if($_GET["fly"] == "on")
                            {
                                if($B == 0) {$str = $str.'(';}
                                if($B == 1) {$str = $str.' OR ';}
                                $A = 1;
                                $B = 1;
                                $str = $str.'Type_1 = \'飛\' OR Type_2 = \'飛\'';
                            }
                            if($_GET["bug"] == "on")
                            {
                                if($B == 0) {$str = $str.'(';}
                                if($B == 1) {$str = $str.' OR ';}
                                $A = 1;
                                $B = 1;
                                $str = $str.'Type_1 = \'蟲\' OR Type_2 = \'蟲\'';}
                            if($_GET["rock"] == "on")
                            {
                                if($B == 0) {$str = $str.'(';}
                                if($B == 1) {$str = $str.' OR ';}
                                $A = 1;
                                $B = 1;
                                $str = $str.'Type_1 = \'岩\' OR Type_2 = \'岩\'';
                            }
                            if($_GET["ghost"] == "on")
                            {
                                if($B == 0) {$str = $str.'(';}
                                if($B == 1) {$str = $str.' OR ';}
                                $A = 1;
                                $B = 1;
                                $str = $str.'Type_1 = \'鬼\' OR Type_2 = \'鬼\'';
                            }
                            if($_GET["steel"] == "on")
                            {
                                if($B == 0) {$str = $str.'(';}
                                if($B == 1) {$str = $str.' OR ';}
                                $A = 1;
                                $B = 1;
                                $str = $str.'Type_1 = \'鋼\' OR Type_2 = \'鋼\'';
                            }

                            if($B == 1) $str = $str.')';
                        }


                        if($_GET['HP'] != ""){
                            if($A == 1) $str = $str.' AND ';
                            $A = 1;
                            $str = $str.' HP >= '.$_GET['HP'];
                        }

                        if($_GET['ATK'] != ""){
                            if($A == 1) $str = $str.' AND ';
                            $A = 1;
                            $str = $str.' ATK >= '.$_GET['ATK'];
                        }

                        if($_GET['DEF'] != ""){
                            if($A == 1) $str = $str.' AND ';
                            $A = 1;
                            $str = $str.' DEF >= '.$_GET['DEF'];
                        }

                        if($_GET['SATK'] != ""){
                            if($A == 1) $str = $str.' AND ';
                            $A = 1;
                            $str = $str.' SATK >= '.$_GET['SATK'];
                        }

                        if($_GET['SDEF'] != ""){
                            if($A == 1) $str = $str.' AND ';
                            $A = 1;
                            $str = $str.' SDEF >= '.$_GET['SDEF'];
                        }

                        if($_GET['SPD'] != ""){
                            if($A == 1) $str = $str.' AND ';
                            $A = 1;
                            $str = $str.' SPD >= '.$_GET['SPD'];
                        }

                        if($_GET['total'] != ""){
                            if($A == 1) $str = $str.' AND ';
                            $A = 1;
                            $str = $str.' HP+ATK+DEF+SATK+SDEF+SPD >= '.$_GET['total'];
                        }

                        if($_GET["special"] !== "none")
                        {
                            IF($A==1) $str = $str.' AND ';

                            $A=1;
                            $str = $str.' AID = '.$_GET["special"];
                        }

                        if($_GET["skill1"] !== "none"){
                           if($A==1) $str = $str.' AND ';
                           $A = 1;

                            $str = $str.' PID IN( SELECT PID FROM Pokemon natural join Learn natural join Skill WHERE SID = '.$_GET["skill1"].')';
                        }

                        if($_GET["region"] !== "none"){
                           if($A==1) $str = $str.' AND ';
                           $A = 1;

                            $str = $str.' PID IN(SELECT PID FROM Pokemon natural join Locations natural join Region WHERE RID = '.$_GET["region"].')';
                        }


                        if($_GET["skill2"] !== "none"){
                           if($A==1) $str = $str.' AND ';
                           $A = 1;

                            $str = $str.' PID IN( SELECT PID FROM Pokemon natural join Learn natural join Skill WHERE SID = '.$_GET["skill2"].')';
                        }

                        if($_GET["skill3"] !== "none"){
                           if($A==1) $str = $str.' AND ';
                           $A = 1;

                            $str = $str.' PID IN( SELECT PID FROM Pokemon natural join Learn natural join Skill WHERE SID = '.$_GET["skill3"].')';
                        }

                        if($_GET["skill4"] !== "none"){
                           if($A==1) $str = $str.' AND ';
                           $A = 1;

                            $str = $str.' PID IN( SELECT PID FROM Pokemon natural join Learn natural join Skill WHERE SID = '.$_GET["skill4"].')';
                        }


                        if($A==0) $str = $str.' HP>0 ';
                        switch ($_GET["sort"]) {
                            case 'PID':
                            $str = $str.' ORDER BY PID ';
                                break;
                            case 'HP':
                            $str = $str.' ORDER BY HP DESC ';
                                break;
                            case 'ATK':
                            $str = $str.' ORDER BY ATK DESC ';
                                break;
                            case 'DEF':
                            $str = $str.' ORDER BY DEF DESC ';
                                break;
                            case 'SATK':
                            $str = $str.' ORDER BY SATK DESC ';
                                break;
                            case 'SDEF':
                            $str = $str.' ORDER BY SDEF DESC ';
                                break;
                            case 'SPD':
                            $str = $str.' ORDER BY SPD DESC ';
                                break;
                            case 'total':
                            $str = $str.' ORDER BY HP + ATK + DEF + SATK + SDEF + SPD DESC ';
                            default:
                                break;
                        }

                        //echo $str;



                        $result = mysql_query($str, $link);

                        echo'
                        <table>
                            <tr>
                                <th>Pokemon ID</th>
                                <th>名字</th>
                                <th>屬性一</th>
                                <th>屬性二</th>
                                <th>HP</th>
                                <th>ATK</th>
                                <th>DEF</th>
                                <th>SATK</th>
                                <th>SDEF</th>
                                <th>SPD</th>
                                <th>Total</th>
                            </tr>

                        ';
                        while ($row = mysql_fetch_array($result)) {
                            echo'
                                <tr>
                                    <td>'.$row["PID"].'</td>
                                    <td>'.$row["Name"].'</td>
                                    <td>'.$row["Type_1"].'</td>
                                    <td>'.$row["Type_2"].'</td>
                                    <td>'.$row["HP"].'</td>
                                    <td>'.$row["ATK"].'</td>
                                    <td>'.$row["DEF"].'</td>
                                    <td>'.$row["SATK"].'</td>
                                    <td>'.$row["SDEF"].'</td>
                                    <td>'.$row["SPD"].'</td>
                                    <td>'.($row["HP"]+$row["ATK"]+$row["DEF"]+$row["SATK"]+$row["SDEF"]+$row["SPD"]).'</td>
                                </tr>
                            ';
                        }
                        echo '</table>';

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
