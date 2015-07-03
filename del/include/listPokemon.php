<?php
    $property_list = mysql_query("SELECT distinct PID,Name
                            FROM Pokemon", $link);
    while ($row = mysql_fetch_array($property_list)) {
        echo '<option value="'.$row["PID"].'">'.$row["Name"].'</option>';
    }
?>
