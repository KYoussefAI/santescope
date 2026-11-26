# Preparation des donnees annuelles pour les analyses par age et sexe

fichier <- "data/avc_annual.csv"
if (!file.exists(fichier)) {
  stop("Fichier introuvable : data/avc_annual.csv")
}

avc <- read.csv(fichier, sep = ";", stringsAsFactors = FALSE,
                colClasses = c(dep = "character", reg = "character"))

colonnes <- c("annee", "dep", "libgeo", "reglib", "sexe", "cage6",
              "n_hosp", "population", "taux_incidence",
              "ischa_c_mique_1_ha_c_morragique_0")
if (!all(colonnes %in% names(avc))) {
  stop("Colonnes attendues absentes du fichier.")
}

# L'etude porte sur les adultes. On garde les tranches d'age distinctes.
ages <- c("18-44 ans", "45-64 ans", "65-74 ans",
          "75-84 ans", "85 ans et plus")
if (any(!avc$cage6 %in% c("00-17 ans", ages))) {
  stop("Tranche d'age non reconnue.")
}

adultes <- avc[avc$cage6 %in% ages, ]
names(adultes)[names(adultes) ==
  "ischa_c_mique_1_ha_c_morragique_0"] <- "type_avc_code"

if (any(!adultes$type_avc_code %in% c(0, 1))) {
  stop("Code de type d'AVC non reconnu.")
}

adultes$type_avc <- ifelse(adultes$type_avc_code == 1,
                           "ischemique", "hemorragique")

# Chaque ligne reste un groupe departement/annee/sexe/age/type.
# Les taux ne sont pas additionnes entre groupes.
cles <- c("annee", "dep", "sexe", "cage6", "type_avc_code")
if (any(duplicated(adultes[cles]))) {
  stop("Doublons dans les donnees preparees.")
}

dir.create("data/processed", recursive = TRUE, showWarnings = FALSE)
write.csv(adultes, "data/processed/avc_adultes.csv",
          row.names = FALSE, fileEncoding = "UTF-8")

cat("Lignes du fichier initial :", nrow(avc), "\n")
cat("Lignes adultes :", nrow(adultes), "\n")
cat("Annees :", min(adultes$annee), "-", max(adultes$annee), "\n")
cat("Departements :", length(unique(adultes$dep)), "\n")
cat("Fichier : data/processed/avc_adultes.csv\n")
