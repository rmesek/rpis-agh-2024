# Zadania oparte są na zbiorze danych  Auto . Należy napisać skrypt w R,
# który znajduje następujące informacje.
# 1. Jakie jest średnie zużycie paliwa ( mpg ) wszystkich samochodów?
# 2. Jakie jest średnie zużycie paliwa samochodów, które mają 4 cylindry?
# 3. Jaka jest mediana wagi ( weight ) wszystkich samochodów?
# 4. Jakie jest średnie zużycie paliwa samochodów wyprodukowanych w roku 72?
# 5. Jaka jest wariancja przyspieszenia ( acceleration ) wszystkich samochodów?
# 6. Jaka jest wariancja przyspieszenia samochodów japońskich ( origin == 3 )?
# 7. Ile jest samochodów, których moc ( horsepower ) jest powyżej średniej?
# 8. Jaka jest maksymalna moc samochodów, których waga jest poniżej średniej?
# 9. Ile jest samochodów, których zużycie paliwa jest poniżej średniej
# (czyli  mpg  jest powyżej średniej)?
# 10. Jaka jest minimalna liczba cylindrów samochodów, których zużycie paliwa
# jest poniżej średniej?
# 11. Ile jest samochodów o maksymalnej pojemności silnika ( displacement )?
# 12. Jakie jest maksymalna waga ( weight ) samochodów, których pojemność
# silnika jest mniejsza od jej mediany?

Auto <- read.table(
  r"(Wprowadzenie do Programowania w R/Auto.data)",
  header = TRUE,
  na.strings = "?",
)
Auto <- na.omit(Auto)
# mpg	cylinders	displacement	horsepower weight	acceleration	year	origin	name
# 18.0 8 307.0 130.0 3504. 12.0 70 1 "chevrolet chevelle malibu"
# 15.0 8 350.0 165.0 3693. 11.5 70 1 "buick skylark 320"


cat("\nZad 1\n")
print(mean(Auto$mpg))

cat("\nZad 2\n")
print(mean(Auto$mpg[Auto$cylinders == 4]))
print(mean(Auto[Auto$cylinders == 4, ]$mpg))

cat("\nZad 3\n")
print(median(Auto$weight))
print(Auto$weight |> median())

cat("\nZad 4\n")
print(mean(Auto$mpg[Auto$year == 72]))

cat("\nZad 5\n")
print(var(Auto$acceleration))

cat("\nZad 6\n")
print(var(Auto$acceleration[Auto$origin == 3]))

cat("\nZad 7\n")
print(sum(Auto$horsepower > mean(Auto$horsepower)))

cat("\nZad 8\n")
print(max(Auto$horsepower[Auto$weight < mean(Auto$weight)]))

cat("\nZad 9\n")
# Odwrotnie do średniego zużycia
print(sum(Auto$mpg > mean(Auto$mpg)))

cat("\nZad 10\n")
print(min(Auto$cylinders[Auto$mpg > mean(Auto$mpg)]))

cat("\nZad 11\n")
print(sum(Auto$displacement == max(Auto$displacement)))

cat("\nZad 12\n")
print(max(Auto$weight[Auto$displacement < median(Auto$displacement)]))
