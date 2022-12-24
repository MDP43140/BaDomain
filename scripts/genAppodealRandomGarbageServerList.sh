#!/usr/bin/env bash
#
#  What this script does?
#  it just generate an appodeal shitty fucked servers
#  Btw, apologies if those domains wasn't actually owned by Appodeal or whatever
#  (cuz again we dont know who makes/owns these mysterious domains/websites)
#
#  UPDATE: so i think i know where this domain is produced: libEncryptorP.so
#  Its embedded as shared library on some Android games, especially the one
#  that known to put anti-cheats (in an easy way?)
#

## Configuration ##
#
#clear # disabled by default because it caused some output weirdness when piped to other commands
APD_KNOWN_SUBDOMAIN=(
	"a"
	"x-eu"
	"x-apac"
)
APD_KNOWN_DOMAIN=(
	 "2827e82ca6640ef29594fb288383c901159970954a6ca74d562cd3aa"
	 "2d76ef947212061a3254b5abf6e412a80623ce72dd9fdfce706ce2b9"
	 "3261b6f1aadcad16eb6c015373786fd9ef0e4e2dd7b1ad544e17db83"
	 "360099c2c5edb743b5a2abd52c1941d813efefd1752a7249d54d300c"
	 "479e8d0d656384fb22b087cfaa2334ee02e952cbd52c4db3a089aa14"
	 "4b10e98c641a81c5b43bf484d3d77057505e8229a71e12b491d30c9b"
	 "58dac16e7b2c86c19cfe48914a6e8fcdac9ae06fe5cf53369beaa45b"
	 "5a524551faffc9d5ed5b0f9fb38b5db813cb6ae2946fee336b218ab9"
	 "64e98469810bd13e2b45e52d19d6fddfe333b3528350d8cfa792d478"
	 "655014f4096de8fb469041e2195f59cc9e095e9370a017dbd4ab7fb4"
	 "6984f5d294b35c5575efc0312f3e6e03bbb4437adb0e92f297ec07e1"
	 "8392c6e79df6ad8a3ab1fa972ec327855198c2d4cdf46aacc93d0c76"
	 "a99a6986ec21da4e788175eab688505c303b15e51653736d53df5d6c"
	 "aece742329cf1498efb3307a1222e9419141490a55473ac02ec63e36"
	 "c0095429bf665cd7f772fcfffe07a604076362ff251b9d4466a4afbd"
	 "e93003fd416fd8041330f99e131b03d41b18cd7a62b4b2b398ca8b4f"
	# Domain below is already checked
	# "NONE YET"
	# Domain below is already checked and not exist
	# "09de714eabd2c038e7f1aa172b05a42b6a29611d5643cb2a6464b1fe"
	# "137e82938ec8f951d71b03180c47c2e726cf8857dae8716d8d47613a"
	# "340fddc6b65a2cb7ebc1d79fd21ce12d60aea51d66e2363bfcc2ca0a"
	# "50b9cca5b5e0d6448525d89442cbf7643efb5d52f8d8584ab5a4bc32"
	# "5fcb097b24a36d5711d4315c16ad1b0cb9b3acae90c8d66462893b57"
	# "6dbdbc38a88a7e6316701566b0e7ddf6ddc28bb1c6365e6ead3d8b52"
	# "6f73461aad9ea746094008eb064c6563c81c84ac2da78a312883334b"
	# "71d4bb3c2df5563d0a9771d8a44d6426806c11ecdb41bd614f9dc28c"
	# "74cd18cfa2fb55598ac80eaec537a956b6d536d8b031d4409b97f169"
	# "9838c153324104ebd01be4ed325f374f9845449f97a9998d179005fe"
	# "b21239b48c28b76ab0fadd9390384ca24cfcd6a986907259ad0b9967"
	# "b597b82f9a19736674ea8574aa00f02aaa4e69e585241d73502068b3"
	# "c43a4722a1b8d894d4e56793ae84cf81c28b73e2cf8a1155627cc0dc"
	# "c93eb87839c6be3faf4eec1c4863e043791e3b4c9c40a159812fbc6a"
	# "da01897b05c14537dc666231c5924bdd7ed48855d5c2fbe6f5a4d9c0"
	# "ddc9cb23b6a722f25e78d6979e128d4967e9dfed1506971405cc4845"
	# "e2864a8e02fbe66969e6689343f0bd21cd43cdca2a8ec5f825e35fad"
	# "eb1f496297bccfe372065b770b4089c85356073772b9a425a81ec241"
	# "f18597036f4034883ad83eaeb38250b39241210076555a33a60171b6"
	# "fc4d74be804f943caa3621b864c54ff0d19c0aca87671ceb51aec5e8"
);

for sub in ${APD_KNOWN_SUBDOMAIN[@]};do
	for domain in ${APD_KNOWN_DOMAIN[@]};do
		echo $sub.$domain.com # output example: a.479e{..}aa14.com
	done
done