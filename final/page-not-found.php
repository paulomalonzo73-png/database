<?php
http_response_code(404);
$title       = 'Page Not Found - Digital Travel Guide';
$description = 'Page not found.';
$section     = 0;
if (!isset($navigation)) {
    $navigation = pdo($pdo, 'SELECT id, name FROM category WHERE navigation = 1 ORDER BY id;')->fetchAll();
}
?>
<?php include 'includes/header.php'; ?>

    <main id="content">
      <div class="container">
        <div class="header">
          <h1>Page Not Found</h1>
          <p>Sorry, the page you were looking for could not be found.</p>
        </div>
        <p style="text-align:center;"><a href="index.php" class="btn">Back to Home</a></p>
      </div>
    </main>

<?php include 'includes/footer.php'; ?>
