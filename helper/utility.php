<?php
  require_once('JWT.php');
  $cryptKey  = 'Chu48firelsaelkkqJB0rGtIn5UB1xG03efd';

  class Utility {
    public function JWT_decode($token)
    {
      try {
        return JWT::decode($token, 'secret_server_key');
      } catch (Exception $e) {
        return null;
      }
    }
    public function JWT_encode($object)
    {
      return JWT::encode($object, 'secret_server_key');
    }

    public function encryptIt( $q ) {
      $qEncoded      = base64_encode( mcrypt_encrypt( MCRYPT_RIJNDAEL_256, md5( $cryptKey ), $q, MCRYPT_MODE_CBC, md5( md5( $cryptKey ) ) ) );
      return( $qEncoded );
    }

    public function decryptIt( $q ) {
      $qDecoded      = rtrim( mcrypt_decrypt( MCRYPT_RIJNDAEL_256, md5( $cryptKey ), base64_decode( $q ), MCRYPT_MODE_CBC, md5( md5( $cryptKey ) ) ), "\0");
      return( $qDecoded );
    }

    public function IsNullOrEmptyString($str){
      return (!isset($str) || trim($str) === '');
    }
  }
?>