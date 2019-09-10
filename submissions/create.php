<?php

error_reporting(E_ALL ^ E_WARNING); 

$serialized_data = json_encode($_POST);
$notifications_recipient = 'SOMEBODYSEMAIL@gmail.com';
$mail_object = <<<EOT
  name: {$_POST['name']}
  title: {$_POST['title']}
  email: {$_POST['email']}
  abstract: {$_POST['abstract']}
  arrival: {$_POST['arrival']}
  departure: {$_POST['departure']}
EOT;

try {
  // Write the contents to the file,
  // using the FILE_APPEND flag to append the content to the end of the file
  // and the LOCK_EX flag to prevent anyone else writing to the file at the same time
  $success = file_put_contents('list.json', $serialized_data.PHP_EOL, FILE_APPEND | LOCK_EX);

  // file_put_contents raises no exceptions on failure but it returns false
  if($success){
    $mail_subject = "[PSSL103-OK] Successful submission from ".$_POST['email'];
    mail($notifications_recipient, $mail_subject, $mail_object);
    header("Location: success.php");
    die();
  } else {
    throw new Exception("file_put_contents unsuccessful");
  }
} catch (Exception $e) {
    $mail_subject = "[PSSL103-KO] Errorful submission from ".$_POST['email'].": ".($e->getMessage());
    mail($notifications_recipient, $mail_subject, $mail_object);
    header("Location: failure.php");
    die();
}

?>