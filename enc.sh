#!/bin/bash
echo "输入要加密的文件名称，多个文件以空格分隔: "
read filenames

gpg --list-key dongtao > /dev/null 2>&1
if [ $? -ne 0 ]
then
	read -s -n 1 -p "没有找到dt的公钥，尝试导入，按任意键继续"
	echo
	> autodongtaopub.enc
	echo '-----BEGIN PGP PUBLIC KEY BLOCK-----' >> autodongtaopub.asc
	echo '' >> autodongtaopub.asc
	echo 'mQENBF17D78BCADxC9CalFHur3dZhjQq7E7QyRNzOoQscnvkC9jKG03tCOBglG7k' >> autodongtaopub.asc
	echo '6UiNzzibGUSXI+RTzMStfSiIhlN4bCH/4iEbbqkVnlW32zLLo5SnkW3QUN0McebU' >> autodongtaopub.asc
	echo '+LBqBt0WQ3E82R4d3mQmzlUM5LOn3sI7xkqmFhYLtvue8y3iwd5+LF5VU1QkhI+f' >> autodongtaopub.asc
	echo 'tS0nSluIER9r1tD/i+oEn4MHjPQk7AthC1KFkj9qiF7ApGWuAvQKGRPOkybUxrJ6' >> autodongtaopub.asc
	echo 'ZWKHwIblmDpEB0Cu1L7gAX1XyBWzNZrzmqlaUA4y6yaMl/xFiUWnSU8sTEO1ZMjA' >> autodongtaopub.asc
	echo 'LY9efIu38H17H7PNjwp+M8cbovyoMK+dX/B1ABEBAAG0HmRvbmd0YW8gPGRvbmd0' >> autodongtaopub.asc
	echo 'YW9AY3F1cHQuZWR1LmNuPokBTgQTAQgAOBYhBJVvG1V8RlDXXlPHUxZV6gfrmBaW' >> autodongtaopub.asc
	echo 'BQJdew+/AhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEBZV6gfrmBaWtKMI' >> autodongtaopub.asc
	echo 'AOFaSRahi5efpPpgfydjDkvPAYkKhT+AY6dic3+Br5Bpfm1hUryXysYAeNQ5vXMt' >> autodongtaopub.asc
	echo 'oSqPfqhi+vaWGkTVJNL1OpPK+zveg0HIUC908LJZ688ZEzAIkkaWVZ+SmZ/sTFY6' >> autodongtaopub.asc
	echo 'NOC/bSeiVCaXYT7kE2pIhYrv/YRZPUbn/0eas9JMJzFRBfcRKpytpiFfXQV8mpNt' >> autodongtaopub.asc
	echo 'bcpebelR9OvgJZ5ZqQJSRlmXNlXhKv0qM2Ztplgl22xZL2XMg0w8TJx0YupyKVVc' >> autodongtaopub.asc
	echo '4Ty2lO3Fpy5pQFgciAWyz+zqElzR+C6Us18VHG4Zffd99VRGky8lySipcLISzyCD' >> autodongtaopub.asc
	echo 'xFOWN/FYyxsM/i2u/svNene5AQ0EXXsPvwEIAM/uSRgclwT2ShDdI9uBiVjtbZ/H' >> autodongtaopub.asc
	echo 'rvdHhbKME53t4754Nsxcpr8OjcSd67ftC0l9tJ/uLiadQixuIaxKXkCAQ3NdEVqV' >> autodongtaopub.asc
	echo 'wjp3xIDzq3nNLRrvlTyk5LfL8vUrNLO9giqZ8K9iwn1oh2xJbxSEL5NC50eCDMSg' >> autodongtaopub.asc
	echo '7g63ryI2xzhVXizvHkrykjSnSS5vmhnk/KyZ+ciujNsHdpyCw5q7knv2jaDC+ab/' >> autodongtaopub.asc
	echo 'FYbAc+0Yf5JEf24kq8q/kA3JQbBhkXPrefHS/TeBHf7DP1XiXNuVGcY5JBVRufP0' >> autodongtaopub.asc
	echo 'EjuZ64r5iN5JOgNwMwezEI3AeOGk3bcNz6qg0nh97DWVG7Ejm+xv6SAe0NUAEQEA' >> autodongtaopub.asc
	echo 'AYkBNgQYAQgAIBYhBJVvG1V8RlDXXlPHUxZV6gfrmBaWBQJdew+/AhsMAAoJEBZV' >> autodongtaopub.asc
	echo '6gfrmBaWXgIH/3xd7kRu8GG7UBeN8TEFK/uYy1VJMchX412TIAdYjDj2AynKxAJp' >> autodongtaopub.asc
	echo 'M5RBRrQAI1yRRTgJUByxVmRsVKQ828vJV03cpT5y8TdPO5zo6IsQjwdDBZjaJPTh' >> autodongtaopub.asc
	echo '/6PwFC1LO/opOqwenHe8Pt3vKzJpr2m+3/ik86cr5xHgPTqcxqsWeEoq/Fxljogp' >> autodongtaopub.asc
	echo 'U5zaMI/1Xc6p5ni+wp0P7pT2zrj3OaVy+8HouRrbDgpgTAaQZUEYETrlyAFdyk1P' >> autodongtaopub.asc
	echo '+w7Xz6JEIgITGJ3R038C/v3xnIHVHxzolsQarS3DQ2+0/Occn/VClvUllnuIt36K' >> autodongtaopub.asc
	echo '7z+UtGoEibIOBkw/rMmqcmOUpqtevHX+jW4=' >> autodongtaopub.asc
	echo '=FIuU' >> autodongtaopub.asc
	echo '-----END PGP PUBLIC KEY BLOCK-----' >> autodongtaopub.asc
	gpg --import autodongtaopub.asc > /dev/null 2>&1
fi



for filename in $filenames
do
	if [ ! -e $filename ]
	then
		echo "文件$filename不存在"
		continue
	fi

	gpg --encrypt -r dongtao@cqupt.edu.cn --trust-model always $filename
	if [ $? -eq 0 ]
	then
		echo "文件$filename加密成功"
		continue
	fi

	echo "文件$filename加密失败，未知原因"
done

rm autodongtaopub.asc > /dev/null 2>&1
read -s -n 1 -p '加密流程完成，如果要从计算机中移除dt的公钥，在稍后的界面中选y，否则选n。按任意键开始选择'
echo
gpg --delete-keys dongtao
