<?php
    $property_list = mysql_query("SELECT distinct SID,SName
                            FROM Skill", $link);
    while ($row = mysql_fetch_array($property_list)) {
        echo '<option value="'.$row["SID"].'">'.$row["SName"].'</option>';
    }
?>
