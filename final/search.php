<?php
declare(strict_types = 1);
$pdo = require 'includes/database-connection.php';
require 'includes/functions.php';

$term  = filter_input(INPUT_GET, 'term');
$show  = filter_input(INPUT_GET, 'show', FILTER_VALIDATE_INT) ?? 6;
$from  = filter_input(INPUT_GET, 'from', FILTER_VALIDATE_INT) ?? 0;
$count = 0;
$articles = [];

if ($term) {
    $arguments['term1'] = '%' . $term . '%';
    $arguments['term2'] = '%' . $term . '%';
    $arguments['term3'] = '%' . $term . '%';

    $sql = "SELECT COUNT(a.id) FROM article a
             WHERE (a.title   LIKE :term1
                OR  a.summary LIKE :term2
                OR  a.content LIKE :term3)
               AND  a.published = 1;";
    $count = pdo($pdo, $sql, $arguments)->fetchColumn();

    if ($count > 0) {
        $arguments['show'] = $show;
        $arguments['from']  = $from;
        $sql = "SELECT a.id, a.title, a.summary, a.created,
                       a.category_id,
                       c.name      AS category,
                       i.file      AS image_file,
                       i.alt       AS image_alt
                  FROM article     AS a
                  JOIN category    AS c  ON a.category_id = c.id
                  LEFT JOIN image  AS i  ON a.image_id    = i.id
                 WHERE (a.title   LIKE :term1
                    OR  a.summary LIKE :term2
                    OR  a.content LIKE :term3)
                   AND  a.published = 1
              ORDER BY a.created DESC
                 LIMIT :show
                OFFSET :from;";
        $articles = pdo($pdo, $sql, $arguments)->fetchAll();
    }
}

if ($count > $show) {
    $total_pages  = ceil($count / $show);
    $current_page = ceil($from / $show) + 1;
}

$navigation  = pdo($pdo, 'SELECT id, name FROM category WHERE navigation = 1 ORDER BY id;')->fetchAll();
$section     = 0;
$title       = $term ? 'Search results for ' . $term . ' - Digital Travel Guide' : 'Search - Digital Travel Guide';
$description = $term ? 'Search results for ' . $term . ' on Digital Travel Guide' : 'Search destinations on Digital Travel Guide';
?>
<?php include 'includes/header.php'; ?>

    <main id="content">
      <div class="container">

        <div class="header">
          <h1>Search Destinations</h1>
          <form action="search.php" method="get" class="form-search">
            <label for="search"><span>Search for: </span></label>
            <input type="text" name="term" value="<?= html_escape($term) ?>"
                   id="search" placeholder="Enter search term"
            /><input type="submit" value="Search" class="btn btn-search" />
          </form>
          <?php if ($term) { ?>
            <p><b>Matches found:</b> <?= $count ?></p>
          <?php } ?>
        </div>

        <?php if ($articles) { ?>
        <div class="grid">
          <?php foreach ($articles as $article) { ?>
          <article class="summary">
            <div class="card-img-wrap">
              <?php if ($article['image_file']) { ?>
                <img src="uploads/<?= html_escape($article['image_file']) ?>"
                     alt="<?= html_escape($article['image_alt']) ?>">
              <?php } else { ?>
                <img src="img/blank.png" alt="No image available">
              <?php } ?>
              <span class="card-badge"><?= html_escape($article['category']) ?></span>
            </div>
            <p><b><?= html_escape($article['title']) ?></b></p>
            <p><?= html_escape($article['summary']) ?></p>
            <p class="date"><?= format_date($article['created']) ?></p>
          </article>
          <?php } ?>
        </div><!-- /.grid -->

        <?php } elseif ($term) { ?>
          <p style="text-align:center; padding: 3em 0;">No destinations found matching <b><?= html_escape($term) ?></b>.</p>
        <?php } ?>

        <?php if ($count > $show) { ?>
        <nav class="pagination" role="navigation" aria-label="Pagination Navigation">
          <ul>
          <?php for ($i = 1; $i <= $total_pages; $i++) { ?>
            <li>
              <a href="?term=<?= html_escape($term) ?>&show=<?= $show ?>&from=<?= (($i - 1) * $show) ?>"
                 class="btn <?= ($i == $current_page) ? 'active" aria-current="true' : '' ?>">
                <?= $i ?>
              </a>
            </li>
          <?php } ?>
          </ul>
        </nav>
        <?php } ?>

      </div>
    </main>

<?php include 'includes/footer.php'; ?>