<?php
    mysql_query("SET NAMES 'UTF8'");
    $property_list = mysql_query("SELECT distinct SID,SName
                            FROM Skill", $link);
    echo '<option value="none">無</option>';
    while ($row = mysql_fetch_array($property_list)) {
        echo '<option value="'.$row["SID"].'">'.$row["SName"].'</option>';
    }
?>
