<?php include "../config.php" ?>

<!DOCTYPE html>
<html lang="tw">
<head>
<meta http-equiv="Content-Type" content="text/html, charset=utf-8" />
<title>神奇寶貝查詢系統 - 所有招式</title>
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

                <h2>所有招式</h2>

                <div class="result">
                <?php
                    $str = "SELECT distinct  SID, SName, SType, SPowerPoint, SBasePower, SAccuracy, SEffect, SSpeedPriority
                            FROM Skill";
                            $result = mysql_query($str, $link);

                    echo'
                    <table>
                        <tr>
                            <th>SID</th>
                            <th>SName</th>
                            <th>SType</th>
                            <th>SPowerPoint</th>
                            <th>SBasePower</th>
                            <th>SAccuracy</th>
                            <th>SEffect</th>
                            <th>SSpeedPriority</th>
                        </tr>

                    ';
                    while ($row = mysql_fetch_array($result)) {
                        echo'
                            <tr>
                                <td>'.$row["SID"].'</td>
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
