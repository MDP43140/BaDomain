#!/usr/bin/env bash
#
#  What this script does?
#  it just generate an appodeal shitty fucked servers
#  Btw, apologies if those domains wasn't actually owned by Appodeal or whatever
#  (because again i dont know who makes/owns these mysterious domains/websites,
#   but opening one of the domains, there it stated that its owned by Appodeal,
#   so maybe my assumption was right?)
#
#  UPDATE: so i think i know where this domain is produced: An unknown SDK
#  (likely related to anti-cheats, but also spies on its users) that provides
#  libEncryptorP.so. Its embedded as shared library on some Android games.
#  And each time the app SDK is updated, a new domain is generated.
#

## Configuration ##
#
#clear # disabled by default because it caused some output weirdness when piped to other commands
APD_KNOWN_SUBDOMAIN=(
	"a"
	"x-eu"
	"x-us"
	"x-apac"
)
APD_KNOWN_DOMAIN=(
	 "06119add5f6aebd69e3e38a1417fd14972f44442f6828416c46959b1"
	 "2827e82ca6640ef29594fb288383c901159970954a6ca74d562cd3aa"
	 "2d76ef947212061a3254b5abf6e412a80623ce72dd9fdfce706ce2b9"
	 "3261b6f1aadcad16eb6c015373786fd9ef0e4e2dd7b1ad544e17db83"
	 "360099c2c5edb743b5a2abd52c1941d813efefd1752a7249d54d300c"
	 "42cf48acf2019ae2afab75835f085d40d3fed92dc6f79abb80cf30e6"
	 "479e8d0d656384fb22b087cfaa2334ee02e952cbd52c4db3a089aa14"
	 "4b10e98c641a81c5b43bf484d3d77057505e8229a71e12b491d30c9b"
	 "58dac16e7b2c86c19cfe48914a6e8fcdac9ae06fe5cf53369beaa45b"
	 "5a524551faffc9d5ed5b0f9fb38b5db813cb6ae2946fee336b218ab9"
	 "5f154926ee0c17ce06289b7825d08fb877f8ebe8d635b65622ce8a2f"
	 "64e98469810bd13e2b45e52d19d6fddfe333b3528350d8cfa792d478"
	 "655014f4096de8fb469041e2195f59cc9e095e9370a017dbd4ab7fb4"
	 "6984f5d294b35c5575efc0312f3e6e03bbb4437adb0e92f297ec07e1"
	 "8392c6e79df6ad8a3ab1fa972ec327855198c2d4cdf46aacc93d0c76"
	 "85656294e75e19a70450f62acbcbe68420fd28c93647ac9ddc797a0c"
	 "a99a6986ec21da4e788175eab688505c303b15e51653736d53df5d6c"
	 "a9578781b503d168069d979b9403961d411db5f2495fe956cd410157"
	 "aece742329cf1498efb3307a1222e9419141490a55473ac02ec63e36"
	 "c0095429bf665cd7f772fcfffe07a604076362ff251b9d4466a4afbd"
	 "e93003fd416fd8041330f99e131b03d41b18cd7a62b4b2b398ca8b4f"
	 "fbf17cb842e16d4f41b597ad9da38d640f3bf9f526c3553cec2d7a7c"
	# Domain below is already checked
	# "NONE YET"
	# Domain below is already checked and not exist
	# "049724d6b4c327e41096d4593292fd12fc4cfdf47427d8cfe149890a"
	# "09de714eabd2c038e7f1aa172b05a42b6a29611d5643cb2a6464b1fe"
	# "137e82938ec8f951d71b03180c47c2e726cf8857dae8716d8d47613a"
	# "321fed2fdbb0d3ce2f339ca06feadae24fd71677b56e331973989847"
	# "340fddc6b65a2cb7ebc1d79fd21ce12d60aea51d66e2363bfcc2ca0a"
	# "41e0f09ba8d96a062c663d93ddfe744ea69e3287c6be178b2043d0be"
	# "50b9cca5b5e0d6448525d89442cbf7643efb5d52f8d8584ab5a4bc32"
	# "5fcb097b24a36d5711d4315c16ad1b0cb9b3acae90c8d66462893b57"
	# "6dbdbc38a88a7e6316701566b0e7ddf6ddc28bb1c6365e6ead3d8b52"
	# "6f73461aad9ea746094008eb064c6563c81c84ac2da78a312883334b"
	# "710901a11b3279f7caf220cc8df9e1f5ae5ccffc52ca88dddfac0040"
	# "71d4bb3c2df5563d0a9771d8a44d6426806c11ecdb41bd614f9dc28c"
	# "74cd18cfa2fb55598ac80eaec537a956b6d536d8b031d4409b97f169"
	# "9838c153324104ebd01be4ed325f374f9845449f97a9998d179005fe"
	# "a1a7cfd93d56fda1514cf89c4cef6a1974fb53d63fd34017cdda4df8"
	# "b21239b48c28b76ab0fadd9390384ca24cfcd6a986907259ad0b9967"
	# "b597b82f9a19736674ea8574aa00f02aaa4e69e585241d73502068b3"
	# "c43a4722a1b8d894d4e56793ae84cf81c28b73e2cf8a1155627cc0dc"
	# "c93eb87839c6be3faf4eec1c4863e043791e3b4c9c40a159812fbc6a"
	# "da01897b05c14537dc666231c5924bdd7ed48855d5c2fbe6f5a4d9c0"
	# "ddc9cb23b6a722f25e78d6979e128d4967e9dfed1506971405cc4845"
	# "e2864a8e02fbe66969e6689343f0bd21cd43cdca2a8ec5f825e35fad"
	# "eb1f496297bccfe372065b770b4089c85356073772b9a425a81ec241"
	# "ed8fe9b47cb69f1f164c87b9f107008e97437635fde8d59487a2d05b"
	# "f18597036f4034883ad83eaeb38250b39241210076555a33a60171b6"
	# "fc4d74be804f943caa3621b864c54ff0d19c0aca87671ceb51aec5e8"
);

for sub in ${APD_KNOWN_SUBDOMAIN[@]};do
	for domain in ${APD_KNOWN_DOMAIN[@]};do
		echo $sub.$domain.com # output example: a.479e{..}aa14.com
	done
done