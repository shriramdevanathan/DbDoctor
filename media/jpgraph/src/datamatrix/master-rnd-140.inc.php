<?php
/*=======================================================================
// File: 	MASTER-RND-140.INC.PHP
// Description:	Master random bit handling for ECC 000 140
// Created: 	2006-08-19
// Ver:		$Id: master-rnd-140.inc.php 988 2008-03-25 02:50:13Z ljp $
//
// Copyright (c) 2006 Asial Co. Ltd. (Asial USA) All rights reserved.
//========================================================================
*/

class MasterRandom {
    
    // Master random bit stream in Hex as defined in ISO/IEC 16022:2000(E)
    private $iMasterStream = array(
	0x05, 0xff, 0xc7, 0x31, 0x88, 0xa8, 0x83, 0x9c, 0x64, 0x87, 0x9f, 0x64, 0xb3, 0xe0, 0x4d, 0x9c, 0x80, 0x29, 0x3a, 0x90,
	0xb3, 0x8b, 0x9e, 0x90, 0x45, 0xbf, 0xf5, 0x68, 0x4b, 0x08, 0xcf, 0x44, 0xb8, 0xd4, 0x4c, 0x5b, 0xa0, 0xab, 0x72, 0x52,
	0x1c, 0xe4, 0xd2, 0x74, 0xa4, 0xda, 0x8a, 0x08, 0xfa, 0xa7, 0xc7, 0xdd, 0x00, 0x30, 0xa9, 0xe6, 0x64, 0xab, 0xd5, 0x8b,
	0xed, 0x9c, 0x79, 0xf8, 0x08, 0xd1, 0x8b, 0xc6, 0x22, 0x64, 0x0b, 0x33, 0x43, 0xd0, 0x80, 0xd4, 0x44, 0x95, 0x2e, 0x6f,
	0x5e, 0x13, 0x8d, 0x47, 0x62, 0x06, 0xeb, 0x80, 0x82, 0xc9, 0x41, 0xd5, 0x73, 0x8a, 0x30, 0x23, 0x24, 0xe3, 0x7f, 0xb2,
	0xa8, 0x0b, 0xed, 0x38, 0x42, 0x4c, 0xd7, 0xb0, 0xce, 0x98, 0xbd, 0xe1, 0xd5, 0xe4, 0xc3, 0x1d, 0x15, 0x4a, 0xcf, 0xd1,
	0x1f, 0x39, 0x26, 0x18, 0x93, 0xfc, 0x19, 0xb2, 0x2d, 0xab, 0xf2, 0x6e, 0xa1, 0x9f, 0xaf, 0xd0, 0x8a, 0x2b, 0xa0, 0x56,
	0xb0, 0x41, 0x6d, 0x43, 0xa4, 0x63, 0xf3, 0xaa, 0x7d, 0xaf, 0x35, 0x57, 0xc2, 0x94, 0x4a, 0x65, 0x0b, 0x41, 0xde, 0xb8,
	0xe2, 0x30, 0x12, 0x27, 0x9b, 0x66, 0x2b, 0x34, 0x5b, 0xb8, 0x99, 0xe8, 0x28, 0x71, 0xd0, 0x95, 0x6b, 0x07, 0x4d, 0x3c,
	0x7a, 0xb3, 0xe5, 0x29, 0xb3, 0xba, 0x8c, 0xcc, 0x2d, 0xe0, 0xc9, 0xc0, 0x22, 0xec, 0x4c, 0xde, 0xf8, 0x58, 0x07, 0xfc,
	0x19, 0xf2, 0x64, 0xe2, 0xc3, 0xe2, 0xd8, 0xb9, 0xfd, 0x67, 0xa0, 0xbc, 0xf5, 0x2e, 0xc9, 0x49, 0x75, 0x62, 0x82, 0x27,
	0x10, 0xf4, 0x19, 0x6f, 0x49, 0xf7, 0xb3, 0x84, 0x14, 0xea, 0xeb, 0xe1, 0x2a, 0x31, 0xab, 0x47, 0x7d, 0x08, 0x29, 0xac,
	0xbb, 0x72, 0xfa, 0xfa, 0x62, 0xb8, 0xc8, 0xd3, 0x86, 0x89, 0x95, 0xfd, 0xdf, 0xcc, 0x9c, 0xad, 0xf1, 0xd4, 0x6c, 0x64,
	0x23, 0x24, 0x2a, 0x56, 0x1f, 0x36, 0xeb, 0xb7, 0xd6, 0xff, 0xda, 0x57, 0xf4, 0x50, 0x79, 0x08, 0x00);

    private $iChkCRC32 = 0x35c0247d, $iLen=277;
    private $iBitStream = array();

    function MasterRandom() {
	// Check integrity of table so it hasn't been corrupted
	// This is done by calculating the CRC32
	$n = count($this->iMasterStream);
	$s = implode('',$this->iMasterStream);
	$crc32 = crc32($s);
	if( $crc32 != $this->iChkCRC32 || $n != $this->iLen ) {
	    return false;
	}
	// Create the real master bit table
	ByteArray2Bits($this->iMasterStream,$this->iBitStream);
    }

    // Randomize the given data buffer using the master random sequenze
    function Randomize(&$aDataBits) {
	$n = count($aDataBits);
	if( $n > $this->iLen*8 ) {
	    return false;
	}
	for($i=0; $i < $n; ++$i ) {
	    $aDataBits[$i] ^= $this->iBitStream[$i];
	}
	return true;
    }
}

?>
