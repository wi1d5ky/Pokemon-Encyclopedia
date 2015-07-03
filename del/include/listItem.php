<?php
    mysql_query("SET NAMES 'UTF8'");
    $property_list = mysql_query("SELECT distinct IID,IName
                            FROM Item", $link);
    while ($row = mysql_fetch_array($property_list)) {
        if($row["IID"] == 0) continue;
        echo '<option value="'.$row["IID"].'">'.$row["IName"].'</option>';
    }
?>
