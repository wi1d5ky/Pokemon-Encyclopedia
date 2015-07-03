<?php
    mysql_query("SET NAMES 'UTF8'");
    $property_list = mysql_query("SELECT distinct AID,AName
                            FROM Ability", $link);
    echo '<option value="none">不修改</option>';
    while ($row = mysql_fetch_array($property_list)) {
        echo '<option value="'.$row["AID"].'">'.$row["AID"]." - ".$row["AName"].'</option>';
    }
?>
