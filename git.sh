#!/bin/bash

# Funkcja wyświetlająca dzisiejszą datę
show_date() {
    echo "Dzisiejsza data: $(date)"
}

# Funkcja tworząca plik .gitignore
create_gitignore() {
    echo "*.log" > .gitignore
    echo "Plik .gitignore został utworzony."
}

# Funkcja tworząca pliki log
create_logs() {
    local num_files=${1:-100}
    for ((i=1; i<=$num_files; i++)); do
        echo "Nazwa pliku: log$i.txt" > log$i.txt
        echo "Nazwa skryptu: $0" >> log$i.txt
        echo "Data utworzenia: $(date)" >> log$i.txt
    done
    echo "Utworzono $num_files plików log."
}

# Funkcja wyświetlająca pomoc
show_help() {
    echo "Dostępne opcje:"
    echo "--date (-d) : Wyświetla dzisiejszą datę."
    echo "--logs (-l) [liczba] : Tworzy pliki log. Domyślnie 100."
    echo "--gitignore : Tworzy plik .gitignore ignorujący pliki z rozszerzeniem .log."
    echo "--help (-h) : Wyświetla pomoc."
}

# Główna część skryptu
case "$1" in
    "--date" | "-d")
        show_date
        ;;
    "--logs" | "-l")
        create_logs "$2"
        ;;
    "--gitignore")
        create_gitignore
        ;;
    "--help" | "-h")
        show_help
        ;;
    *)
        echo "Nieznana opcja. Użyj --help, aby uzyskać pomoc."
        exit 1
        ;;
esac

exit 0
