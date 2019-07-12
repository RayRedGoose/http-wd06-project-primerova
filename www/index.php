<?php

require 'config.php';
require 'database.php';
require 'libs/functions.php';

$errors = array();
$success = array();

session_start();

// router
$uri = $_SERVER['REQUEST_URI'];
$uri = rtrim($uri, '/');
$uri = filter_var($uri, FILTER_SANITIZE_URL);
$uri = substr($uri, 1);
$uri = explode('?', $uri);

switch ($uri[0]) {
  case '':
    include ROOT . 'modules/main/main.php';
    break;

    // USERS

  case 'login':
    include ROOT . 'modules/login/login.php';
    break;

  case 'registration':
    include ROOT . 'modules/login/registration.php';
    break;

  case 'logout':
    include ROOT . 'modules/login/logout.php';
    break;

  case 'lost-password':
    include ROOT . 'modules/login/lost-password.php';
    break;

  case 'set-new-password':
    include ROOT . 'modules/login/set-new-password.php';
    break;

  case 'profile':
    include ROOT . 'modules/profile/profile.php';
    break;

  case 'profile-edit':
    include ROOT . 'modules/profile/profile-edit.php';
    break;

    // about

  case 'about':
    include ROOT . 'modules/about/about.php';
    break;

	case 'edit-text':
		include ROOT . "modules/about/edit-text.php";
		break;

	case 'edit-skills':
		include ROOT . "modules/about/edit-skills.php";
		break;

	case 'edit-jobs':
		include ROOT . "modules/about/edit-jobs.php";
		break;

  case 'delete-job':
    include ROOT . "modules/about/delete-job.php";
    break;

    // Contacts

  case 'contacts':
    include ROOT . 'modules/contacts/contacts.php';
    break;

  case 'contacts-edit':
    include ROOT . 'modules/contacts/contacts-edit.php';
    break;

  case 'messages':
    include ROOT . 'modules/contacts/messages.php';
    break;

  case 'delete-message':
    include ROOT . 'modules/contacts/delete-message.php';
    break;

    // blog section

  case 'blog':
    include ROOT . 'modules/blog/blog.php';
    break;

  case 'post-new':
    include ROOT . 'modules/blog/post-new.php';
    break;

  case 'post-edit':
    include ROOT . 'modules/blog/post-edit.php';
    break;

  case 'post-delete':
    include ROOT . 'modules/blog/post-delete.php';
    break;

  case 'post':
    include ROOT . 'modules/blog/post.php';
    break;

  case 'delete-comment':
    include ROOT . 'modules/blog/delete-comment.php';
    break;

    // categories

  case 'categories':
  	include ROOT . "modules/categories/all.php";
  	break;

  case 'category-new':
  	include ROOT . "modules/categories/new.php";
  	break;

  case 'category-edit':
  	include ROOT . "modules/categories/edit.php";
  	break;

  case 'category-delete':
  	include ROOT . "modules/categories/delete.php";
  	break;

    // Shop Section

  case 'shop':
    include ROOT . "modules/shop/shop.php";
    break;

  case 'item':
    include ROOT . "modules/shop/item.php";
    break;

  case 'item-new':
    include ROOT . "modules/shop/item-new.php";
    break;

  case 'item-edit':
    include ROOT . "modules/shop/item-edit.php";
    break;

  case 'item-delete':
    include ROOT . "modules/shop/item-delete.php";
    break;

    // cart

  case 'addtocart':
    include ROOT . "modules/cart/add-to-cart.php";
    break;

  case 'cart':
    include ROOT . "modules/cart/cart.php";
    break;

  case 'removefromcart':
    include ROOT . "modules/cart/remove-from-cart.php";
    break;

  default:
    include ROOT . 'modules/error404/error404.php';
    break;
}


?>
