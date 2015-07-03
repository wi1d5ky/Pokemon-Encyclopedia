<?php
/*
    $property = ['火', '水', '草', '雷', '冰', '超', '龍', '惡',
    '普', '格', '毒', '地', '飛', '蟲', '岩', '鬼', '鋼'];

    for ($i=0; $i < $property.length ; $i++) {
        echo '<input type="checkbox" id="property" name="'.$property[$i].'"<?php echo $_GET["'.$property[$i].'"]?" checked":"";?>>'.$property[$i].';
    }

 */?>


<input type="checkbox" id="property" name="fire"<?php echo $_GET["fire"]?" checked":"";?>>火
<input type="checkbox" id="property" name="water"<?php echo $_GET["water"]?" checked":"";?>>水
<input type="checkbox" id="property" name="grass"<?php echo $_GET["grass"]?" checked":"";?>>草
<input type="checkbox" id="property" name="thunder"<?php echo $_GET["thunder"]?" checked":"";?>>雷
<input type="checkbox" id="property" name="ice"<?php echo $_GET["ice"]?" checked":"";?>>冰
<input type="checkbox" id="property" name="superpower"<?php echo $_GET["superpower"]?" checked":"";?>>超
<input type="checkbox" id="property" name="dragon"<?php echo $_GET["dragon"]?" checked":"";?>>龍
<input type="checkbox" id="property" name="evil"<?php echo $_GET["evil"]?" checked":"";?>>惡 <br>
<input type="checkbox" id="property" name="normal"<?php echo $_GET["normal"]?" checked":"";?>>普
<input type="checkbox" id="property" name="wrestle"<?php echo $_GET["wrestle"]?" checked":"";?>>格
<input type="checkbox" id="property" name="poison"<?php echo $_GET["poison"]?" checked":"";?>>毒
<input type="checkbox" id="property" name="ground"<?php echo $_GET["ground"]?" checked":"";?>>地
<input type="checkbox" id="property" name="fly"<?php echo $_GET["fly"]?" checked":"";?>>飛
<input type="checkbox" id="property" name="bug"<?php echo $_GET["bug"]?" checked":"";?>>蟲
<input type="checkbox" id="property" name="rock"<?php echo $_GET["rock"]?" checked":"";?>>岩
<input type="checkbox" id="property" name="ghost"<?php echo $_GET["ghost"]?" checked":"";?>>鬼
<input type="checkbox" id="property" name="steel"<?php echo $_GET["steel"]?" checked":"";?>>鋼
