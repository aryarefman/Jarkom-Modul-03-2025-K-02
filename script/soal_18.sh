Palantir
#!/bin/bash
set -euo pipefail

echo "=============================================="
echo "  [PALANTIR] Setup Master MariaDB"
echo "=============================================="
echo ""

# --- Network config ---
echo "[1/6] Network Configuration..."
ip addr flush dev eth0 || true
ip addr add 192.212.4.3/24 dev eth0
ip link set eth0 up
ip route replace default via 192.212.4.1
echo "nameserver 192.168.122.1" > /etc/resolv.conf
echo "✓ Network OK"
echo ""

# --- Prepare MariaDB folders ---
echo "[2/6] Prepare MariaDB directories..."
mkdir -p /var/run/mysqld /var/log/mysql
chown -R mysql:mysql /var/run/mysqld /var/log/mysql /var/lib/mysql
echo "✓ Directories OK"
echo ""

# --- Kill old MariaDB ---
echo "[3/6] Stop old MariaDB processes..."
pkill -9 mariadbd 2>/dev/null || true
pkill -9 mysqld_safe 2>/dev/null || true
sleep 3
echo "✓ Old processes stopped"
echo ""

# --- Start MariaDB Master WITHOUT PASSWORD FIRST ---
echo "[4/6] Starting MariaDB Master (init mode)..."
mariadbd --user=mysql \
  --datadir=/var/lib/mysql \
  --socket=/var/run/mysqld/mysqld.sock \
  --bind-address=0.0.0.0 \
  --skip-grant-tables \
  --server-id=1 \
  --log-bin=/var/log/mysql/mysql-bin.log &

sleep 5
echo "✓ MariaDB Master started (init mode)"
echo ""

# --- Setup root password FIRST ---
echo "[5/6] Setup root password..."
mysql -u root <<EOF
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY 'root123';
FLUSH PRIVILEGES;
EOF

echo "✓ Root password set"
echo ""

# --- Restart MariaDB with normal mode ---
echo "[6/6] Restarting MariaDB in normal mode..."
pkill -9 mariadbd
sleep 3

mariadbd --user=mysql \
  --datadir=/var/lib/mysql \
  --socket=/var/run/mysqld/mysqld.sock \
  --bind-address=0.0.0.0 \
  --server-id=1 \
  --log-bin=/var/log/mysql/mysql-bin.log &

sleep 5
echo "✓ MariaDB restarted"
echo ""

# --- NOW we can use password ---
MYSQL="mysql -u root -proot123"

# --- Setup database & replication user ---
echo "[7/7] Setup database & replication user..."
$MYSQL <<EOF
DROP DATABASE IF EXISTS laravel_db;
CREATE DATABASE laravel_db;

USE laravel_db;

