default:
	cat makefile

clean:
	rm -rf _posts
	git checkout -f _posts

pub:
	make clean
	git add .
	sleep 5
	git commit -am 'update'
	git push
