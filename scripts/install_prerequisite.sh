if [[ "$OSTYPE" == "linux-gnu" ]]; then
    echo "Installing Linux prerequisites..."
    swift package edit Suit
    bash Packages/Suit/install_dependencies_ubuntu.sh
elif [[ "$OSTYPE" == "darwin"* ]]; then
    echo "No prerequisite needed"
else
    echo "Error: Unsupported platform"
fi