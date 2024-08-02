# Zadania oparte są na zbiorze danych  precip  z biblioteki standardowej R ( ?precip ). Znajdź następujące
# informacje.
# 1. Jaka jest średnia i mediana opadów w rejestrowanych miastach?
# 2. Jaka jest wariancja i odchylenie standardowe opadów?
# 3. Jaki jest rozstęp opadów? [Uwaga: standardowa funkcja  range()  nie liczy wprost rozstępu tylko
# wektor dwuelementowy zawierający minimum i maksimum].
# 4. Jaki jest rozstęp międzykwartylowy? Porównaj wynik uzyskany przy pomocy funkcji  IQR()  ( ?IQR ) z
# wynikiem uzyskanym (jak na wykładzie) przy pomocy funkcji  fivenum()  ( ?fivenum ).
# 5. Jakie jest odchylenie przeciętne od średniej? Jakie jest odchylenie przeciętne od mediany?
# 6. Jaki jest poziom opadów w miastach, których nazwa zaczyna się na “M” ( ?startsWith )?
# 7. W których miastach opady są równe średniej?
# 8. W których miastach opady różnią się od mediany nie więcej niż 0.5 cala?
# 9. W którym mieście opady są najmniejsze, a w którym największe?
# 10. Ile jest miast z opadami powyżej średniej?
# 11. W których miastach opady leżą powyżej górnego kwartyla?
# 12. W których miastach opady leżą poniżej dolnego kwartyla?
# 13. Narysuj histogram rozkładu. Jakie wnioski na temat rozkładu można z niego wyciągnąć?
# 14. Narysuj wykres pudełkowy rozkładu. Jakie z niego płyną wnioski? Które miasta stanowią wartości
# odstające na wykresie pudełkowym ( ?boxplot ,  ?boxplot.stats )?

cat("\nZad 1\n")
print(c(mean(precip), median(precip)))

cat("\nZad 2\n")
print(c(var(precip), sd(precip)))

cat("\nZad 3\n")
print(diff(range(precip)))

cat("\nZad 4\n")
print(IQR(precip))
print(fivenum(precip))
print(precip["Pittsburg"])
print(fivenum(precip)[4] - fivenum(precip)[2])
print(quantile(precip, c(0.25, 0.75)))

cat("\nZad 5\n")
print(mean(abs(precip - mean(precip))))
print(mean(abs(precip - median(precip))))

cat("\nZad 6\n")
print(precip[startsWith(names(precip), "M")])

cat("\nZad 7\n")
print(names(precip[precip == mean(precip)]))

cat("\nZad 8\n")
print(names(precip[abs(precip - median(precip)) <= 0.5]))

cat("\nZad 9\n")
print(names(precip[precip == min(precip)]))
print(names(precip[precip == max(precip)]))

cat("\nZad 10\n")
print(length(precip[precip > mean(precip)]))
print(sum(precip > mean(precip)))

cat("\nZad 11\n")
print(names(precip[precip > quantile(precip, 0.75)]))

cat("\nZad 12\n")
print(names(precip[precip < quantile(precip, 0.25)]))

cat("\nZad 13\n")
hist(precip)

cat("\nZad 14\n")
boxplot(precip)
