<?php
declare(strict_types = 1);
$pdo = require 'includes/database-connection.php';
require 'includes/functions.php';

$title       = 'Digital Travel Guide';
$description = 'Explore breathtaking destinations across Asia, Africa, Europe, and Antarctica.';
$section     = 0;

$navigation = pdo($pdo, 'SELECT id, name FROM category WHERE navigation = 1 ORDER BY id;')->fetchAll();

// Fetch the 6 most recent published destinations for homepage 3x2 grid
$destinations = pdo($pdo, 'SELECT a.id, a.title, a.summary, a.created,
                                   c.id   AS category_id,
                                   c.name AS category,
                                   i.file AS image_file,
                                   i.alt  AS image_alt
                            FROM   article a
                              JOIN category c ON a.category_id = c.id
                              LEFT JOIN image i ON a.image_id = i.id
                            WHERE  a.published = 1
                            ORDER  BY a.created DESC
                            LIMIT  6;')->fetchAll();
?>
<?php include 'includes/header.php'; ?>

    <!-- Hero Banner: upload header-banner.jpg to /img/ (landscape 1400x500px recommended) -->
    <div class="hero-banner">
      <div class="container">
        <h1>Discover the World</h1>
        <p>Handpicked destinations across every continent</p>
      </div>
    </div>

    <main id="content">
      <div class="container">

        <div class="header">
          <h1>Featured Destinations</h1>
        </div>

        <!-- 3 x 2 Destination Grid — image is NOT a link -->
        <div class="grid">
          <?php foreach ($destinations as $dest) { ?>
          <article class="summary">
            <div class="card-img-wrap">
              <?php if ($dest['image_file']) { ?>
                <img src="uploads/<?= html_escape($dest['image_file']) ?>"
                     alt="<?= html_escape($dest['image_alt']) ?>">
              <?php } else { ?>
                <img src="img/blank.png" alt="No image available">
              <?php } ?>
              <span class="card-badge"><?= html_escape($dest['category']) ?></span>
            </div>
            <p><b><?= html_escape($dest['title']) ?></b></p>
            <p><?= html_escape($dest['summary']) ?></p>
            <p class="date"><?= format_date($dest['created']) ?></p>
          </article>
          <?php } ?>
        </div><!-- /.grid 3x2 -->

      </div>
    </main>

<?php include 'includes/footer.php'; ?>
