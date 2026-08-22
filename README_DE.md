# Terraform Projektvorlage

Eine einsteigerfreundliche Terraform-Projektvorlage, die zeigt, wie ein Terraform-Projekt in der Praxis strukturiert werden kann.

Der Fokus liegt auf dem Erlernen von Terraform und der HashiCorp Configuration Language (HCL) anhand von vier Azure-Ressourcen: Resource Group, VNet, Subnet und Storage Account.

## Was Du Lernen Kannst

Dieses Repository zeigt:

- Wie Terraform-Projekte typischerweise aufgebaut sind
- Warum Terraform-Code auf mehrere Dateien verteilt wird
- Wie Variablen verwendet werden
- Wie Locals doppelte Konfigurationen vermeiden
- Wie Outputs Informationen zurückgeben
- Wie Umgebungen getrennt konfiguriert werden können
- Wie Terraform Backends konfiguriert werden
- Wie eine Resource Group, ein VNet, ein Subnet und ein Storage Account zusammenhängen

## Für Wen Ist Dieses Repository Gedacht?

Dieses Projekt richtet sich an:

- Terraform-Einsteiger
- Studenten und Selbstlerner
- Cloud Engineers mit ersten Berührungspunkten zu Infrastructure as Code
- Alle, die den Aufbau von Terraform-Projekten verstehen möchten

## Projektstruktur

```text
.
├── config
│   ├── nrod.backend.hcl
│   ├── nprod.tfvars
│   ├── prod.backend.hcl
│   └── prod.tfvars
│
├── backend.tf
├── data.tf
├── locals.tf
├── main.tf
├── outputs.tf
├── provider.tf
├── terraform.tf
├── terraform.tfvars
├── variables.tf
└── README.md
```

## Erklärung der Dateien

### terraform.tf

Enthält Terraform-Einstellungen und Versionsvorgaben.

Typische Inhalte:

- Terraform-Version
- Benötigte Provider

Warum gibt es diese Datei?

Damit alle Nutzer mit den gleichen Terraform- und Provider-Versionen arbeiten.

---

### provider.tf

Definiert den verwendeten Cloud Provider.

Beispiele:

- AzureRM
- AWS
- Google

Warum gibt es diese Datei?

Die Trennung verbessert die Übersichtlichkeit und erleichtert das Auffinden von Provider-Konfigurationen.

---

### variables.tf

Definiert die Eingabevariablen des Projekts.

Beispiele:

- location
- environment
- project_name

Warum gibt es diese Datei?

Variablen verhindern fest codierte Werte und erhöhen die Wiederverwendbarkeit.

---

### terraform.tfvars

Enthält konkrete Werte für Variablen.

Warum gibt es diese Datei?

Die Konfiguration wird von der eigentlichen Implementierung getrennt.

---

### locals.tf

Definiert wiederverwendbare Werte und Berechnungen.

Beispiele:

- Namenskonventionen
- Präfixe
- Tags

Warum gibt es diese Datei?

Locals reduzieren Wiederholungen und machen den Code lesbarer.

---

### data.tf

Diese Datei bleibt als Erweiterungspunkt für spätere Data Sources erhalten. Das aktuelle Beispiel benötigt keine bestehenden Azure-Ressourcen.

---

### main.tf

Enthält die eigentlichen Infrastruktur-Ressourcen.

Warum gibt es diese Datei?

Hier wird die Infrastruktur definiert, die Terraform verwalten soll.

---

### outputs.tf

Definiert Werte, die Terraform nach der Bereitstellung zurückliefert.

Beispiele:

- Ressourcen-IDs
- Namen
- Endpunkte

Warum gibt es diese Datei?

Outputs stellen wichtige Informationen für Benutzer und andere Terraform-Konfigurationen bereit.

---

### backend.tf

Definiert den Speicherort des Terraform State.

Beispiele:

- Azure Storage Account
- S3 Bucket
- Terraform Cloud

Warum gibt es diese Datei?

Der Terraform State ist die zentrale Wissensbasis von Terraform und sollte in Teamumgebungen zentral gespeichert werden.

## Environment-Konfiguration

Der Ordner `config` enthält umgebungsspezifische Konfigurationsdateien.

Beispielumgebungen:

- Non-Production (NP)
- Production (PR)

Dadurch kann derselbe Terraform-Code für mehrere Umgebungen wiederverwendet werden.

### nprod.backend.hcl

Backend-Konfiguration für Non-Production.

### nprod.tfvars

Variablenwerte für die Non-Production Umgebung.

### prod.backend.hcl

Backend-Konfiguration für Production.

### prod.tfvars

Variablenwerte für die Production Umgebung.

## Terraform ausführen

Für die Anmeldung wird die lokale Azure CLI verwendet:

```bash
az login
```

Das Beispiel erstellt genau vier Azure-Ressourcen. Ein Storage Account liegt technisch nicht innerhalb eines VNets. Der Zugriff wird mit einem `Microsoft.Storage`-Service Endpoint und Storage-Network-Rules auf das Subnet begrenzt. Private Endpoint, Private DNS und Hub-Peering sind nicht Bestandteil dieses Beispiels.

Für einen lokalen Einstieg:

```bash
terraform init -backend=false
terraform validate
terraform plan -refresh=false -var-file="./config/nprod.tfvars"
```

Für eine Bereitstellung mit lokalem State:

Terraform initialisieren:

```bash
terraform init -reconfigure -backend=false
```

Konfiguration prüfen:

```bash
terraform validate
```

Deployment Plan erstellen:

```bash
terraform plan \
  -var-file="./config/nprod.tfvars"
```

Deployment durchführen:

```bash
terraform apply \
  -var-file="./config/nprod.tfvars"
```

`backend.tf` und die Dateien unter `config/` bleiben als optionales Beispiel für ein bereits vorhandenes Azure Storage Backend erhalten. Das Backend selbst wird nicht durch dieses Beispiel erstellt.

## Wichtiger Hinweis

Terraform lädt automatisch alle `.tf`-Dateien innerhalb eines Verzeichnisses.

Die Aufteilung in:

- variables.tf
- locals.tf
- data.tf
- main.tf
- outputs.tf

ist technisch nicht erforderlich.

Sie dient ausschließlich einer besseren Lesbarkeit, Wartbarkeit und Zusammenarbeit.

## Lizenz

MIT License