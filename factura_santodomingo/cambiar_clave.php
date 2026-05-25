<?php
define("HOST_SS", "localhost");
define("DATABASE_SS", "santodomingo");
define("USER_SS", "root");
define("PASSWORD_SS", "");

$usuario    = 'admin';
$nueva_clave = '123456';
$hash = sha1($nueva_clave);

try {
    $pdo = new PDO(
        "mysql:host=" . HOST_SS . ";dbname=" . DATABASE_SS . ";charset=utf8",
        USER_SS,
        PASSWORD_SS,
        [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]
    );

    $stmt = $pdo->prepare("SELECT usuario_id, usuario, nombres FROM usuarios WHERE usuario = :usuario LIMIT 1");
    $stmt->execute([':usuario' => $usuario]);
    $user = $stmt->fetch(PDO::FETCH_ASSOC);

    if (!$user) {
        echo "❌ Usuario '$usuario' no encontrado.\n";
        exit(1);
    }

    $upd = $pdo->prepare("UPDATE usuarios SET clave = :clave WHERE usuario_id = :id");
    $upd->execute([':clave' => $hash, ':id' => $user['usuario_id']]);

    echo "✅ Contraseña actualizada correctamente.\n";
    echo "   Usuario : {$user['usuario']}\n";
    echo "   ID      : {$user['usuario_id']}\n";
    echo "   Hash SHA1: $hash\n";

} catch (Exception $e) {
    echo "❌ Error: " . $e->getMessage() . "\n";
    exit(1);
}
