#!/bin/bash

CREDENTIAL_FILE="$HOME/.github_credentials"

# Funktion zum Speichern der Zugangsdaten
save_credentials() {
  read -p "GitHub Username: " GITHUB_USER
  read -s -p "GitHub Token (not shown): " GITHUB_TOKEN
  echo
  echo "${GITHUB_USER}:${GITHUB_TOKEN}" | base64 > "$CREDENTIAL_FILE"
  chmod 600 "$CREDENTIAL_FILE"
  echo "✅ Credentials saved in $CREDENTIAL_FILE"
}

# Funktion zum Laden der Zugangsdaten
load_credentials() {
  if [ ! -f "$CREDENTIAL_FILE" ]; then
    echo "❌ No credentials found."
    save_credentials
  fi
  CREDS=$(base64 -d "$CREDENTIAL_FILE")
  GITHUB_USER=$(echo "$CREDS" | cut -d: -f1)
  GITHUB_TOKEN=$(echo "$CREDS" | cut -d: -f2-)
}

# Funktion zum Klonen eines privaten Repos
clone_repo() {
  read -p "Organisation/Repo (e.g. mycompany/project): " REPO
  load_credentials
  git clone "https://${GITHUB_USER}:${GITHUB_TOKEN}@github.com/${REPO}.git"
}

# Hauptmenü
echo "🔐 GitHub Auth-Skript"
select choice in "Save login" "Clone repo" "Exit"; do
  case $choice in
    "Save login") save_credentials ;;
    "Clone repo") clone_repo ;;
    "Exit") exit ;;
    *) echo "Unknown choice" ;;
  esac
done
