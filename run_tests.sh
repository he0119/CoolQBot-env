if command -v python3.7 >/dev/null; then
    echo "Python3.7 exist!";
else
    echo "Python3.7 does not exist!";
    exit 1;
fi

if command -v pip3.7 >/dev/null; then
    echo "pip3.7 exist!";
else
    echo "pip3.7 does not exist!";
    exit 1;
fi

if command -v vim >/dev/null; then
    echo "vim exist!";
else
    echo "vim does not exist!";
    exit 1;
fi
