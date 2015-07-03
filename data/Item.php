<?php include "../config.php" ?>

<!DOCTYPE html>
<html lang="tw">
<head>
<meta http-equiv="Content-Type" content="text/html, charset=utf-8" />
<title>神奇寶貝查詢系統 - 所有道具</title>
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

                <h2>所有道具</h2>

                <div class="result">
                <?php
                    $str = "SELECT distinct IID, IName, IPercentage
                            FROM Item";
                            $result = mysql_query($str, $link);

                    echo'
                    <table>
                        <tr>
                            <th>道具編號</th>
                            <th>道具名稱</th>
                            <th>出現機率</th>
                        </tr>

                    ';
                    while ($row = mysql_fetch_array($result)) {
                        //if($row["IID"] == 0) continue;

                        echo'
                            <tr>
                                <td>'.$row["IID"].'</td>
                                <td>'.$row["IName"].'</td>
                                <td>'.$row["IPercentage"].'</td>
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
