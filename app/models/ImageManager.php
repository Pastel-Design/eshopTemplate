<?php
namespace app\models;

use app\configs\ImageOptimizerConfig;
require("vendor/autoload.php");
use Intervention\Image\ImageManagerStatic as Image;


/**
 * Class ImageManager
 * @package app\models
 */
class ImageManager
{

// pro více info http://image.intervention.io/getting_started/introduction
    /**
     * Upraví obrázek do výchozího rozlišení definovaného v config file ImageManager.php
     * @param string $imgURL //urlobrázku
     * @return void
     */
    static function defaultImage(string $imgURL) : void
    {
        $img = Image::make($imgURL);

        $height = $img->height();
        $width = $img->width();
        if ($width > $height) { //na šířku
            if ($width > ImageOptimizerConfig::$defaultImageWidth) {
                $img->resize(ImageOptimizerConfig::$defaultImageWidth, null, function ($constraint) {
                    $constraint->aspectRatio();
                });
            } else {
                $img->save($imgURL);
            }
        } else { //na výšku
            if ($height > ImageOptimizerConfig::$defaultImageHeight) {
                $img->resize(null, ImageOptimizerConfig::$defaultImageHeight, function ($constraint) {
                    $constraint->aspectRatio();
                });
            } else {
                $img->save($imgURL);
            }
        }
        $img->save($imgURL);
    }
    /**
     * nakopíruje nový obrázek v rozlišení pro thumbnail definované v config file ImageManager.php do složky thumbnails
     *
     * @param string $imgURL
     * @return void
     */
    static function makeThumbnail(string $imgURL) : void
    {
        $img = Image::make($imgURL);
        $imgName = array_reverse(explode("/", $imgURL))[0];

        $height = $img->height();
        $width = $img->width();
        if ($width > $height) { //na šířku
            if ($width > ImageOptimizerConfig::$thumbnailWidth) {
                $img->resize(ImageOptimizerConfig::$thumbnailWidth, null, function ($constraint) {
                    $constraint->aspectRatio();
                });
            } else {
                $img->save("images/thumbnails/" . $imgName);
            }
        } else { //na výšku
            if ($height > ImageOptimizerConfig::$thumbnailHeight) {
                $img->resize(null, ImageOptimizerConfig::$thumbnailHeight, function ($constraint) {
                    $constraint->aspectRatio();
                });
            } else {
                $img->save("images/thumbnails/" . $imgName);
            }
        }
        $img->save("images/thumbnails/" . $imgName);
    }
}
