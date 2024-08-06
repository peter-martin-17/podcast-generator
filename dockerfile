FROM ubuntu:latest

# Update package lists and install dependencies
RUN apt-get update && apt-get install -y \
  python3.10 \
  python3-pip \
  git \
  libyaml-dev \
  && apt-get clean

# Install PyYAML with verbose output
RUN pip3 install --no-cache-dir -v pyyaml

# Verify PyYAML installation
RUN python3.10 -c "import yaml; print(yaml.__version__)"

# Copy feed.py to the container
COPY feed.py /usr/bin/feed.py

# Copy entrypoint.sh to the container
COPY entrypoint.sh /entrypoint.sh

# Ensure entrypoint.sh has execution permissions
RUN chmod +x /entrypoint.sh

# Define the entry point
ENTRYPOINT ["/entrypoint.sh"]