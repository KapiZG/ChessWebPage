<?php
    $polaczenie = mysqli_connect("localhost", "root", "", "bd_szachy");

    $polecenieObecnosc = "Select id, Imie, Nazwisko, Klasa from lista_czlonkow";
    $wynikObecnosc = mysqli_query($polaczenie, $polecenieObecnosc);
    
    
    //Dodawanie rekordow do listy obecnosci
    if(!empty($_POST["ZatwierdzenieObecnosci"]))
    {
        echo "Obecność dodana do bazy";

        $a = "Obecni: ";
        $b = "Nieobecni: ";
        foreach($wynikObecnosc as $kolumna)
        {
            if(!empty($_POST[$kolumna["Imie"].$kolumna["Nazwisko"]]))
            {
                $a = $a.$kolumna["Imie"]." ".$kolumna["Nazwisko"]." ".$kolumna["Klasa"].", ";
            }else{
                $b = $b.$kolumna["Imie"]." ".$kolumna["Nazwisko"]." ".$kolumna["Klasa"].", ";
            }
        }
        $insertObecnosc = "Insert into lista_obecnosci value(null,\"".date("Y-m-d")."\",\"".$a.$b."\")";
        mysqli_query($polaczenie, $insertObecnosc);
    }

    //Dodawanie rekordu do wyników turnieju
    if(!empty($_POST["ZatwierdzenieWyniku"]))
    {
        echo "Dodano wynik do bazy";
        $insertWynik = "Insert into turniej1 value(null, \"".$_POST["bialy"]."\",\"".$_POST["wynik"]."\",\"".$_POST["czarny"]."\")";
        mysqli_query($polaczenie, $insertWynik);
    }


    //Lista rozwijana członków
    function listaCzlonkow($kolor)
    {
        $p = mysqli_connect("localhost", "root", "", "bd_szachy");
        $wynik = mysqli_query($p, "Select id, Imie, Nazwisko, Klasa from lista_czlonkow");
        echo "<select name=\"".$kolor."\">";
        foreach($wynik as $kolumna)
        {
            echo "<option value=\"".$kolumna["id"]."\">".$kolumna["Imie"]." ".$kolumna["Nazwisko"]." ".$kolumna["Klasa"]."</option>";
        }
        echo "</select>";
        mysqli_close($p);
    }
?>

<!doctype HTML>
<html>
<head>
    <title>Szachy</title>
    <lint rel="stylesheet" href="Szachy.css" />
</head>
<body>
    <div>
        <h1>Strona Szachowa</h1>
        <table>
            <tr>
                <td>Obecność</td>
                <td>Turniej</td>
            </tr>
        </table>
    </div>
    <!-- Div z listą obecności -->
    <div id="obecnosc">
        <form method="POST" action="Szachy.php">
            <table>
                <?php

                    foreach($wynikObecnosc as $kolumna)
                    {
                        echo "  <tr>
                                    <td> ".$kolumna["Imie"]." ".$kolumna["Nazwisko"]." ".$kolumna["Klasa"]. " </td>
                                    <td> <input type=\"checkbox\" name=\"".$kolumna["Imie"].$kolumna["Nazwisko"]."\" value=\"".$kolumna["id"]."\"> </td>
                                </tr>";                           
                    }
                ?>
            </table>
            <input type="submit" value="Zatwierdź" />
            <input type="hidden" name="ZatwierdzenieObecnosci" value="t" />
        </form>
    <!-- Div z tabelą turnieju -->
    </div>
    <div id="turniej">
        <form method="POST" action="Szachy.php">
            <tabel>
                <tr>
                    <td><?php listaCzlonkow("bialy") ?></td>
                    <td>
                        <select name="wynik">
                            <option value="1-0">1-0</option>
                            <option value="0-1">0-1</option>
                            <option value="0.5-0.5">0.5-0.5</option>
                        </select>
                    </td>
                    <td><?php listaCzlonkow("czarny") ?></td>
                </tr>
            </table>
            <input type="submit" value="Zatwierdź" />
            <input type="hidden" name="ZatwierdzenieWyniku" value="t" />
        <form>
    </div>  
</body>
</html>
<?php 
    mysqli_close($polaczenie);
?>