<?php

namespace app\models;

use finfo;
use RuntimeException;
use app\config\FileUploadConfig;

/**
 * Manager FileManager
 *
 * @package app\models
 */
class FileManager
{
    /**
     * Processes all uploaded files by its filetype
     *
     * @return string
     */
    static function processFiles()
    {
        $return = array();
        if (!empty($_FILES)) :
            foreach ($_FILES as $upfileName => $upfile) :
                if (is_array($_FILES[$upfileName]["name"])) :
                    foreach ($_FILES[$upfileName]["name"] as $key => $subfile) :
                        array_push($return, self::uploadFileMultiple($upfileName, $key));
                    endforeach;
                else :
                    array_push($return, self::uploadFileSingle($upfileName));
                endif;
            endforeach;
        endif;

        if (!empty($return)) :
            $returnMessage = "";
            foreach ($return as $ret) {
                $returnMessage .= $ret . "<br>";
            }
            return $returnMessage;
        else :
            return "Files uploaded successfully.";
        endif;
    }

    /**
     * Processes file uploaded via input with single file
     *
     * @param $upfileName
     *
     * @return string
     */
    static function uploadFileSingle($upfileName)
    {
        try {
            if (
                !isset($_FILES[$upfileName]['error']) ||
                is_array($_FILES[$upfileName]['error'])
            ) {
                throw new RuntimeException('Invalid parameters.', 1);
            }
            switch ($_FILES[$upfileName]['error']) {
                case UPLOAD_ERR_OK:
                    break;
                case UPLOAD_ERR_NO_FILE:
                    throw new RuntimeException('No file sent.', 1);
                case UPLOAD_ERR_INI_SIZE:
                case UPLOAD_ERR_FORM_SIZE:
                    throw new RuntimeException('Exceeded filesize limit.', 1);
                default:
                    throw new RuntimeException('Unknown errors.', 1);
            }
            if ($_FILES[$upfileName]['size'] > 75000000) {
                throw new RuntimeException('Exceeded filesize limit.', 1);
            }
            $finfo = new finfo(FILEINFO_MIME_TYPE);
            if (false === $ext = array_search(
                    $finfo->file($_FILES[$upfileName]['tmp_name']),
                    FileUploadConfig::$FileUpload,
                    true
                )) {
                throw new RuntimeException('Invalid file format.', 1);
            }
            $type = explode("/", $finfo->file($_FILES[$upfileName]['tmp_name']))[0];

            switch ($type) {
                case "image":
                    if (1 === $uploadError = self::uploadImage($upfileName, $ext)) {
                        return " File: " . $_FILES[$upfileName]["name"] . " failed to upload. " . $uploadError[1];
                    }
                    break;
                case "application":
                    if (1 === $uploadError = self::uploadApplication($upfileName, $ext)) {
                        return " File: " . $_FILES[$upfileName]["name"] . " failed to upload. " . $uploadError[1];
                    }
                    break;
                case "text":
                    if (1 === $uploadError = self::uploadTextfile($upfileName, $ext)) {
                        return " File: " . $_FILES[$upfileName]["name"] . " failed to upload. " . $uploadError[1];
                    }
                    break;
                case "video":
                    if (1 === $uploadError = self::uploadVideo($upfileName, $ext)) {
                        return " File: " . $_FILES[$upfileName]["name"] . " failed to upload. " . $uploadError[1];
                    }
                    break;
                default:
                    return " File: " . $_FILES[$upfileName]["name"] . " failed to upload. " . "Unknown mime type.";
            }
        } catch (RuntimeException $exception) {
            if ($exception->getCode() === 1) {
                return " File: " . $_FILES[$upfileName]["name"] . " failed to upload. " . $exception->getMessage();
            }
        }
    }

