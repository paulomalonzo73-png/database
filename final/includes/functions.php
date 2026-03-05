<?php
// DATABASE FUNCTION
function pdo(PDO $pdo, string $sql, array $arguments = null)
{
    if (!$arguments) {                    // If no arguments
        return $pdo->query($sql);         // Run SQL and return PDOStatement object
    }
    $statement = $pdo->prepare($sql);     // If arguments prepare statement
    $statement->execute($arguments);      // Execute statement
    return $statement;                    // Return PDOStatement object
}

// FORMATTING FUNCTIONS
function html_escape($text): string
{
    $text = $text ?? ''; // If null set to blank string
    return htmlspecialchars($text, ENT_QUOTES, 'UTF-8', false); // Return escaped string
}

function format_date(string $string): string
{
    $date = date_create_from_format('Y-m-d H:i:s', $string);    // Convert to DateTime object
    return $date->format('F d, Y');                              // Return e.g. January 10, 2024
}

// ERROR AND EXCEPTION HANDLING FUNCTIONS
set_error_handler('handle_error');
function handle_error($error_type, $error_message, $error_file, $error_line)
{
    throw new ErrorException($error_message, 0, $error_type, $error_file, $error_line);
}

set_exception_handler('handle_exception');
function handle_exception($e)
{
    error_log($e);
    http_response_code(500);
    echo "<h1>Sorry, a problem occurred</h1>
          The site's owners have been informed. Please try again later.";
}

register_shutdown_function('handle_shutdown');
function handle_shutdown()
{
    $error = error_get_last();
    if ($error !== null) {
        $e = new ErrorException($error['message'], 0, $error['type'], $error['file'], $error['line']);
        handle_exception($e);
    }
}
