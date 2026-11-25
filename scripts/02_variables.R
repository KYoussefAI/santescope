# Quelques reperes sur le fichier des AVC

fichier <- "data/avc_annual.csv"

if (!file.exists(fichier)) {
  stop("Fichier introuvable : data/avc_annual.csv")
}

avc <- read.csv(fichier, sep = ";", stringsAsFactors = FALSE,
                colClasses = c(dep = "character", reg = "character"))

colonnes <- c("annee", "dep", "libgeo", "sexe", "cage6",
              "ischa_c_mique_1_ha_c_morragique_0")
if (!all(colonnes %in% names(avc))) {
  stop("Certaines colonnes attendues sont absentes.")
}

cat("Periode couverte :",
    min(avc$annee), "-", max(avc$annee), "\n")
cat("Departements differents :", length(unique(avc$dep)), "\n\n")

cat("Lignes par annee :\n")
print(table(avc$annee))

cat("\nRepartition des lignes par sexe :\n")
print(table(avc$sexe))

cat("\nGroupes d'age presents :\n")
print(table(avc$cage6))

cat("\nTypes d'AVC codes dans le fichier (0/1) :\n")
print(table(avc$ischa_c_mique_1_ha_c_morragique_0))

cat("\nExemples de departements :\n")
print(head(sort(unique(avc$libgeo)), 12))

cat("\nNombre de codes de departement manquants :",
    sum(is.na(avc$dep) | avc$dep == ""), "\n")
