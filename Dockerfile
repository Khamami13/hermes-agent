FROM nousresearch/hermes-agent:latest

USER root

ENV DEBIAN_FRONTEND=noninteractive
ENV VIRTUAL_ENV=/opt/netops-venv
ENV PATH="/opt/netops-venv/bin:$PATH"

RUN apt-get update && apt-get install -y --no-install-recommends \
    openssh-client \
    sshpass \
    curl \
    wget \
    dnsutils \
    iputils-ping \
    netcat-openbsd \
    traceroute \
    mtr-tiny \
    jq \
    ca-certificates \
    git \
    nano \
    vim-tiny \
    python3 \
    python3-pip \
    python3-venv \
    python3-dev \
    build-essential \
    libssl-dev \
    libffi-dev \
    iproute2 \
    net-tools \
    telnet \
    whois \
    snmp \
    snmpd \
    snmptrapd \
    tftp-hpa \
    lftp \
    expect \
    tcpdump \
    httpie \
    chromium \
    chromium-driver \
    fonts-noto \
    fonts-noto-color-emoji \
    fonts-liberation \
    && rm -rf /var/lib/apt/lists/*

RUN python3 -m venv /opt/netops-venv && \
    pip install --no-cache-dir --upgrade pip setuptools wheel && \
    pip install --no-cache-dir \
    paramiko \
    netmiko \
    napalm \
    scrapli \
    ncclient \
    pysnmp \
    textfsm \
    ntc-templates \
    jinja2 \
    pyyaml \
    requests \
    httpx \
    routeros-api \
    librouteros \
    rich \
    typer \
    beautifulsoup4 \
    pandas \
    openpyxl \
    playwright \
    scrapy \
    lxml \
    selectolax \
    selenium \
    advertools \
    tldextract \
    rapidfuzz \
    dateparser

RUN python -m playwright install chromium

WORKDIR /opt/data

USER root
