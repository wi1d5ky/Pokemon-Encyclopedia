<?php include "../config.php" ?>

<!DOCTYPE html>
<html lang="tw">
<head>
<meta http-equiv="Content-Type" content="text/html, charset=utf-8" />
<title>神奇寶貝查詢系統 - 所有神奇寶貝</title>
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

                <h2>所有神奇寶貝</h2>

                <div class="result">
                <?php
                    $str = "SELECT distinct PID,Name,Type_1,Type_2,HP,ATK,DEF,SATK,SDEF,SPD
                            FROM Pokemon";
                            $result = mysql_query($str, $link);

                    echo'
                    <table>
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
                            <th style="background:none;border-top:0;border-right:0;"></th>
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
                                <td>
                                    <form action="./detail.php" method="GET">
                                        <input type="hidden" name="PID" value="'.$row["PID"].'">
                                        <input type="submit" value="查看詳情">
                                    </form>
                                </td>
                            </tr>
                        ';
                    }
                    echo '</table>';
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
