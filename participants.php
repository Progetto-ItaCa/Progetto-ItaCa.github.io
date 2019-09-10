<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en"> 
<head>
<link rel="stylesheet" type="text/css" href="sakura.css">
<meta charset="UTF-8">
</head>
<body>

<center>
<?php include("title.html"); ?>
<?php include("header.html"); ?>

<?php
$list = file('list.json') or die("Unable to open list.json!");

$names = array(
	"Mathieu Anel",
	"Peter Arndt",
	"John Bourke",
	"Ingo Blechschmidt",
	"Ivan Di Liberti",
	"Christian Espindola",
	"Moritz Groth",
	"Simon Henry",
	"Eric Faber",
	"Martti Karvonen",
	"Micheal Lieberman",
	"Fosco Loregian",
    // "Fernando Lucatelli Nuñes",
	"Giuseppe Metere",
	"François Renaud",
	"Jiří Rosický",
	"Pedro Zambrano"
);

foreach ($list as &$entry) {
    array_push($names, json_decode($entry)->{'name'});
}

$names = array_unique($names);

function sort_by_last_word($a, $b) {
    $words_a = explode(' ', $a);
    $words_b = explode(' ', $b);
    $last_a = array_pop($words_a);
    $last_b = array_pop($words_b);
    return strcmp($last_a, $last_b);
}

usort($names, "sort_by_last_word");

?>

<ul style="column-count:3; list-style:none;">
<?php
foreach ($names as &$name) {
    echo "<li>".$name."</li>";
}
?>
</ul>
<hr>

<?php include("footer.html"); ?>

</center>
</body>
</html>
