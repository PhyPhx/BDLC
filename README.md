# BDLC – Big Data Lab Cluster Projektarbeit

Dieses Repository enthält die Projektarbeit im Modul **BDLC – Big Data Lab Cluster**. Analysiert wurden die **NYC Yellow Taxi Trip Records** der Jahre **2015 bis 2021**.

Ziel der Arbeit war es, einen kleinen Hadoop-/Spark-Cluster aufzubauen, die Daten ins HDFS zu laden, aufzubereiten, zu bereinigen und anschliessend zwei Fragestellungen zu analysieren:

1. Wann ist die Nachfrage nach Yellow-Taxis in New York am höchsten?
2. Gibt es Unterschiede im Trinkgeldverhalten je nach Tageszeit und Wochentag?

## Repository-Struktur

```text
.
├── data_sample/
├── doc/
├── notebooks/
├── results/
├── scripts/
└── README.md
```

## Ordnerübersicht

### `data_sample/`

Enthält kleine Auszüge der Rohdaten und der bereinigten Daten.

Die CSV-Dateien dienen dazu, die Daten einfach anzuschauen. Die Parquet-Samples wurden genutzt, um die Analyse-Notebooks zuerst mit einer kleineren Datenmenge zu testen.

Die vollständigen Rohdaten sind **nicht** im Repository enthalten.

### `scripts/`

Enthält die Downloader-Skripte für die Taxi-Daten.

- `downloader.sh`: lädt die monatlichen Yellow-Taxi-Dateien herunter
- `downloader_missing_2021.sh`: lädt fehlende 2021-Dateien nach, falls beim Download leere Dateien entstanden sind

Die Daten wurden zuerst lokal gespeichert und danach in HDFS hochgeladen.

### `notebooks/`

Enthält alle Jupyter Notebooks der Verarbeitungsschritte.

Die wichtigsten Schritte sind:

1. **Data Exploration**  
   Erste Untersuchung der Rohdaten, Schema-Vergleich und Prüfung auf Auffälligkeiten.

2. **Preprocessing**  
   Auswahl relevanter Spalten, Vereinheitlichung der Datentypen und Berechnung zusätzlicher Felder.

3. **Data Quality**  
   Bereinigung unplausibler Werte wie falsche Zeitstempel, negative Beträge, unrealistische Distanzen oder Geschwindigkeiten.

4. **Analysis**  
   Analyse der beiden Research Questions mit dem vollständigen bereinigten Datensatz.

### `results/`

Enthält die erzeugten Ergebnisse der Analyse.

```text
results/
├── prototype/
└── final/
```

- `prototype/`: Ergebnisse aus Tests mit Data Samples
- `final/`: finale Ergebnisse mit dem vollständigen bereinigten Datensatz

In den Unterordnern befinden sich sowohl Grafiken als auch die zugrunde liegenden aggregierten Tabellen.

### `doc/`

Enthält die finale Dokumentation der Projektarbeit.

## Datenfluss

Die vollständigen Daten wurden im HDFS verarbeitet. Der Datenfluss war:

```text
/taxi/raw → /taxi/prepared → /taxi/clean → results/final
```

- `/taxi/raw`: unveränderte Rohdaten
- `/taxi/prepared`: vereinheitlichte und vorbereitete Daten
- `/taxi/clean`: bereinigter Datensatz für die Analyse
- `results/final`: finale Analyseergebnisse im Git-Repository

## Hinweise zur Reproduzierbarkeit

Die vollständige Analyse kann über die Notebooks nachvollzogen werden.

Da der vollständige Datensatz sehr gross ist, liegt er nicht im Repository. Mit den Skripten im Ordner `scripts/` kann der Datensatz erneut heruntergeladen werden.

Für schnelle Tests können die Data Samples im Ordner `data_sample/` verwendet werden.
