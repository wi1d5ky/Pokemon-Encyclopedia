<?php include "../config.php" ?>

<!DOCTYPE html>
<html lang="tw">
<head>
<meta http-equiv="Content-Type" content="text/html, charset=utf-8" />
<title>神奇寶貝查詢系統 - 神奇寶貝詳情</title>
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

                <h2>神奇寶貝詳情</h2>

                <div class="result">
<?php

                $result = mysql_query("SELECT * FROM Pokemon WHERE PID = ".$_GET["PID"]);
                while ($row = mysql_fetch_array($result)) {
                    echo '<table>
                            <tr>
                                <th>神奇寶貝編號</th>
                                <th>名字</th>
                                <th>屬性一</th>
                                <th>屬性二</th>
                                <th>HP</th>
                                <th>攻擊力</th>
                                <th>防禦力</th>
                                <th>特攻</th>
                                <th>特防</th>
                                <th>速度</th>
                                <th>總和</th>
                            </tr>
                            <tr>
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
                        </table><br>
                    ';
                }

                $result = mysql_query("SELECT AName, AEffect FROM Pokemon natural join Ability WHERE PID = ".$_GET["PID"]);
                while ($row = mysql_fetch_array($result)) {
                    echo '<table>
                            <tr>
                                <th>特性名稱</th>
                                <th>特性效果</th>
                            </tr>
                            <tr>
                            <tr>
                                <td>'.$row["AName"].'</td>
                                <td>'.$row["AEffect"].'</td>
                            </tr>
                        </table><br>
                    ';
                }

                $result = mysql_query("SELECT IName, IPercentage FROM Pokemon natural join Item WHERE PID = ".$_GET["PID"]);
                while ($row = mysql_fetch_array($result)) {
                    echo '<table>
                            <tr>
                                <th>道具名稱</th>
                                <th>出現機率</th>
                            </tr>
                            <tr>
                            <tr>
                                <td>'.$row["IName"].'</td>
                                <td>'.$row["IPercentage"].'</td>
                            </tr>
                        </table><br>
                    ';
                }

                $result = mysql_query("SELECT LAtLevel, SName, SType, SPowerPoint,
                                                SBasePower, SAccuracy, SEffect, SSpeedPriority
                                        FROM Pokemon natural join Learn natural join Skill
                                        WHERE PID = ".$_GET["PID"]);
                    echo '<table>
                            <tr>
                                <th>學會的等級</th>
                                <th>招式名稱</th>
                                <th>招式類型</th>
                                <th>威力</th>
                                <th>攻擊力</th>
                                <th>命中率</th>
                                <th>效果</th>
                                <th>速度優先度</th>
                            </tr>';
                while ($row = mysql_fetch_array($result)) {
                    echo '
                            <tr>
                                <td>'.$row["LAtLevel"].'</td>
                                <td>'.$row["SName"].'</td>
                                <td>'.$row["SType"].'</td>
                                <td>'.$row["SPowerPoint"].'</td>
                                <td>'.$row["SBasePower"].'</td>
                                <td>'.$row["SAccuracy"].'</td>
                                <td>'.$row["SEffect"].'</td>
                                <td>'.$row["SSpeedPriority"].'</td>
                            </tr>
                    ';
                }
                echo '</table><br>';


                $result = mysql_query("SELECT RName, RDescribe
                                        FROM Pokemon natural join Locations natural join Region
                                        WHERE PID = ".$_GET["PID"]);

                echo '<table>
                        <tr>
                            <th>區域名稱</th>
                            <th>區域描述</th>
                        </tr>';
                while ($row = mysql_fetch_array($result)) {
                    echo '<tr>
                            <td>'.$row["RName"].'</td>
                            <td>'.$row["RDescribe"].'</td>
                        </tr>

                    ';
                }
                echo '</table><br>';

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
