<?php

class FileUpload
{
    static function uploadSingleFile()
    {        
        $config = include('configs/config.php');
        var_dump($_FILES);
        try {
            // Undefined | Multiple Files | $_FILES Corruption Attack
            // If this request falls under any of them, treat it invalid.
            if (
                !isset($_FILES['upfile']['error']) ||
                is_array($_FILES['upfile']['error'])
            ) {
                throw new RuntimeException('Invalid parameters.', 1);
            }
            // Check $_FILES['upfile']['error'] value.
            switch ($_FILES['upfile']['error']) {
                case UPLOAD_ERR_OK:
                    break;
                case UPLOAD_ERR_NO_FILE:
                    throw new RuntimeException('No file sent.', 2);
                case UPLOAD_ERR_INI_SIZE:
                case UPLOAD_ERR_FORM_SIZE:
                    throw new RuntimeException('Exceeded filesize limit.', 3);
                default:
                    throw new RuntimeException('Unknown errors.', 4);
            }
            // You should also check filesize here.
            if ($_FILES['upfile']['size'] > 75000000) {
                throw new RuntimeException('Exceeded filesize limit.', 5);
            }


            // DO NOT TRUST $_FILES['upfile']['mime'] VALUE !!
            // Check MIME Type by yourself.
            $finfo = new finfo(FILEINFO_MIME_TYPE);
            var_dump($finfo->file($_FILES['upfile']['tmp_name']));
            if (false === $ext = array_search(
                $finfo->file($_FILES['upfile']['tmp_name']),
                $config->mimeTypes,
                true
            )) {
                throw new RuntimeException('Invalid file format.', 6);
            }

        } catch (RuntimeException $e) {
            return [$e->getCode(), $e->getMessage()];
        }
    }
    static function uploadSingleImage()
    {
        try {
            // Undefined | Multiple Files | $_FILES Corruption Attack
            // If this request falls under any of them, treat it invalid.
            if (
                !isset($_FILES['upfile']['error']) ||
                is_array($_FILES['upfile']['error'])
            ) {
                throw new RuntimeException('Invalid parameters.', 1);
            }
            // Check $_FILES['upfile']['error'] value.
            switch ($_FILES['upfile']['error']) {
                case UPLOAD_ERR_OK:
                    break;
                case UPLOAD_ERR_NO_FILE:
                    throw new RuntimeException('No file sent.', 2);
                case UPLOAD_ERR_INI_SIZE:
                case UPLOAD_ERR_FORM_SIZE:
                    throw new RuntimeException('Exceeded filesize limit.', 3);
                default:
                    throw new RuntimeException('Unknown errors.', 4);
            }
            // You should also check filesize here.
            if ($_FILES['upfile']['size'] > 75000000) {
                throw new RuntimeException('Exceeded filesize limit.', 5);
            }
            // DO NOT TRUST $_FILES['upfile']['mime'] VALUE !!
            // Check MIME Type by yourself.
            $finfo = new finfo(FILEINFO_MIME_TYPE);
            if (false === $ext = array_search(
                $finfo->file($_FILES['upfile']['tmp_name']),
                array(
                    'jpg' => 'image/jpeg',
                    'png' => 'image/png',
                    'gif' => 'image/gif',
                ),
                true
            )) {
                throw new RuntimeException('Invalid file format.', 6);
            }
            // You should name it uniquely.
            // DO NOT USE $_FILES['upfile']['name'] WITHOUT ANY VALIDATION !!
            // On this example, obtain safe unique name from its binary data.
            $fileNameWDir = sprintf(
                'images/fullView/%s.%s',
                sha1_file($_FILES['upfile']['tmp_name']),
                $ext
            );
            if (!move_uploaded_file(
                $_FILES['upfile']['tmp_name'],
                $fileNameWDir
            )) {
                throw new RuntimeException('Failed to move uploaded file.', 7);
            }

            ImageOptimizer::defaultImage($fileNameWDir);
            ImageOptimizer::makeThumbnail($fileNameWDir);

            return [0, 'File is uploaded successfully.'];
        } catch (RuntimeException $e) {
            return [$e->getCode(), $e->getMessage()];
        }
    }
    static function uploadMultipleImages(){

    }
}
