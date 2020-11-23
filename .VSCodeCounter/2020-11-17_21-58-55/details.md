# Details

Date : 2020-11-17 21:58:55

Directory d:\wamp\www\eshopTemplate

Total : 73 files,  5202 codes, 1378 comments, 648 blanks, all 7228 lines

[summary](results.md)

## Files
| filename | language | code | comment | blank | total |
| :--- | :--- | ---: | ---: | ---: | ---: |
| [.github/workflows/php.yml](/.github/workflows/php.yml) | YAML | 24 | 4 | 10 | 38 |
| [Database/exported_database.sql](/Database/exported_database.sql) | SQL | 618 | 274 | 178 | 1,070 |
| [app/classes/AddressClass.php](/app/classes/AddressClass.php) | PHP | 192 | 65 | 19 | 276 |
| [app/classes/CartClass.php](/app/classes/CartClass.php) | PHP | 19 | 5 | 6 | 30 |
| [app/classes/CategoryClass.php](/app/classes/CategoryClass.php) | PHP | 63 | 38 | 16 | 117 |
| [app/classes/ProductClass.php](/app/classes/ProductClass.php) | PHP | 48 | 5 | 5 | 58 |
| [app/classes/UserClass.php](/app/classes/UserClass.php) | PHP | 194 | 90 | 27 | 311 |
| [app/config/CartConfig.php](/app/config/CartConfig.php) | PHP | 6 | 5 | 1 | 12 |
| [app/config/DbConfig.php](/app/config/DbConfig.php) | PHP | 9 | 5 | 1 | 15 |
| [app/config/FileUploadConfig.php](/app/config/FileUploadConfig.php) | PHP | 13 | 5 | 2 | 20 |
| [app/config/ImageOptimizerConfig.php](/app/config/ImageOptimizerConfig.php) | PHP | 9 | 5 | 2 | 16 |
| [app/config/RegexConfig.php](/app/config/RegexConfig.php) | PHP | 20 | 5 | 1 | 26 |
| [app/config/ZasilkovnaConfig.php](/app/config/ZasilkovnaConfig.php) | PHP | 8 | 5 | 2 | 15 |
| [app/controllers/AccountController.php](/app/controllers/AccountController.php) | PHP | 48 | 19 | 14 | 81 |
| [app/controllers/CategoryController.php](/app/controllers/CategoryController.php) | PHP | 55 | 26 | 12 | 93 |
| [app/controllers/Controller.php](/app/controllers/Controller.php) | PHP | 77 | 59 | 19 | 155 |
| [app/controllers/ErrorController.php](/app/controllers/ErrorController.php) | PHP | 23 | 13 | 4 | 40 |
| [app/controllers/HandleController.php](/app/controllers/HandleController.php) | PHP | 124 | 41 | 12 | 177 |
| [app/controllers/HomeController.php](/app/controllers/HomeController.php) | PHP | 16 | 13 | 4 | 33 |
| [app/controllers/KosikController.php](/app/controllers/KosikController.php) | PHP | 17 | 14 | 6 | 37 |
| [app/controllers/ProductController.php](/app/controllers/ProductController.php) | PHP | 34 | 23 | 7 | 64 |
| [app/controllers/SandboxController.php](/app/controllers/SandboxController.php) | PHP | 36 | 11 | 7 | 54 |
| [app/controllers/SignController.php](/app/controllers/SignController.php) | PHP | 62 | 35 | 12 | 109 |
| [app/exceptions/AddressException.php](/app/exceptions/AddressException.php) | PHP | 6 | 5 | 4 | 15 |
| [app/exceptions/SignException.php](/app/exceptions/SignException.php) | PHP | 6 | 5 | 3 | 14 |
| [app/exceptions/UserException.php](/app/exceptions/UserException.php) | PHP | 6 | 5 | 4 | 15 |
| [app/forms/ChangePassword.php](/app/forms/ChangePassword.php) | PHP | 42 | 16 | 11 | 69 |
| [app/forms/FormFactory.php](/app/forms/FormFactory.php) | PHP | 47 | 12 | 13 | 72 |
| [app/forms/FullSignIn.php](/app/forms/FullSignIn.php) | PHP | 34 | 16 | 11 | 61 |
| [app/forms/FullSignUp.php](/app/forms/FullSignUp.php) | PHP | 115 | 23 | 18 | 156 |
| [app/forms/InvoiceAddress.php](/app/forms/InvoiceAddress.php) | PHP | 72 | 17 | 14 | 103 |
| [app/forms/ShippingAddress.php](/app/forms/ShippingAddress.php) | PHP | 100 | 18 | 16 | 134 |
| [app/models/CartManager.php](/app/models/CartManager.php) | PHP | 152 | 53 | 18 | 223 |
| [app/models/CategoryManager.php](/app/models/CategoryManager.php) | PHP | 56 | 45 | 12 | 113 |
| [app/models/DbManager.php](/app/models/DbManager.php) | PHP | 103 | 74 | 14 | 191 |
| [app/models/FileManager.php](/app/models/FileManager.php) | PHP | 312 | 75 | 12 | 399 |
| [app/models/ImageManager.php](/app/models/ImageManager.php) | PHP | 59 | 22 | 9 | 90 |
| [app/models/ProductManager.php](/app/models/ProductManager.php) | PHP | 188 | 71 | 22 | 281 |
| [app/models/SignManager.php](/app/models/SignManager.php) | PHP | 90 | 59 | 12 | 161 |
| [app/models/UserManager.php](/app/models/UserManager.php) | PHP | 113 | 58 | 11 | 182 |
| [app/router/Router.php](/app/router/Router.php) | PHP | 61 | 27 | 15 | 103 |
| [app/views/@layout.latte](/app/views/@layout.latte) | Latte | 16 | 0 | 4 | 20 |
| [app/views/@layout_plain.latte](/app/views/@layout_plain.latte) | Latte | 9 | 0 | 3 | 12 |
| [app/views/Account/default.latte](/app/views/Account/default.latte) | Latte | 98 | 0 | 7 | 105 |
| [app/views/Category/category_pagination.latte](/app/views/Category/category_pagination.latte) | Latte | 110 | 0 | 0 | 110 |
| [app/views/Category/default.latte](/app/views/Category/default.latte) | Latte | 20 | 0 | 1 | 21 |
| [app/views/Error/400.latte](/app/views/Error/400.latte) | Latte | 5 | 0 | 1 | 6 |
| [app/views/Error/401.latte](/app/views/Error/401.latte) | Latte | 5 | 0 | 1 | 6 |
| [app/views/Error/404.latte](/app/views/Error/404.latte) | Latte | 5 | 0 | 1 | 6 |
| [app/views/Error/405.latte](/app/views/Error/405.latte) | Latte | 5 | 0 | 1 | 6 |
| [app/views/Error/410.latte](/app/views/Error/410.latte) | Latte | 5 | 0 | 1 | 6 |
| [app/views/Error/500.latte](/app/views/Error/500.latte) | Latte | 5 | 0 | 1 | 6 |
| [app/views/Home/default.latte](/app/views/Home/default.latte) | Latte | 7 | 0 | 0 | 7 |
| [app/views/Kosik/default.latte](/app/views/Kosik/default.latte) | Latte | 21 | 0 | 0 | 21 |
| [app/views/Product/default.latte](/app/views/Product/default.latte) | Latte | 29 | 0 | 1 | 30 |
| [app/views/Sandbox/default.latte](/app/views/Sandbox/default.latte) | Latte | 4 | 0 | 0 | 4 |
| [app/views/Sign/In.latte](/app/views/Sign/In.latte) | Latte | 4 | 0 | 0 | 4 |
| [app/views/Sign/Up.latte](/app/views/Sign/Up.latte) | Latte | 4 | 0 | 0 | 4 |
| [app/views/footer.latte](/app/views/footer.latte) | Latte | 3 | 0 | 1 | 4 |
| [app/views/head.latte](/app/views/head.latte) | Latte | 20 | 0 | 0 | 20 |
| [app/views/nav.latte](/app/views/nav.latte) | Latte | 50 | 0 | 2 | 52 |
| [app/views/scripts.latte](/app/views/scripts.latte) | Latte | 12 | 0 | 0 | 12 |
| [app/zasilkovna/uploadPacket.php](/app/zasilkovna/uploadPacket.php) | PHP | 27 | 0 | 8 | 35 |
| [composer.json](/composer.json) | JSON | 15 | 0 | 0 | 15 |
| [composer.lock](/composer.lock) | JSON | 1,199 | 0 | 1 | 1,200 |
| [package-lock.json](/package-lock.json) | JSON | 43 | 0 | 1 | 44 |
| [package.json](/package.json) | JSON | 13 | 0 | 1 | 14 |
| [www/index.php](/www/index.php) | PHP | 32 | 7 | 10 | 49 |
| [www/scripts/ajax.js](/www/scripts/ajax.js) | JavaScript | 29 | 0 | 1 | 30 |
| [www/scripts/ajaxFunctions.js](/www/scripts/ajaxFunctions.js) | JavaScript | 124 | 4 | 12 | 140 |
| [www/scripts/script.js](/www/scripts/script.js) | JavaScript | 0 | 0 | 1 | 1 |
| [www/styles/style.css](/www/styles/style.css) | CSS | 3 | 1 | 2 | 6 |
| [www/styles/style.scss](/www/styles/style.scss) | SCSS | 3 | 0 | 0 | 3 |

[summary](results.md)