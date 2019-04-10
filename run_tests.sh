command -v python3.7 >/dev/null 2>&1 || { echo >&2 "I require python3.7 but it's not installed.  Aborting."; exit 1; }
command -v pip3.7 >/dev/null 2>&1 || { echo >&2 "I require pip3.7 but it's not installed.  Aborting."; exit 1; }
command -v vim >/dev/null 2>&1 || { echo >&2 "I require vim but it's not installed.  Aborting."; exit 1; }
