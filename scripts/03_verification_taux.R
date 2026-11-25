# Verification des taux d'incidence du fichier annuel AVC

fichier <- "data/avc_annual.csv"

if (!file.exists(fichier)) {
  stop("Fichier introuvable : data/avc_annual.csv")
}

avc <- read.csv(fichier, sep = ";", stringsAsFactors = FALSE,
                colClasses = c(dep = "character"))

colonnes <- c("annee", "dep", "sexe", "cage6",
              "ischa_c_mique_1_ha_c_morragique_0",
              "n_hosp", "population", "taux_incidence")

if (!all(colonnes %in% names(avc))) {
  stop("Colonnes necessaires absentes du fichier.")
}

cat("Nombre de lignes :", nrow(avc), "\n")

# Un taux est calcule pour 100 000 habitants du groupe concerne.
population_invalide <- is.na(avc$population) | avc$population <= 0
cat("Populations absentes ou nulles :", sum(population_invalide), "\n")

if (any(population_invalide)) {
  stop("Impossible de verifier les taux avec ces populations.")
}

taux_calcule <- avc$n_hosp / avc$population * 100000
ecart <- abs(taux_calcule - avc$taux_incidence)

cat("Plus grand ecart entre taux calcule et taux publie :",
    max(ecart), "\n")
cat("Lignes avec un ecart superieur a 0,000001 :",
    sum(is.na(ecart) | ecart > 0.000001), "\n")

# Une ligne correspond a un an, un departement, un sexe,
# une tranche d'age et un type d'AVC.
cles <- c("annee", "dep", "sexe", "cage6",
          "ischa_c_mique_1_ha_c_morragique_0")
cat("Doublons sur ces colonnes :", sum(duplicated(avc[cles])), "\n")

cat("\nExemples de calcul :\n")
print(data.frame(
  annee = head(avc$annee, 5),
  dep = head(avc$dep, 5),
  taux_publie = round(head(avc$taux_incidence, 5), 2),
  taux_calcule = round(head(taux_calcule, 5), 2)
))

if (any(is.na(ecart)) || any(ecart > 0.000001) ||
    any(duplicated(avc[cles]))) {
  stop("Les controles ont revele des ecarts a examiner.")
}