    /**
     * Processes file uploaded via input with multiple files
     *
     * @param $upfileName
     * @param $key
     *
     * @return mixed
     */
    static function uploadFileMultiple($upfileName, $key)
    {
        try {
            if (
                !isset($_FILES[$upfileName]['error'][$key]) ||
                is_array($_FILES[$upfileName]['error'][$key])
            ) {
                throw new RuntimeException('Invalid parameters.', 1);
            }
            switch ($_FILES[$upfileName]['error'][$key]) {
                case UPLOAD_ERR_OK:
                    break;
                case UPLOAD_ERR_NO_FILE:
                    throw new RuntimeException('No file sent.', 1);
                case UPLOAD_ERR_INI_SIZE:
                case UPLOAD_ERR_FORM_SIZE:
                    throw new RuntimeException('Exceeded filesize limit.', 1);
                default:
                    throw new RuntimeException('Unknown errors.', 1);
            }
            if ($_FILES[$upfileName]['size'][$key] > 75000000) {
                throw new RuntimeException('Exceeded filesize limit.', 1);
            }
            $finfo = new finfo(FILEINFO_MIME_TYPE);
            if (false === $ext = array_search(
                    $finfo->file($_FILES[$upfileName]['tmp_name'][$key]),
                    FileUploadConfig::$FileUpload,
                    true
                )) {
                throw new RuntimeException('Invalid file format.', 1);
            }
            $type = explode("/", $finfo->file($_FILES[$upfileName]['tmp_name'][$key]))[0];
            switch ($type) {
                case "image":
                    if (1 === $uploadError = self::uploadImage($upfileName, $ext, $key)) {
                        return " File: " . $_FILES[$upfileName]["name"][$key] . " failed to upload. " . $uploadError[1];
                    }
                    break;
                case "application":
                    if (1 === $uploadError = self::uploadApplication($upfileName, $ext, $key)) {
                        return " File: " . $_FILES[$upfileName]["name"][$key] . " failed to upload. " . $uploadError[1];
                    }
                    break;
                case "text":
                    if (1 === $uploadError = self::uploadTextfile($upfileName, $ext, $key)) {
                        return " File: " . $_FILES[$upfileName]["name"][$key] . " failed to upload. " . $uploadError[1];
                    }
                    break;
                case "video":
                    if (1 === $uploadError = self::uploadVideo($upfileName, $ext, $key)) {
                        return " File: " . $_FILES[$upfileName]["name"][$key] . " failed to upload. " . $uploadError[1];
                    }
                    break;
                default:
                    return " File: " . $_FILES[$upfileName]["name"][$key] . " failed to upload. " . "Unknown mime type.";
            }
        } catch (RuntimeException $exception) {
            if ($exception->getCode() === 1) {
                return " File: " . $_FILES[$upfileName]["name"][$key] . " failed to upload. " . $exception->getMessage();
            }
        }
    }

    /**
     * Processes uploaded image
     *
     * @param      $upfileName
     * Uploaded files name
     * @param      $ext
     * Files extension
     * @param null $key
     * Key of uploaded file in array, in case of uploading trough single input-multiple files
     *
     * @return array
     */
    static function uploadImage($upfileName, $ext, $key = null)
    {
        if ($key === null) {
            $fileNameWDir = sprintf(
                'images/fullView/%s.%s',
                sha1_file($_FILES[$upfileName]['tmp_name']),
                $ext
            );
            try {
                if (!move_uploaded_file(
                    $_FILES[$upfileName]['tmp_name'],
                    $fileNameWDir
                )) {
                    throw new RuntimeException('Failed to move uploaded file.', 1);
                }
                ImageManager::defaultImage($fileNameWDir);
                ImageManager::makeThumbnail($fileNameWDir);
                return [0, 'File is uploaded successfully.'];
            } catch (RuntimeException $exception) {
                return [$exception->getCode(), $exception->getMessage()];
            }
        } else {
            $fileNameWDir = sprintf(
                'images/fullView/%s.%s',
                sha1_file($_FILES[$upfileName]['tmp_name'][$key]),
                $ext
            );
            try {
                if (!move_uploaded_file(
                    $_FILES[$upfileName]['tmp_name'][$key],
                    $fileNameWDir
                )) {
                    throw new RuntimeException('Failed to move uploaded file.', 1);
                }
                ImageManager::defaultImage($fileNameWDir);
                ImageManager::makeThumbnail($fileNameWDir);
                return [0, 'File is uploaded successfully.'];
            } catch (RuntimeException $exception) {
                return [$exception->getCode(), $exception->getMessage()];
            }
        }
    }

