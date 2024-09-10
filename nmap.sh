#!/bin/bash

# Function to display the figlet banner in blue
display_banner() {
    # Define the color code for blue
    local BLUE='\033[0;34m'
    local RESET='\033[0m'  # Reset to default color

    # Display the figlet banner with blue color
    echo -e "${BLUE}"
    figlet "Nmap Menu"
    echo -e "${RESET}"
}

# Function to display the menu
display_menu() {
    echo -e "What option would you like to use? \n"
    echo -e " [ + ] - 1 - SYN Scan (-sS)"
    echo -e " [ + ] - 2 - TCP Connect Scan (-sT)"
    echo -e " [ + ] - 3 - UDP Scan (-sU)"
    echo -e " [ + ] - 4 - ACK Scan (-sA)"
    echo -e " [ + ] - 5 - Null Scan (-sN)"
    echo -e " [ + ] - 6 - FIN Scan (-sF)"
    echo -e " [ + ] - 7 - Xmas Scan (-sX)"
    echo -e " [ + ] - 8 - Ping Scan (-sP)"
    echo -e " [ + ] - 9 - RPC Scan (-sR)"
    echo -e " [ + ] - 10 - Version Detection (-sV)"
    echo -e " [ + ] - 11 - OS Detection (-O)"
    echo -e " [ + ] - 12 - Aggressive Scan (-A)"
    echo -e " [ + ] - 13 - Scan All Ports (-p-)"
    echo -e " [ + ] - 14 - Scan Specific Port (-p <port>)"
    echo -e " [ + ] - 15 - Timing Template (-T <0-5>)"
    echo -e " [ + ] - 16 - Verbose Output (-v)"
    echo -e " [ + ] - 17 - Debugging Output (-d)"
    echo -e " [ + ] - 18 - Output to Normal File (-oN <file>)"
    echo -e " [ + ] - 19 - Output to XML File (-oX <file>)"
    echo -e " [ + ] - 20 - Output to Grepable File (-oG <file>)"
    echo -e " [ + ] - 21 - Output to All Formats (-oA <file>)"
    echo -e " [ + ] - 22 - Script Scan (--script <script>)"
    echo -e " [ + ] - 23 - Traceroute (--traceroute)"
    echo -e " [ + ] - 24 - No Ping (-Pn)"
    echo -e " [ + ] - 25 - Resolve Hostnames (-R)"
    echo -e " [ + ] - 26 - Input from List (-iL <file>)"
    echo -e " [ + ] - 27 - Random Targets (-iR <number>)"
    echo -e " [ + ] - 28 - IPv6 Scan (-6)"
    echo -e " [ + ] - 29 - Exit"
}

# Function to perform the scan based on user choice
perform_scan() {
    local option=$1
    local target=$2
    local extra=$3
    case $option in
        1)
            echo "Performing SYN Scan on $target..."
            nmap -sS "$target"
            ;;
        2)
            echo "Performing TCP Connect Scan on $target..."
            nmap -sT "$target"
            ;;
        3)
            echo "Performing UDP Scan on $target..."
            nmap -sU "$target"
            ;;
        4)
            echo "Performing ACK Scan on $target..."
            nmap -sA "$target"
            ;;
        5)
            echo "Performing Null Scan on $target..."
            nmap -sN "$target"
            ;;
        6)
            echo "Performing FIN Scan on $target..."
            nmap -sF "$target"
            ;;
        7)
            echo "Performing Xmas Scan on $target..."
            nmap -sX "$target"
            ;;
        8)
            echo "Performing Ping Scan on $target..."
            nmap -sP "$target"
            ;;
        9)
            echo "Performing RPC Scan on $target..."
            nmap -sR "$target"
            ;;
        10)
            echo "Performing Version Detection Scan on $target..."
            nmap -sV "$target"
            ;;
        11)
            echo "Performing OS Detection Scan on $target..."
            nmap -O "$target"
            ;;
        12)
            echo "Performing Aggressive Scan on $target..."
            nmap -A "$target"
            ;;
        13)
            echo "Performing Scan on all ports for $target..."
            nmap -p- "$target"
            ;;
        14)
            read -p "Enter the port number to scan: " port
            echo "Performing Scan on port $port for $target..."
            nmap -p "$port" "$target"
            ;;
        15)
            read -p "Enter the timing template (0-5): " timing
            echo "Performing Scan with timing template $timing for $target..."
            nmap -T "$timing" "$target"
            ;;
        16)
            echo "Performing Verbose Scan on $target..."
            nmap -v "$target"
            ;;
        17)
            read -p "Enter debugging level (e.g., -d, -dd, etc.): " debug
            echo "Performing Debugging Scan with level $debug on $target..."
            nmap $debug "$target"
            ;;
        18)
            read -p "Enter the output file name: " file
            echo "Performing Scan and saving to normal file $file..."
            nmap -oN "$file" "$target"
            ;;
        19)
            read -p "Enter the XML output file name: " file
            echo "Performing Scan and saving to XML file $file..."
            nmap -oX "$file" "$target"
            ;;
        20)
            read -p "Enter the grepable output file name: " file
            echo "Performing Scan and saving to grepable file $file..."
            nmap -oG "$file" "$target"
            ;;
        21)
            read -p "Enter the base file name for all formats: " file
            echo "Performing Scan and saving to all formats with base name $file..."
            nmap -oA "$file" "$target"
            ;;
        22)
            read -p "Enter the script to run: " script
            echo "Performing Script Scan with $script on $target..."
            nmap --script "$script" "$target"
            ;;
        23)
            echo "Performing Traceroute Scan on $target..."
            nmap --traceroute "$target"
            ;;
        24)
            echo "Performing Scan on $target with no ping..."
            nmap -Pn "$target"
            ;;
        25)
            echo "Performing Scan on $target with hostname resolution..."
            nmap -R "$target"
            ;;
        26)
            read -p "Enter the file with target list: " file
            echo "Performing Scan with targets from $file..."
            nmap -iL "$file"
            ;;
        27)
            read -p "Enter the number of random targets to scan: " number
            echo "Performing Scan with $number random targets..."
            nmap -iR "$number"
            ;;
        28)
            echo "Performing IPv6 Scan on $target..."
            nmap -6 "$target"
            ;;
        29)
            echo "Exiting."
            exit 0
            ;;
        *)
            echo "Invalid option. Please try again."
            ;;
    esac

    # Wait for 3 seconds before allowing the user to return to the menu
    sleep 3
    echo "Press Enter to return to the menu..."
    read -r
}

# Check if nmap and figlet are installed
if ! command -v nmap &> /dev/null; then
    echo "nmap is not installed. Please install nmap to use this script."
    exit 2
fi

if ! command -v figlet &> /dev/null; then
    echo "figlet is not installed. Please install figlet to use this script."
    exit 2
fi

# Main script logic
display_banner

echo -n "Enter the target hostname or IP address: "
read target

if [ -z "$target" ]; then
    echo "No target specified. Exiting."
    exit 1
fi

while true; do
    display_menu
    read -p "Enter your choice (1-29): " choice
    perform_scan "$choice" "$target"
done
