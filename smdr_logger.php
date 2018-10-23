#!/usr/local/bin/php -q
<?php
error_reporting(E_ALL);
/* Позволяет скрипту ожидать соединения бесконечно. */
set_time_limit(0);
/* Включает скрытое очищение вывода так, что мы видим данные
 * как только они появляются. */
ob_implicit_flush();
//---------------CDR Server-------------
$address = '192.168.X.XX';
$port = 60010;
//---------------MYSQL 
global $host = '192.168.X.XX';// где name_host - название вашего хоста.
global $database = 'avaya_cdr';// где name_DB - название нужной базы данных.
global $user = 'smdr';// где name_user имя пользователя с root правами.
global $password = 'XXXXX';// где pass пароль от пользователя с root правами.

function parse_CDR_and_insert_to_DB($parseString) 
{
	$cdr = explode(",", $parseString);
	$CallStart = $cdr[0];
    $ConnectedTime = $cdr[1];
    $RingTime = $cdr[2];
    $Caller = $cdr[3];
    $Direction = $cdr[4];
    $CalledNumber = $cdr[5];
    $DialledNumber = $cdr[6];
    $Account = $cdr[7];
    $IsInternal = $cdr[8];
    $CallID = $cdr[9];
    $Continuation = $cdr[10];
    $Party1Device = $cdr[11];
    $Party1Name = $cdr[12];
    $Party2Device = $cdr[13];
    $Party2Name = $cdr[14];
    $HoldTime = $cdr[15];
    $ParkTime = $cdr[16];
    $AuthValid = $cdr[17];
    $AuthCode = $cdr[18];
    $UserCharged = $cdr[19];
    $CallCharge = $cdr[20];
    $Currency = $cdr[21];
    $AmountatLastUserChange = $cdr[22];
    $CallUnits = $cdr[23];
    $UnitsatLastUserChange = $cdr[24];
    $CostperUnit = $cdr[25];
    $MarkUp = $cdr[26];
    $ExternalTargetingCause = $cdr[27];
    $ExternalTargeterId = $cdr[28];
    $ExternalTargetedNumber = $cdr[29];
	
// выполняем подключение к серверу
$link = mysqli_connect($host, $user, $password, $database) or die("Ошибка подключения " . mysqli_error($link));
$link->set_charset("utf8");
// выполняем различные операции с базой данных
$query = "insert into ".$database." set ".
                  "CallStart = '".$CallStart."',".
                  "ConnectedTime = ".$ConnectedTime.",".
                  "RingTime = '".$RingTime."',".
                  "Caller = '".$Caller."',".
                  "Direction = '".$Direction."',".
                  "CalledNumber = '".$CalledNumber."',".
                  "DialledNumber = '".$DialledNumber."',".
                  "Account = '".$Account."',".
                  "IsInternal = ".$IsInternal.",".
                  "CallID = ".$CallID.",".
                  "Continuation = ".$Continuation.",".
                  "Party1Device = '".$Party1Device."',".
                  "Party1Name = '".$Party1Name."',".
                  "Party2Device = '".$Party2Device."',".
                  "Party2Name = '".$Party2Name."',".
                  "HoldTime = ".$HoldTime.",".
                  "ParkTime = ".$ParkTime.",".
                  "AuthValid = '".$AuthValid."',".
                  "AuthCode = '".$AuthCode."',".
                  "UserCharged = '".$UserCharged."',".
                  "CallCharge = '".$CallCharge."',".
                  "Currency = '".$Currency."',".
                  "AmountatLastUserChange = '".$AmountatLastUserChange."',".
                  "CallUnits = '".$CallUnits."',".
                  "UnitsatLastUserChange = '".$UnitsatLastUserChange."',".
                  "CostperUnit = '".$CostperUnit."',".
                  "MarkUp = '".$MarkUp."',".
                  "ExternalTargetingCause = '".$ExternalTargetingCause."',".
                  "ExternalTargeterId = '".$ExternalTargeterId."',".
                  "ExternalTargetedNumber = '".$ExternalTargetedNumber."'";
$result = mysqli_query($link, $query) or die("Ошибка " . mysqli_error($link));
echo "Запись в БД произведена.";
}

if (($sock = socket_create(AF_INET, SOCK_STREAM, SOL_TCP)) === false) {
    echo "Не удалось выполнить socket_create(): причина: " . socket_strerror(socket_last_error()) . "\n";
}

if (socket_bind($sock, $address, $port) === false) {
    echo "Не удалось выполнить socket_bind(): причина: " . socket_strerror(socket_last_error($sock)) . "\n";
}

if (socket_listen($sock, 5) === false) {
    echo "Не удалось выполнить socket_listen(): причина: " . socket_strerror(socket_last_error($sock)) . "\n";
}

do {
    if (($msgsock = socket_accept($sock)) === false) {
        echo "Не удалось выполнить socket_accept(): причина: " . socket_strerror(socket_last_error($sock)) . "\n";
        break;
    }
    /* Отправляем инструкции. */
    do {
        if (false === ($buf = socket_read($msgsock, 2048, PHP_NORMAL_READ))) {
            echo "Не удалось выполнить socket_read(): причина: " . socket_strerror(socket_last_error($msgsock)) . "\n";
            break 2;
        }
        if (!$buf = trim($buf)) {
            continue;
        }
        if ($buf == 'выход') {
            break;
        }
        if ($buf == 'выключение') {
            socket_close($msgsock);
            break 2;
        }
		//-----------------Парсим строку и записываем в БД
		parse_CDR_and_insert_to_DB($buf);
		//-------------------------------------------------
      //  socket_write($msgsock, $talkback, strlen($talkback));
     //   echo "$buf\n";
    } while (true);
    socket_close($msgsock);
} while (true);


socket_close($sock);
?>
