<?php
require("vendor/autoload.php");

use Intervention\Image\ImageManagerStatic as Image;
// pro více info http://image.intervention.io/getting_started/introduction
class ImageOptimizer
{
    /**
     * Upraví obrázek do výchozího rozlišení definovaného v config file imageResolutions.php
     *
     * @param  $imgURL url obrázku
     *
     * @return void
     */
    static function defaultImage($imgURL)
    {
        $config = include('configs/config.php');
        $img = Image::make($imgURL);

        $height = $img->height();
        $width = $img->width();
        if ($width > $height) { //na šířku
            if ($width > $config->imageResolutions->defaultImageWidth) {
                $img->resize($config->imageResolutions->defaultImageWidth, null, function ($constraint) {
                    $constraint->aspectRatio();
                });
            } else {
                $img->save($imgURL);
            }
        } else { //na výšku
            if ($height > $config->imageResolutions->defaultImageHeight) {
                $img->resize(null, $config->imageResolutions->defaultImageHeight, function ($constraint) {
                    $constraint->aspectRatio();
                });
            } else {
                $img->save($imgURL);
            }
        }
        $img->save($imgURL);
    }
    /**
     * nakopíruje nový obrázek v rozlišení pro thumbnail definované v config file imageResolutions.php do složky thumbnails
     *
     * @param $imgURL
     *
     * @return void
     */
    static function makeThumbnail($imgURL)
    {
        $config = include('configs/config.php');
        $img = Image::make($imgURL);
        $imgName = array_reverse(explode("/", $imgURL))[0];

        $height = $img->height();
        $width = $img->width();
        if ($width > $height) { //na šířku
            if ($width > $config->imageResolutions->thumbnailWidth) {
                $img->resize($config->imageResolutions->thumbnailWidth, null, function ($constraint) {
                    $constraint->aspectRatio();
                });
            } else {
                $img->save("images/thumbnails/" . $imgName);
            }
        } else { //na výšku
            if ($height > $config->imageResolutions->thumbnailHeight) {
                $img->resize(null, $config->imageResolutions->thumbnailHeight, function ($constraint) {
                    $constraint->aspectRatio();
                });
            } else {
                $img->save("images/thumbnails/" . $imgName);
            }
        }
        $img->save("images/thumbnails/" . $imgName);
    }
}