-- Create test table
CREATE TABLE test (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert initial data
INSERT INTO test (nama) VALUES
    ('Elendil'),
    ('Isildur'),
    ('Anarion');

-- Drop replication user if exists
DROP USER IF EXISTS 'repl'@'%';

-- Create replication user
CREATE USER 'repl'@'%' IDENTIFIED BY 'repl123';
GRANT REPLICATION SLAVE ON *.* TO 'repl'@'%';

-- Create laravel_user if not exists
DROP USER IF EXISTS 'laravel_user'@'%';
CREATE USER 'laravel_user'@'%' IDENTIFIED BY 'laravel_password';
GRANT ALL PRIVILEGES ON laravel_db.* TO 'laravel_user'@'%';

FLUSH PRIVILEGES;
EOF

echo "✓ Database & users created"
echo ""

# --- Show Master Status ---
echo "=============================================="
echo "  ⚠️  MASTER STATUS (CATAT INI!)  ⚠️"
echo "=============================================="
$MYSQL -e "SHOW MASTER STATUS;"
echo ""

echo "=============================================="
echo "  ✅ PALANTIR (MASTER) SIAP!"
echo "=============================================="
echo ""
echo "PENTING: Catat nilai berikut untuk Narvi:"
echo "  - File: (kolom pertama)"
echo "  - Position: (kolom kedua)"
echo "=============================================="
Narvi
#!/bin/bash
set -euo pipefail

echo "=============================================="
echo "  [NARVI] Setup Slave MariaDB"
echo "=============================================="
echo ""

# ⚠️ GANTI NILAI INI SESUAI OUTPUT TERBARU DARI PALANTIR! ⚠️
MASTER_LOG_FILE="mysql-bin.000008"
MASTER_LOG_POS=2294

echo "⚠️  Master Info dari Palantir:"
echo "  MASTER_LOG_FILE: $MASTER_LOG_FILE"
echo "  MASTER_LOG_POS: $MASTER_LOG_POS"
echo ""
read -p "Tekan ENTER untuk melanjutkan atau CTRL+C untuk membatalkan..."
echo ""

# --- Network config ---
echo "[1/6] Network Configuration..."
ip addr flush dev eth0 || true
ip addr add 192.212.4.4/24 dev eth0
ip link set eth0 up
ip route replace default via 192.212.4.1
echo "nameserver 192.168.122.1" > /etc/resolv.conf
echo "✓ Network OK"
echo ""

# --- Prepare MariaDB folders ---
echo "[2/6] Prepare MariaDB directories..."
mkdir -p /var/run/mysqld /var/log/mysql
chown -R mysql:mysql /var/run/mysqld /var/log/mysql /var/lib/mysql
echo "✓ Directories OK"
echo ""

# --- Kill old MariaDB ---
echo "[3/6] Stop old MariaDB processes..."
pkill -9 mariadbd 2>/dev/null || true
pkill -9 mysqld_safe 2>/dev/null || true
sleep 3
echo "✓ Old processes stopped"
echo ""

# --- Start MariaDB Slave ---
echo "[4/6] Starting MariaDB Slave..."
mariadbd --user=mysql \
  --datadir=/var/lib/mysql \
  --socket=/var/run/mysqld/mysqld.sock \
  --bind-address=0.0.0.0 \
  --server-id=2 &

sleep 5
echo "✓ MariaDB Slave started"
echo ""

# --- Configure Slave & Import Database (WITH PASSWORD) ---
echo "[5/6] Configure Slave replication & Import database..."
mysql -u root -proot123 <<'EOF'
-- Stop slave if running
STOP SLAVE;
RESET SLAVE ALL;

-- Create and import database from Master
DROP DATABASE IF EXISTS laravel_db;
CREATE DATABASE laravel_db;
USE laravel_db;

-- Create table structure
CREATE TABLE `test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Insert initial data from Master
INSERT INTO `test` VALUES
(1,'Elendil','2025-11-01 08:45:45'),
(2,'Isildur','2025-11-01 08:45:45'),
(3,'Anarion','2025-11-01 08:45:45');

-- Configure Master connection
CHANGE MASTER TO
  MASTER_HOST='192.212.4.3',
  MASTER_USER='repl',
  MASTER_PASSWORD='repl123',
  MASTER_LOG_FILE='mysql-bin.000008',
  MASTER_LOG_POS=2294,
  MASTER_PORT=3306;

-- Start replication
START SLAVE;

-- Show slave status
SHOW SLAVE STATUS\G
EOF

sleep 2
echo "✓ Replication configured & database imported"
echo ""

# --- Verify Database ---
echo "[6/6] Verify database import..."
mysql -u root -proot123 <<'EOF'
SHOW DATABASES;
USE laravel_db;
SHOW TABLES;
SELECT * FROM test;
EOF
echo ""

# --- Check Slave Status ---
echo "=============================================="
echo "  SLAVE STATUS"
echo "=============================================="
mysql -u root -proot123 -e "SHOW SLAVE STATUS\G" | grep -E "Running|Error|Master_Log|Seconds_Behind"
echo ""

echo "=============================================="
echo "  ✅ NARVI (SLAVE) SIAP!"
echo "=============================================="
echo ""
echo "Periksa status di atas:"
echo "  ✓ Slave_IO_Running: Yes"
echo "  ✓ Slave_SQL_Running: Yes"
echo "  ✓ Seconds_Behind_Master: 0"
echo ""
echo "Database laravel_db sudah diimport dengan tabel test"
echo ""
echo "Test replikasi:"
echo "  1. Buat tabel baru di Palantir"
echo "  2. Cek apakah muncul di Narvi"
echo "=============================================="