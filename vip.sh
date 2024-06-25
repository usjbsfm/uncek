#!/bin/bash

# Fungsi untuk menampilkan efek loading
loading() {
    echo -ne 'Loading.\r'
    sleep 0.5
    echo -ne 'Loading..\r'
    sleep 0.5
    echo -ne 'Loading...\r'
    sleep 0.5
    echo -ne '           \r'
}

# Fungsi untuk menampilkan efek typing
typing() {
    local text="$1"
    for ((i=0; i<${#text}; i++)); do
        echo -n "${text:$i:1}"
        sleep 0.05
    done
    echo
}

# Menampilkan loading
loading

# Menggunakan figlet untuk menampilkan teks
echo "UNCHECK PREMIUM BY LAWWSTORE"

# Menampilkan informasi satu per satu
typing "DATE : $(date)"
typing "SCRIPT TYPE : VIP"
typing "OWNER : lawwstoreid"

# Membersihkan layar
sleep 1
clear

# Mendapatkan data dari raw github
raw_url="https://raw.githubusercontent.com/usjbsfm/uncek/main/1.txt" # Ganti dengan URL raw GitHub Anda

# Mengambil data dari raw github
data=$(curl -s "$raw_url")

# Fungsi untuk mengubah data menjadi format yang diinginkan
convert_data() {
    local line="$1"
    IFS=':' read -r email password <<< "$line"
    echo "USER/EMAIL : $email"
    echo "PASSWORD   : $password"
}

# Fungsi untuk memilih data acak
get_random_data() {
    echo "$data" | shuf -n 1
}

# Menampilkan data secara acak dan meminta input
while true; do
    clear
    random_line=$(get_random_data)
    convert_data "$random_line"
    typing "LANJUT KETIK Y : "
    read -n 1 -s -r input
    if [[ "$input" != "Y" && "$input" != "y" ]]; then
        break
    fi
done
