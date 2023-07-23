if ! command -v docker &> /dev/null; then
    echo "Installing Docker..."
    if ! curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg | sh; then
        echo "Failed to install Docker. Aborting."
        exit 1
    fi
	echo "deb [signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
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