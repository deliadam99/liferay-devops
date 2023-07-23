if ! command -v docker &> /dev/null; then
    echo "Installing Docker..."
    if ! curl -fsSL https://get.docker.com | sh; then
        echo "Failed to install Docker. Aborting."
        exit 1
    fi
    sudo usermod -aG docker $USER
    echo "Docker installed successfully."
else
    echo "Docker is already installed."
fi

if ! command -v docker-compose &> /dev/null; then
    echo "Installing Docker Compose..."
    if ! sudo apt update && sudo apt install -y docker-compose; then
        echo "Failed to install Docker Compose. Aborting."
        exit 1
    fi
    echo "Docker Compose installed successfully."
else
    echo "Docker Compose is already installed."
fi