    /**
     * Processes uploaded Video
     *
     * @param      $upfileName
     * Uploaded files name
     * @param      $ext
     * Files extension
     * @param null $key
     * Key of uploaded file in array, in case of uploading trough single input-multiple files
     *
     * @return array
     */
    static function uploadVideo($upfileName, $ext, $key = null)
    {
        if ($key === null) {
            $fileNameWDir = sprintf(
                'videos/%s.%s',
                sha1_file($_FILES[$upfileName]['tmp_name']),
                $ext
            );
            try {
                if (!move_uploaded_file(
                    $_FILES[$upfileName]['tmp_name'],
                    $fileNameWDir
                )) {
                    throw new RuntimeException('Failed to move uploaded file.', 1);
                }
                //!OPTIMALIZACE VIDEA
                return [0, 'File is uploaded successfully.'];
            } catch (RuntimeException $exception) {
                return [$exception->getCode(), $exception->getMessage()];
            }
        } else {
            $fileNameWDir = sprintf(
                'videos/%s.%s',
                sha1_file($_FILES[$upfileName]['tmp_name'][$key]),
                $ext
            );
            try {
                if (!move_uploaded_file(
                    $_FILES[$upfileName]['tmp_name'][$key],
                    $fileNameWDir
                )) {
                    throw new RuntimeException('Failed to move uploaded file.', 1);
                }
                //!OPTIMALIZACE VIDEA
                return [0, 'File is uploaded successfully.'];
            } catch (RuntimeException $exception) {
                return [$exception->getCode(), $exception->getMessage()];
            }
        }
    }

    /**
     * Processes uploaded appliacation
     *
     * @param      $upfileName
     * Uploaded files name
     * @param      $ext
     * Files extension
     * @param null $key
     * Key of uploaded file in array, in case of uploading trough single input-multiple files
     *
     * @return array
     */
    static function uploadApplication($upfileName, $ext, $key = null)
    {
        if ($key === null) {
            $fileNameWDir = sprintf(
                'files/%s.%s',
                sha1_file($_FILES[$upfileName]['tmp_name']),
                $ext
            );
            try {
                if (!move_uploaded_file(
                    $_FILES[$upfileName]['tmp_name'],
                    $fileNameWDir
                )) {
                    throw new RuntimeException('Failed to move uploaded file.', 1);
                }
                return [0, 'File is uploaded successfully.'];
            } catch (RuntimeException $exception) {
                return [$exception->getCode(), $exception->getMessage()];
            }
        } else {
            $fileNameWDir = sprintf(
                'files/%s.%s',
                sha1_file($_FILES[$upfileName]['tmp_name'][$key]),
                $ext
            );
            try {
                if (!move_uploaded_file(
                    $_FILES[$upfileName]['tmp_name'][$key],
                    $fileNameWDir
                )) {
                    throw new RuntimeException('Failed to move uploaded file.', 1);
                }
                return [0, 'File is uploaded successfully.'];
            } catch (RuntimeException $exception) {
                return [$exception->getCode(), $exception->getMessage()];
            }
        }
    }

    /**
     * Processes uploaded text file
     *
     * @param      $upfileName
     * Uploaded files name
     * @param      $ext
     * Files extension
     * @param null $key
     * Key of uploaded file in array, in case of uploading trough single input-multiple files
     *
     * @return array
     */
    static function uploadTextfile($upfileName, $ext, $key = null)
    {
        if ($key === null) {
            $fileNameWDir = sprintf(
                'files/%s.%s',
                sha1_file($_FILES[$upfileName]['tmp_name']),
                $ext
            );
            try {
                if (!move_uploaded_file(
                    $_FILES[$upfileName]['tmp_name'],
                    $fileNameWDir
                )) {
                    throw new RuntimeException('Failed to move uploaded file.', 1);
                }
                return [0, 'File is uploaded successfully.'];
            } catch (RuntimeException $exception) {
                return [$exception->getCode(), $exception->getMessage()];
            }
        } else {
            $fileNameWDir = sprintf(
                'files/%s.%s',
                sha1_file($_FILES[$upfileName]['tmp_name'][$key]),
                $ext
            );
            try {
                if (!move_uploaded_file(
                    $_FILES[$upfileName]['tmp_name'][$key],
                    $fileNameWDir
                )) {
                    throw new RuntimeException('Failed to move uploaded file.', 1);
                }
                return [0, 'File is uploaded successfully.'];
            } catch (RuntimeException $exception) {
                return [$exception->getCode(), $exception->getMessage()];
            }
        }
    }
}
