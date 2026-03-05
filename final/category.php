<?php
declare(strict_types = 1);
$pdo = require 'includes/database-connection.php';
require 'includes/functions.php';

$id = filter_input(INPUT_GET, 'id', FILTER_VALIDATE_INT);
if (!$id) {
    include 'page-not-found.php';
    exit;
}

$category = pdo($pdo, 'SELECT id, name, description FROM category WHERE id = :id;',
                [':id' => $id])->fetch();

if (!$category) {
    include 'page-not-found.php';
    exit;
}

// Fetch exactly 6 destinations for this category — 3x2 grid
$destinations = pdo($pdo, 'SELECT a.id, a.title, a.summary, a.created,
                                   i.file AS image_file,
                                   i.alt  AS image_alt
                            FROM   article a
                              LEFT JOIN image i ON a.image_id = i.id
                            WHERE  a.category_id = :id AND a.published = 1
                            ORDER  BY a.created ASC
                            LIMIT  6;',
                    [':id' => $id])->fetchAll();

$title       = html_escape($category['name']) . ' - Digital Travel Guide';
$description = html_escape($category['description']);
$section     = $category['id'];

$navigation = pdo($pdo, 'SELECT id, name FROM category WHERE navigation = 1 ORDER BY id;')->fetchAll();
?>
<?php include 'includes/header.php'; ?>

    <main id="content">
      <div class="container">

        <div class="header">
          <h1><?= html_escape($category['name']) ?></h1>
          <p><?= html_escape($category['description']) ?></p>
        </div>

        <?php if ($destinations) { ?>
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
            </div>
            <p><b><?= html_escape($dest['title']) ?></b></p>
            <p><?= html_escape($dest['summary']) ?></p>
            <p class="date"><?= format_date($dest['created']) ?></p>
          </article>
          <?php } ?>
        </div><!-- /.grid 3x2 -->

        <?php } else { ?>
        <p style="text-align:center; padding: 3em 0;">No destinations found in this category yet.</p>
        <?php } ?>

      </div>
    </main>

<?php include 'includes/footer.php'; ?>
