Semua Node selain Durin dan Minastir (Contoh: Amandil)
apt-get update
apt-get install -y lynx
lynx http://elendil.k02.com:8001
lynx http://isildur.k02.com:8002
lynx http://anarion.k02.com:8003
image
Semua Node selain Durin dan Minastir (Contoh: Amandil)
#!/bin/bash
# migrate-database.sh - Run di Elendil

echo "=== Database Migration ==="

cd /var/www/resource-laravel-k1

# 1. Test koneksi database
echo "[1] Testing database connection..."
php -r "new PDO('mysql:host=palantir.k02.com;dbname=laravel_db', 'laravel_user', 'laravel_password');" && echo "✓ Connection OK"

# 2. Run migrations
echo ""
echo "[2] Running migrations..."
php artisan migrate --force

# 3. (Optional) Seed data jika ada
echo ""
echo "[3] Seeding data..."
php artisan db:seed --force 2>/dev/null || echo "No seeder found (OK)"

# 4. Verify tables
echo ""
echo "[4] Verifying tables..."
php -r "
\$pdo = new PDO('mysql:host=palantir.k02.com;dbname=laravel_db', 'laravel_user', 'laravel_password');
\$result = \$pdo->query('SHOW TABLES');
echo 'Tables in laravel_db:\n';
foreach(\$result as \$row) {
    echo '  - ' . \$row[0] . '\n';
}
"

# 5. Test API
echo ""
echo "[5] Testing API endpoint..."
curl -s http://localhost:8001/api/airing | python3 -m json.tool 2>/dev/null || curl -s http://localhost:8001/api/airing

echo ""
echo "✓ Migration complete!"
curl http://elendil.k02.com:8001/api/airing
curl http://isildur.k02.com:8002/api/airing
curl http://anarion.k02.com:8003/api/airing