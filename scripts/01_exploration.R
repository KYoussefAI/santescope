# Exploration du fichier annuel sur l'incidence hospitaliere des AVC
# Placer le fichier CSV telecharge dans data/avc_annual.csv

fichier <- "data/avc_annual.csv"

if (!file.exists(fichier)) {
  stop("Fichier introuvable. Placer le CSV dans data/avc_annual.csv")
}

avc <- read.csv(fichier, sep = ";", stringsAsFactors = FALSE)

cat("Nombre de lignes :", nrow(avc), "\n")
cat("Nombre de colonnes :", ncol(avc), "\n\n")

cat("Noms des colonnes :\n")
print(names(avc))

cat("\nPremieres lignes :\n")
print(head(avc))

cat("\nTypes des colonnes :\n")
str(avc)

cat("\nValeurs manquantes :\n")
print(colSums(is.na(avc)))
