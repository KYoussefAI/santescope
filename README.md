# SantéScope

Projet personnel d'exploration des données de santé publique : les accidents vasculaires cérébraux (AVC) en France.

## Objectif

Décrire les différences d'incidence hospitalière des AVC entre les départements français chez les adultes, à partir des taux standardisés sur l'âge et le sexe (2021–2023).

Une analyse complémentaire portera sur les données par âge et par sexe. Le projet est descriptif : il ne cherche pas à établir les causes des écarts observés ni à prédire le risque individuel.

## Données

- [Santé publique France — Incidence hospitalière des AVC par département](https://odisse.santepubliquefrance.fr/explore/assets/accident-vasculaire-cerebral-incidence-hospitaliere-dep/)
- [Santé publique France — Taux standardisés par département](https://odisse.santepubliquefrance.fr/explore/assets/maladies-cardio-neuro-vasculaires-taux-standardises-dep/)
- [Limites administratives des départements au 1er janvier 2024](https://www.data.gouv.fr/datasets/departements-administratifs-au-1er-janvier-2024)

Les données de santé utilisées sont des données publiques agrégées. Les taux sont repris des sources officielles ; les valeurs absentes ne sont pas assimilées à des zéros.

## Démarche

- Comprendre les indicateurs et les métadonnées.
- Reproduire les contrôles de qualité et l'analyse descriptive avec R.
- Comparer et visualiser les taux départementaux.
- Rédiger une synthèse des résultats et de leurs limites.

## État du projet

Un prototype assisté par IA a déjà été développé et exécuté dans le dépôt privé `santescope-lab` le 22 novembre 2026. Ce dépôt est consacré à la reprise, à la compréhension et à la validation progressive de ce travail. Les étapes de vérification personnelle ne sont pas considérées comme terminées tant qu'elles n'ont pas été réalisées.

Ce projet est pédagogique et ne constitue pas un outil clinique.
