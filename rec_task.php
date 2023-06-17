<?php

$conn = mysqli_connect('localhost', 'root', '', 'nbp'); //polaczenie z baza

//przewalutowanie
if(isset($_POST['sum']) && !empty($_POST['from'])!="" && !empty($_POST['to'])!=""){
    $from_currency = $_POST['from'];
    $to_currency = $_POST['to'];
    //wyciagniecie danych o walucie z ktorej chcemy przewalutowac
    $sql = "select exchange_rate, code from currencies where id=".$from_currency.";";
    $result = mysqli_query($conn, $sql);
    $row = mysqli_fetch_array($result);
    $from_exchange_rate = $row['exchange_rate'];
    $from_code = $row['code'];
    //wyciagniecie danych o walucie na ktora chcemy przewalutowac
    $sql = "select exchange_rate, code from currencies where id=".$to_currency.";";
    $result = mysqli_query($conn, $sql);
    $row = mysqli_fetch_array($result);
    $to_exchange_rate = $row['exchange_rate'];
    $to_code = $row['code'];
    //obliczenie sumy pienieznej w docelowej walucie
    $balance = $_POST['sum']*$from_exchange_rate/$to_exchange_rate;
    WriteNewBalance($_POST['sum'], $balance, $from_code, $to_code);
    //wstawienie przewalutowania do tabeli currency_conversions
    $sql = "insert into  currency_conversions values (NULL, ".$from_currency.", ".$to_currency.", ".$_POST['sum'].", ".$balance.");";
    mysqli_query($conn,$sql);
    
}
//funkcja tworzaca wiadomosc
function WriteNewBalance($amount, $balance, $from_currency_code, $to_currency_code){
    $text_to_display = round($amount, 2)." ".$from_currency_code." to ".round($balance, 2)." ".$to_currency_code;
    alert($text_to_display);
}
//funkcja wyswietlajaca wiadomosc
function alert($alert_msg){
    echo("<script type='text/javascript'> var answer = alert('".$alert_msg."'); </script>");

    $answer = "<script type='text/javascript'> document.write(answer); </script>";
    return($answer);
}
?>
<html>
<head>
    <title> Zadanie rekrutacyjne </title>
    <style>
        table{
            text-align: center;
            font-size: 110%;
            width: 100%;
        }
        form{
            width: 100%;
            text-align: center;
            font-size: 110%;
        }
        header{
            width: 100%;
            height: 10%;
            text-align: center;
            font-size: 200%;
        }
    </style>
</head>
<body>
    <header>
        Zadanie rekrutacyjne
    </header>
    <!-- Formularz przewalutowujacy -->
    <form action="zadanie_nbp.php" method="post">
        kwota: <input type="number" name="sum"><br><br>
        waluta zrodlowa: <select name="from">
                            <option value="" selected disabled hidden>Wybierz walute...</option>
                            <?php
                                $sql = "select id, full_name, code from currencies";
                                $result = mysqli_query($conn, $sql);
                                //petla wypisujaca liste rozwijana ze wszystkimi walutami
                                while($row = mysqli_fetch_array($result)){
                                    $from_currency = $row['id'];
                                    echo "<option value='".$from_currency."'>".$row['full_name']."(".$row['code'].")</option>";
                                }
                            ?>
                        </select><br><br>
        waluta docelowa: <select name="to">
                            <option value="" selected disabled hidden>Wybierz walute...</option>
                            <?php
                                $sql = "select id, full_name, code from currencies";
                                $result = mysqli_query($conn, $sql);
                                //petla wypisujaca liste rozwijana ze wszystkimi walutami
                                while($row = mysqli_fetch_array($result)){
                                    $to_currency=$row['id'];
                                    echo "<option value='".$to_currency."'>".$row['full_name']."(".$row['code'].")</option>";
                                }
                            ?>
                        </select><br><br>
        <button type="submit">OBLICZ</button><br>
    </form>
    <br>
    <?php
    
    /* 
    do stworzenia wszystkich rekordow jednorazowo uzylem
    "replace into currencies (code, full_name, exchange_rate) values ('".$row['code']."', '".$row['currency']."', ".$row['mid'].");"
    i zamienilem to na update, bo przy uzyciu replace na wszystkie rekordy tylko po to zeby sie "odswiezyly" dziala ono jak truncate i niepotrzebnie zwieksza 'id'
    */
    
    function set_currency_data_tab_a($conn){
        $data_tab = json_decode(file_get_contents('https://api.nbp.pl/api/exchangerates/tables/a/'), true) or die ('Nie udalo sie znalezc pliku API NBP'); //przypisuje zawartosc pliku xml do tablicy
        foreach ($data_tab[0]['rates'] as $row) {
            $sql = "update currencies set exchange_rate=".$row['mid']." where code='".$row['code']."';";
            mysqli_query($conn, $sql) or die ('Nie udalo sie zaktualizowac danych walut z tabeli a'); //uaktualnia kursy walut z tabeli a
        }
    }
    function set_currency_data_tab_b($conn){
        $data_tab = json_decode(file_get_contents('https://api.nbp.pl/api/exchangerates/tables/b/'), true) or die ('Nie udalo sie znalezc pliku API NBP');
        foreach ($data_tab[0]['rates'] as $row) {
            $sql = "update currencies set exchange_rate=".$row['mid']." where code='".$row['code']."';";
            mysqli_query($conn, $sql) or die ('Nie udalo sie zaktualizowac danych walut z tabeli b'); //uaktualnia kursy walut z tabeli b
        }
    }
    function set_currency_data_tab_c($conn){
        $data_tab = json_decode(file_get_contents('https://api.nbp.pl/api/exchangerates/tables/c/'), true) or die ('Nie udalo sie znalezc pliku API NBP');
        foreach ($data_tab[0]['rates'] as $row) {
            $sql = "update currencies set bid=".$row['bid'].", ask=".$row['ask']." where code='".$row['code']."';";
            mysqli_query($conn, $sql) or die ('Nie udalo sie zaktualizowac danych walut z tabeli c'); //uaktualnia ceny sprzedazy i zakupu walut z tabeli c
        }
    }
    function create_table($conn){
        $sql = "select code, full_name, exchange_rate, bid, ask from currencies;";
        $result = mysqli_query($conn, $sql);
        //tworzenie naglowkow oraz tabeli
        if(mysqli_num_rows($result) > 0){
            echo "<table border=1>
                <tr>
                    <th>Kod Waluty</th>
                    <th>Waluta</th>
                    <th>Kurs sredni</th>
                    <th>Kurs kupna</th>
                    <th>Kurs sprzedazy</th>
                </tr>";
            //wpisywanie walut do tabeli
            while($row = mysqli_fetch_array($result)){ //tworzy tabele z walutami
                echo "<tr>";
                echo "<td>".$row['code']."</td>";
                echo "<td>".$row['full_name']."</td>";
                echo "<td>".$row['exchange_rate']."</td>";
                echo "<td>".$row['bid']."</td>";
                echo "<td>".$row['ask']."</td>";
                echo "</tr>";
                }
            echo "</table>";
        
        }
    }
    if($conn){
        set_currency_data_tab_a($conn);
        set_currency_data_tab_b($conn);
        set_currency_data_tab_c($conn);
        create_table($conn);
    }
    else{
        echo "Nie udalo sie polaczyc z baza danych";
    }
    mysqli_close($conn);
    ?>
</body>
</html>
